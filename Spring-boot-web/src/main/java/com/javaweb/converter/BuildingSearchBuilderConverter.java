package com.javaweb.converter;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class BuildingSearchBuilderConverter {

    public BuildingSearchBuilder toBuildingSearchBuilder(BuildingSearchRequest buildingSearchRequest) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .name(MapUtils.getObject(buildingSearchRequest.getName(), String.class))
                .district(MapUtils.getObject(buildingSearchRequest.getDistrict(), String.class))
                .direction(MapUtils.getObject(buildingSearchRequest.getDirection(), String.class))
                .floorArea(MapUtils.getObject(buildingSearchRequest.getFloorArea(), Long.class))
                .level(MapUtils.getObject(buildingSearchRequest.getLevel(), String.class))
                .managername(MapUtils.getObject(buildingSearchRequest.getManagerName(), String.class))
                .managerphone(MapUtils.getObject(buildingSearchRequest.getManagerPhone(), String.class))
                .numberOfBasement(MapUtils.getObject(buildingSearchRequest.getNumberOfBasement(), String.class))
                .rentAreaFrom(MapUtils.getObject(buildingSearchRequest.getRentAreaFrom(), Long.class))
                .rentAreaTo(MapUtils.getObject(buildingSearchRequest.getRentAreaTo(), Long.class))
                .rentPriceFrom(MapUtils.getObject(buildingSearchRequest.getRentPriceFrom(), Long.class))
                .rentPriceTo(MapUtils.getObject(buildingSearchRequest.getRentPriceTo(), Long.class))
                .staffId(MapUtils.getObject(buildingSearchRequest.getStaffId(), Long.class))
                .ward(MapUtils.getObject(buildingSearchRequest.getWard(), String.class))
                .street(MapUtils.getObject(buildingSearchRequest.getStreet(), String.class))

                .typeCode(buildingSearchRequest.getTypeCode())
                .build();
        return buildingSearchBuilder;

    }
}

