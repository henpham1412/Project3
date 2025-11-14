package com.javaweb.service;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IAssignmentBuildingService {
    void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO, BuildingEntity buildingEntity);
    void deleteAssignmentBuilding(List<Long> ids);
}
