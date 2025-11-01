package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest);
    void addBuilding(BuildingDTO  buildingDTO);
    void deleteBuilding(List<Long> ids);
    BuildingDTO findBuilding(Long id);
    void assignBuilding(AssignmentBuildingDTO  assignmentBuildingDTO);
}
