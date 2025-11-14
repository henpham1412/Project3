package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IAssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssignmentBuildingService implements IAssignmentBuildingService {

    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private UserService userService;

    @Override
    public void addAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO, BuildingEntity buildingEntity) {
        List<AssignmentBuildingEntity> assignmentBuildingEntities = assignmentBuildingRepository.findAllByBuildingEntity_Id(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingRepository.deleteAll(assignmentBuildingEntities);
        List<AssignmentBuildingEntity> assignBuildingEntities = new ArrayList<>();
        List<UserEntity> userEntities = new ArrayList<>();
        List<Long> staffIds = assignmentBuildingDTO.getStaffs();
        for (Long staffId : staffIds) {
            userEntities.add(userService.findById(staffId));
        }
        for (UserEntity userEntity : userEntities) {
            AssignmentBuildingEntity assignmentBuildingEntity = new AssignmentBuildingEntity();
            assignmentBuildingEntity.setBuildingEntity(buildingEntity);
            assignmentBuildingEntity.setUserEntity(userEntity);
            assignBuildingEntities.add(assignmentBuildingEntity);
        }
        assignmentBuildingRepository.saveAll(assignBuildingEntities);
    }

    @Override
    public void deleteAssignmentBuilding(List<Long> ids) {
        assignmentBuildingRepository.deleteByBuildingEntity_IdIn(ids);
    }
}
