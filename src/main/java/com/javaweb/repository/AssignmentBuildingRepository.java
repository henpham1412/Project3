package com.javaweb.repository;

import com.javaweb.entity.AssignmentBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity,Long> {
    List<AssignmentBuildingEntity> findAllByBuildingEntity_Id(Long buildingId);
    @Modifying
    void deleteByBuildingEntity_IdIn(List<Long> buildingIds);
}
