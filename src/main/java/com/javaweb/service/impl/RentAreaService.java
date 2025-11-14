package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.IRentAreaService;
import com.javaweb.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class RentAreaService implements IRentAreaService {

    @Autowired
    private RentAreaRepository rentAreaRepository;


    @Override
    public void addRentArea(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        if (buildingDTO.getId() != null) {
            // Đây là CẬP NHẬT
            // 1. Tìm tất cả RentArea cũ
            List<RentAreaEntity> oldRentAreas = rentAreaRepository.findAllByBuildingList_Id(buildingDTO.getId());

            // 2. Xóa tất cả RentArea cũ
            rentAreaRepository.deleteAll(oldRentAreas);
        }
        String rentAreaStr = buildingDTO.getRentArea();
        if (StringUtils.check(rentAreaStr)) {
            List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
            String[] areas = rentAreaStr.split(",");
            for (String areaValue : areas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(areaValue.trim()));
                rentAreaEntity.setBuildingList(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
            rentAreaRepository.saveAll(rentAreaEntities);
        }
    }

    @Override
    public void deleteRentArea(List<Long> ids) {
        rentAreaRepository.deleteByBuildingList_IdIn(ids);
    }
}
