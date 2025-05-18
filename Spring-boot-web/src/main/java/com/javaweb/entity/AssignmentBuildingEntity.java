package com.javaweb.entity;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ManyToAny;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Table(name="assignmentbuilding")
public class AssignmentBuildingEntity extends BaseEntity {
    @ManyToOne
    @JoinColumn(name="buildingid")
    private BuildingEntity buildingEntity;

    @ManyToOne
    @JoinColumn(name="staffid")
    private UserEntity staff;
}
