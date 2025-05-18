package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import com.javaweb.enums.districtCode;
@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    //dto => entity
    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO result = modelMapper.map(buildingEntity, BuildingDTO.class);

        // Giữ nguyên district vì đã map rồi, nhưng nếu bạn muốn chắc chắn có thể set lại
        result.setDistrict(buildingEntity.getDistrict());

        // Chuyển String typeCode (vd: "A,B,C") thành List<String>
        if (buildingEntity.getTypeCode() != null && !buildingEntity.getTypeCode().isEmpty()) {
            List<String> typeCodeList = Arrays.stream(buildingEntity.getTypeCode().split(","))
                    .map(String::trim) // loại bỏ khoảng trắng nếu có
                    .collect(Collectors.toList());
            result.setTypeCode(typeCodeList);
        } else {
            result.setTypeCode(Collections.emptyList());
        }

        return result;
    }
    // entity => dto
    public BuildingEntity toBuildingEntity(BuildingDTO building) {

        System.out.println("DEBUG - buildingDTO id = " + building.getId());
        BuildingEntity results = modelMapper.map(building, BuildingEntity.class);
        String typeCode = building.getTypeCode().stream().map(x -> x.toString()).collect(Collectors.joining(","));
        results.setTypeCode(typeCode);
        return results;
    }

    public BuildingSearchResponse toBuildingSearchResponseDTO(BuildingEntity it) {
        BuildingSearchResponse buildingResponse = modelMapper.map(it, BuildingSearchResponse.class);

        buildingResponse.setAddress(it.getStreet() + ", " + it.getWard() + ", " + districtCode.getDistrict().get(it.getDistrict()));

        String rentalAreaJson = it.getRentAreas().stream()
                .map(i -> i.getValue().toString())
                .collect(Collectors.joining(","));
        buildingResponse.setRentArea(rentalAreaJson);

        return buildingResponse;
    }
}
