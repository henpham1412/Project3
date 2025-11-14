package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity,Long> {
    List<RentAreaEntity> findAllByBuildingList_Id(Long buildingId);
    @Modifying
        // Báo cho Spring biết đây là query thay đổi dữ liệu
    void deleteByBuildingList_IdIn(List<Long> buildingIds);
}
