package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import com.javaweb.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository  userRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private AssignmentBuildingService  assignmentBuildingService;

    @Autowired
    private RentAreaService rentAreaService;


    public static final String UPLOAD_DIRECTORY = "D:/spring/Project-spring-boot-web/images";

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndUserRoleEntitiesRolesCode(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity staff : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(staff.getFullName());
            staffResponseDTO.setStaffId(staff.getId());
            if (staffAssignment.contains(staff)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOList.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOList);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public Page<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        Page<BuildingEntity> buildingEntities = buildingRepository.getBuildingEntities(buildingSearchRequest, pageable);
//        List<BuildingSearchResponse> buildingSearchResponseList = new ArrayList<>();
//        for (BuildingEntity buildingEntity : buildingEntities) {
//            BuildingSearchResponse buildingSearchResponse = buildingConverter.convertEntityToResponse(buildingEntity);
//            buildingSearchResponseList.add(buildingSearchResponse);
//        }
        Page<BuildingSearchResponse> responsePage = buildingEntities.map(
                buildingEntity -> buildingConverter.convertEntityToResponse(buildingEntity)
        );
        return responsePage;
    }

    @Transactional
    @Override
    public void addBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertDTOToEntity(buildingDTO);

        String oldAvatarPath = null; // Biến để lưu đường dẫn ảnh cũ

        // --- 1. KIỂM TRA CẬP NHẬT VÀ LẤY ẢNH CŨ ---
        // Nếu đây là CẬP NHẬT (có ID), ta phải giữ lại ảnh CŨ
        if (buildingDTO.getId() != null) {
            // Tải entity cũ LÊN BIẾN MỚI
            // (Lưu ý: nên dùng orElse(null) thay vì .get() để tránh lỗi)
            BuildingEntity oldBuilding = buildingRepository.findById(buildingDTO.getId()).orElse(null);
            if (oldBuilding != null) {
                oldAvatarPath = oldBuilding.getAvatar(); // Lấy đường dẫn ảnh cũ
            }
        }

        // --- 2. XỬ LÝ ẢNH MỚI (NẾU CÓ) ---
        String base64Image = buildingDTO.getImageBase64();

        if (StringUtils.check(base64Image)) { // CÓ ẢNH MỚI
            try {
                // A. Xóa ảnh cũ (nếu có)
                if (StringUtils.check(oldAvatarPath)) {
                    deleteImage(oldAvatarPath);
                }

                // B. Lưu ảnh MỚI và lấy đường dẫn mới
                String newImagePath = saveImage(base64Image);
                buildingEntity.setAvatar(newImagePath);

            } catch (IOException e) {
                e.printStackTrace();
                throw new RuntimeException("Không thể lưu ảnh!");
            }
        } else { // KHÔNG CÓ ẢNH MỚI
            // Gán avatar cũ (đã lấy ở bước 1) vào entity sắp save
            buildingEntity.setAvatar(oldAvatarPath);
        }

        buildingRepository.save(buildingEntity);
        rentAreaService.addRentArea(buildingDTO, buildingEntity);
    }

    private String saveImage(String base64Image) throws IOException {
        String[] parts = base64Image.split(",");
        String imageHeader = parts[0];
        String imageData = parts[1];

        String extension;
        if (imageHeader.contains("image/jpeg")) {
            extension = "jpg";
        } else if (imageHeader.contains("image/png")) {
            extension = "png";
        } else {
            extension = "jpg"; // Mặc định
        }

        byte[] imageBytes = Base64.getDecoder().decode(imageData);
        String fileName = "building-" + System.nanoTime() + "." + extension;
        Path imagePath = Paths.get(UPLOAD_DIRECTORY, fileName);
        Files.write(imagePath, imageBytes);

        return "/images/" + fileName; // Trả về đường dẫn web
    }

    // --- HÀM HELPER MỚI ĐỂ XÓA ẢNH ---
    private void deleteImage(String relativeImagePath) {
        if (!StringUtils.check(relativeImagePath)) {
            return;
        }
        try {
            // relativeImagePath là "/images/ten_file.jpg"
            // Lấy tên file
            String fileName = relativeImagePath.substring(relativeImagePath.lastIndexOf("/") + 1);

            // Tạo đường dẫn vật lý đầy đủ
            Path physicalPath = Paths.get(UPLOAD_DIRECTORY, fileName);

            // Xóa file nếu nó tồn tại
            Files.deleteIfExists(physicalPath);
        } catch (IOException e) {
            e.printStackTrace(); // Ghi log lỗi, nhưng không dừng chương trình
        }
    }

    @Transactional
    @Override
    public void deleteBuilding(List<Long> ids) {
        assignmentBuildingService.deleteAssignmentBuilding(ids);
        rentAreaService.deleteRentArea(ids);
        buildingRepository.deleteByIdIn(ids);
    }

    @Override
    public BuildingDTO findBuilding(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.convertEntityToDTO(buildingEntity);
        return buildingDTO;
    }

    @Transactional
    @Override
    public void assignBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        assignmentBuildingService.addAssignmentBuilding(assignmentBuildingDTO, buildingEntity);
    }
}
