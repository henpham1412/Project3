package com.javaweb.entity;

import javax.persistence.*;

@Entity
@Table(name = "rentarea")
public class RentAreaEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "buildingid")
    private BuildingEntity buildingList;

    @Column(name = "value")
    private Long value;

    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public BuildingEntity getBuildingList() {
        return buildingList;
    }

    public void setBuildingList(BuildingEntity buildingEntity) {
        this.buildingList = buildingEntity;
    }

    public Long getValue() {
        return value;
    }

    public void setValue(Long value) {
        this.value = value;
    }
}
