package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Getter
@Setter
@Table(name = "building")
public class BuildingEntity extends BaseEntity {
    private String name;
    private Double floorarea;

//    @OneToMany(mappedBy = "buildingEntity", fetch = FetchType.LAZY)
//    private List<RentAreaEntity> rentAreas;
    @OneToMany(mappedBy = "buildingEntity",fetch = FetchType.LAZY,cascade = {CascadeType.PERSIST,CascadeType.MERGE}, orphanRemoval = true)
    private List<RentAreaEntity> rentAreas;
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="assignmentbuilding",
             joinColumns = @JoinColumn(name = "buildingid",nullable = false),
            inverseJoinColumns = @JoinColumn(name= "staffid",nullable = false))
    private List<UserEntity> staff = new ArrayList<>();
    @Column(name="type")
    private String typeCode;
//    @OneToMany(mappedBy = "buildingEntity",fetch = FetchType.LAZY)
//    private List<AssignmentBuildingEntity> assignmentBuildingEntity;
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
    @Column(name="rentpricedescription")
    private String rentPriceDescription;
    @Column(name="avatar")
    private String image;
    @Column(name="renttime")
    private String rentTime;
    @Column(name="structure")
    private String structure;
    @Column(name="carfee")
    private String carFee;
    @Column(name="motofee")
    private String motoFee;
    @Column(name="overtimefee")
    private String overtimeFee;
    @Column(name="waterfee")
    private String waterFee;
    @Column(name="electricityfee")
    private String electricityFee;
    @Column(name="deposit")
    private String deposit;
    @Column(name="payment")
    private String payment;
    @Column(name="decorationtime")
    private String decorationTime;
    @Column(name="note")
    private String note;
    @Column(name = "brokeragefee")
    private Integer brokerageFee;

}
