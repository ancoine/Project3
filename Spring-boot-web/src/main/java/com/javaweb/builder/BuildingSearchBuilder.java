package com.javaweb.builder;

import java.util.List;

public class BuildingSearchBuilder {
    private String name;
    private Long floorArea;
    private String district;
    private String ward;
    private String street;
    private String numberOfBasement;
    private String direction;
    private String level;
    private Long rentPriceFrom;
    private Long rentPriceTo;
    private Long rentAreaFrom;
    private Long rentAreaTo;
    private String managername;
    private String managerphone;
    private Long staffId;
    private List<String> typeCode;

    private BuildingSearchBuilder(Builder builder) {
        this.name = builder.name;
        this.floorArea = builder.floorArea;
        this.district = builder.district;
        this.ward = builder.ward;
        this.street = builder.street;
        this.numberOfBasement = builder.numberOfBasement;
        this.direction = builder.direction;
        this.level = builder.level;
        this.rentPriceFrom = builder.rentPriceFrom;
        this.rentPriceTo = builder.rentPriceTo;
        this.rentAreaFrom = builder.rentAreaFrom;
        this.rentAreaTo = builder.rentAreaTo;
        this.managername = builder.managername;
        this.managerphone = builder.managerphone;
        this.staffId = builder.staffId;
        this.typeCode = builder.typeCode;
    }


    public String getName() {
        return name;
    }


    public Long getFloorArea() {
        return floorArea;
    }


    public String getDistrict() {
        return district;
    }


    public String getWard() {
        return ward;
    }


    public String getStreet() {
        return street;
    }


    public String getNumberOfBasement() {
        return numberOfBasement;
    }


    public String getDirection() {
        return direction;
    }


    public String getLevel() {
        return level;
    }


    public Long getRentPriceFrom() {
        return rentPriceFrom;
    }


    public Long getRentPriceTo() {
        return rentPriceTo;
    }


    public Long getRentAreaFrom() {
        return rentAreaFrom;
    }


    public Long getRentAreaTo() {
        return rentAreaTo;
    }


    public String getManagername() {
        return managername;
    }


    public String getManagerphonenumber() {
        return managerphone;
    }


    public Long getStaffId() {
        return staffId;
    }


    public List<String> getTypeCode() {
        return typeCode;
    }


    public static class Builder {
        private String name;
        private Long floorArea;
        private String district;
        private String ward;
        private String street;
        private String numberOfBasement;
        private String direction;
        private String level;
        private Long rentPriceFrom;
        private Long rentPriceTo;
        private Long rentAreaFrom;
        private Long rentAreaTo;
        private String managername;
        private String managerphone;
        private Long staffId;
        private List<String> typeCode;

        public Builder name(String name) {
            this.name = name;
            return this;
        }

        public Builder floorArea(Long floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public Builder district(String district) {
            this.district = district;
            return this;
        }

        public Builder ward(String ward) {
            this.ward = ward;
            return this;
        }

        public Builder street(String street) {
            this.street = street;
            return this;
        }

        public Builder direction(String direction) {
            this.direction = direction;
            return this;
        }

        public Builder numberOfBasement(String numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public Builder level(String level) {
            this.level = level;
            return this;
        }

        public Builder rentPriceFrom(Long rentPriceFrom) {
            this.rentPriceFrom = rentPriceFrom;
            return this;
        }

        public Builder rentPriceTo(Long rentPriceTo) {
            this.rentPriceTo = rentPriceTo;
            return this;
        }

        public Builder rentAreaFrom(Long rentAreaFrom) {
            this.rentAreaFrom = rentAreaFrom;
            return this;
        }

        public Builder rentAreaTo(Long rentAreaTo) {
            this.rentAreaTo = rentAreaTo;
            return this;
        }

        public Builder managername(String managername) {
            this.managername = managername;
            return this;
        }

        public Builder managerphone(String managerphone) {
            this.managerphone = managerphone;
            return this;
        }

        public Builder staffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }

        public Builder typeCode(List<String> typeCode) {
            this.typeCode = typeCode;
            return this;
        }

        public BuildingSearchBuilder build() {
            return new BuildingSearchBuilder(this);
        }
    }
}
