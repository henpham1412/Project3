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
    private RentAreaRepository rentAreaRepository;

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

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

        String base64Image = buildingDTO.getImageBase64();
        if (StringUtils.check(base64Image)) {
            try {
                // Gọi hàm helper để lưu ảnh và lấy đường dẫn
                String imagePath = saveImage(base64Image);

                // 3. Gán đường dẫn vào Entity
                buildingEntity.setAvatar(imagePath);
            } catch (IOException e) {
                // Xử lý lỗi nếu không lưu được ảnh
                e.printStackTrace();
                // Bạn có thể ném ra một lỗi ở đây để transaction rollback
                throw new RuntimeException("Không thể lưu ảnh!");
            }
        }

        if (buildingDTO.getId() != null) {
            // Đây là CẬP NHẬT
            // 1. Tìm tất cả RentArea cũ
            List<RentAreaEntity> oldRentAreas = rentAreaRepository.findAllByBuildingList_Id(buildingDTO.getId());

            // 2. Xóa tất cả RentArea cũ
            rentAreaRepository.deleteAll(oldRentAreas);
        }

        buildingRepository.save(buildingEntity);
        String rentAreaStr = buildingDTO.getRentArea();
        if (StringUtils.check(rentAreaStr)) {
            List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
            String[] areas = rentAreaStr.split(",");
            for (String areaValue : areas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(areaValue.trim()));
                rentAreaEntity.setBuildingList(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
            rentAreaRepository.saveAll(rentAreaEntities);
        }
    }

    private String saveImage(String base64Image) throws IOException {
        // ... (Code tách chuỗi và lấy extension) ...
        String[] parts = base64Image.split(",");
        String imageHeader = parts[0]; // "data:image/jpeg;base64"
        String imageData = parts[1]; // "iVBORw0KGgoAAAANSUhEUg..."

        // Lấy định dạng file (ví dụ: "jpeg")
        String extension;
        if (imageHeader.contains("image/jpeg")) {
            extension = "jpg";
        } else if (imageHeader.contains("image/png")) {
            extension = "png";
        } else {
            extension = "jpg"; // Mặc định
        }
        // Decode Base64
        byte[] imageBytes = Base64.getDecoder().decode(imageData);

        // Tạo tên file duy nhất
        String fileName = "building-" + System.nanoTime() + "." + extension;

        // Tạo đường dẫn đầy đủ
        Path imagePath = Paths.get(UPLOAD_DIRECTORY, fileName);

        // Viết file vào ổ đĩa
        Files.write(imagePath, imageBytes);

        // Trả về đường dẫn TƯƠNG ĐỐI (để lưu vào CSDL)
        // SỬA LẠI ĐÂY (bỏ /building)
        return "/images/" + fileName;
    }

    @Transactional
    @Override
    public void deleteBuilding(List<Long> ids) {
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
        List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findAllByBuildingEntity_Id(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingRepository.deleteAll(assignmentBuildingEntities);
        List<AssignmentBuildingEntity> assignBuildingEntities = new ArrayList<>();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntities = new ArrayList<>();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        for (Long staffId : staffIds) {
            userEntities.add(userRepository.findById(staffId).get());
        }
        for (UserEntity userEntity : userEntities) {
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuildingEntity(buildingEntity);
            assignmentBuildingEntity.setUserEntity(userEntity);
            assignBuildingEntities.add(assignmentBuildingEntity);
        }
        assignmentBuildingRepository.saveAll(assignBuildingEntities);
    }
}
