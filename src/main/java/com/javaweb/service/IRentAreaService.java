package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IRentAreaService {
    void addRentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity);
    void deleteRentArea(List<Long> ids);
}
