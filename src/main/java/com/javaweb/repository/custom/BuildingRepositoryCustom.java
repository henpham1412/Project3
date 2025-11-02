package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;

@Repository
public interface BuildingRepositoryCustom {
    Page<BuildingEntity> getBuildingEntities(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
}
