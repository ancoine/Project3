package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
@Getter
@Setter
public class BuildingSearchRequest extends AbstractDTO {
    private String name;
    private Long floorArea;
    private String district;
    private String ward;
    private String street;
    private Long numberOfBasement;
    private String direction;
    private Long level;
    private Long rentAreaFrom;
    private Long rentAreaTo;
    private String  rentPriceFrom;
    private String  rentPriceTo;
    private String managerName;
    private String managerPhone;
    private Long staffId;
    private List<String> typeCode;




}
