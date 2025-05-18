package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;

@Transactional

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    @Modifying
    void deleteByBuildingEntity(BuildingEntity buildingEntity);

    void deleteByBuildingEntity_IdIn(List<Long> ids);
}
