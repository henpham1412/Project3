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

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse convertEntityToResponse(BuildingEntity  buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        String districtName = District.getNameByCode(buildingEntity.getDistrict());
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtName);
        List<RentAreaEntity> areaEntityList = buildingEntity.getRentAreaEntities();
        String areaResult = areaEntityList.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingSearchResponse.setRentArea(areaResult);
        return  buildingSearchResponse;
    }
    public BuildingDTO convertEntityToDTO(BuildingEntity  buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity>  rentAreas = buildingEntity.getRentAreaEntities();
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
        return buildingDTO;
    }

    public BuildingEntity convertDTOToEntity(BuildingDTO  buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        return buildingEntity;
    }
}
