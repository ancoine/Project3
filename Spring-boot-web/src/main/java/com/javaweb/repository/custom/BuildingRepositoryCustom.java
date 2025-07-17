package com.javaweb.repository.custom;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {

    List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder, Pageable pageable);

    int countTotalItem(BuildingSearchRequest buildingSearchRequest);
}
