package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "building")
public class BuildingEntity extends BaseEntity {
    private String name;
    private Double floorarea;

    @OneToMany(mappedBy = "buildingEntity", fetch = FetchType.LAZY)
    private List<RentAreaEntity> rentAreas;
    @Column(name="type")
    private String typeCode;
    @OneToMany(mappedBy = "buildingEntity",fetch = FetchType.LAZY)
    private List<AssignmentBuildingEntity> assignmentBuildingEntity;
    @Column(name = "ward")
    private String ward;
    @Column(name = "street")
    private String street;
    @Column(name="district")
    private  String District;
    @Column(name = "numberofbasement")
    private String numberofbasement;
    @Column(name = "direction")
    private String direction;
    @Column(name = "level")
    private String level;
    @Column(name = "rentprice", nullable = false)
    private Integer   rentPrice;
    @Column(name = "managername")
    private String managername;
    @Column(name = "managerphone")
    private String managerphone;
    @Column(name = "servicefee")
    private String servicefee;
    @Column(name = "brokeragefee")
    private String brokeragefee;
    @Column(name="rentpricedescription")
    private String rentPriceDescription;
    @Column(name="avatar")
    private String image;

}
