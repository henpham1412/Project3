package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;


@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    public BuildingSearchResponse convert(BuildingEntity  buildingEntity) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        buildingSearchResponse.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + buildingEntity.getDistrict());
        List<RentAreaEntity> areaEntityList = buildingEntity.getRentAreaEntities();
        String areaResult = areaEntityList.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingSearchResponse.setRentArea(areaResult);
        return  buildingSearchResponse;
    }
}
