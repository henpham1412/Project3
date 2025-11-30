package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IRentAreaService {
    List<RentAreaEntity> getListRentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity) throws  Exception;
    void deleteRentArea(List<Long> ids);
}
