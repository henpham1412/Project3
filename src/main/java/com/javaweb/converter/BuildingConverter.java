package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.utils.StringUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public static final String UPLOAD_DIRECTORY = "D:/spring/Project-spring-boot-web/images";

    public BuildingSearchResponse convertEntityToResponse(BuildingEntity buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        String districtName = District.getNameByCode(buildingEntity.getDistrict());
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtName);
        List<RentAreaEntity> areaEntityList = buildingEntity.getRentAreaEntities();
        String areaResult = areaEntityList.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingSearchResponse.setRentArea(areaResult);
        return  buildingSearchResponse;
    }
    public BuildingDTO convertEntityToDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String rentAreaStr = rentAreas.stream().
                map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingDTO.setRentArea(rentAreaStr);

        String typeCodes = buildingEntity.getTypeCode();
        if (StringUtils.check(typeCodes)) {
            if (typeCodes.charAt(0) == '[') {
                typeCodes = typeCodes.substring(1, typeCodes.length() - 1);
            }
            String[] typeCodesArr = typeCodes.split(",");
            List<String> codes = new ArrayList<>();
            for (String typeCode : typeCodesArr) {
                codes.add(typeCode.trim());
            }
            buildingDTO.setTypeCode(codes);
        }

        String avatarPath = buildingEntity.getAvatar(); // Lấy đường dẫn (vd: /images/img.jpg)

        if (StringUtils.check(avatarPath)) {
            try {
                // Phải bỏ dấu "/" ở đầu path để ghép với UPLOAD_DIRECTORY
                String fileName = avatarPath.substring(avatarPath.lastIndexOf("/") + 1);

                // Tạo đường dẫn vật lý đầy đủ
                Path physicalPath = Paths.get(UPLOAD_DIRECTORY, fileName);

                if (Files.exists(physicalPath)) {
                    // 1. Đọc file ảnh thành byte[]
                    byte[] imageBytes = Files.readAllBytes(physicalPath);

                    // 2. Mã hóa (encode) thành Base64
                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                    // 3. Lấy định dạng ảnh (png/jpg) để tạo header
                    String fileType = Files.probeContentType(physicalPath); // vd: "image/jpeg"

                    // 4. Gán vào DTO (gồm cả header)
                    buildingDTO.setImageBase64("data:" + fileType + ";base64," + base64Image);
                    buildingDTO.setImageName(fileName);
                }

            } catch (Exception e) {
                e.printStackTrace();
                // Không tìm thấy ảnh thì thôi
            }
        }

        return buildingDTO;
    }

    public BuildingEntity convertDTOToEntity(BuildingDTO  buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        return buildingEntity;
    }
}
