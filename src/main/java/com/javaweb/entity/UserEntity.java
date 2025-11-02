package com.javaweb.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity {

    private static final long serialVersionUID = -4988455421375043688L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "username", nullable = false, unique = true)
    private String userName;

    @Column(name = "fullname", nullable = false)
    private String fullName;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "status", nullable = false)
    private Integer status;

    @Column(name = "email", unique = true)
    private String email;

    @Column(name = "phone", unique = true)
    private String phone;

//    @ManyToMany(fetch = FetchType.LAZY)
//    @JoinTable(name = "user_role",
//            joinColumns = @JoinColumn(name = "user_id", nullable = false),
//            inverseJoinColumns = @JoinColumn(name = "role_id", nullable = false))
//    private List<RoleEntity> roles = new ArrayList<>();
    @OneToMany(mappedBy = "users", fetch = FetchType.LAZY)
    private List<UserRoleEntity> userRoleEntities = new ArrayList<>();

    public List<UserRoleEntity> getUserRoleEntities() {
        return userRoleEntities;
    }

    public void setUserRoleEntities(List<UserRoleEntity> userRoleEntities) {
        this.userRoleEntities = userRoleEntities;
    }
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userEntity")
    private List<AssignmentBuildingEntity> assignBuildingEntities = new ArrayList<>();

    public List<BuildingEntity> getBuildingEntityList() {
        List<BuildingEntity> buildingEntityList = new ArrayList<>();
        for (AssignmentBuildingEntity assignmentBuildingEntity : assignBuildingEntities) {
            buildingEntityList.add(assignmentBuildingEntity.getBuildingEntity());
        }
        return buildingEntityList;
    }

    public void setBuildingEntityList(List<BuildingEntity> buildingEntityList) {
        int i = 0;
        for (AssignmentBuildingEntity assignmentBuildingEntity : assignBuildingEntities) {
            assignmentBuildingEntity.setBuildingEntity(buildingEntityList.get(i));
            i += 1;
        }
    }

    //    @OneToMany(mappedBy="staffs", fetch = FetchType.LAZY)
//    private List<AssignmentBuildingEntity> assignmentBuildingEntities = new ArrayList<>();
//
//    @OneToMany(mappedBy="users", fetch = FetchType.LAZY)
//    private List<UserRoleEntity> userRoleEntities = new ArrayList<>();
//    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "userEntities")
//    List<BuildingEntity> buildingEntityList = new ArrayList<>();
    public static long getSerialVersionUID() {
        return serialVersionUID;
    }


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<RoleEntity> getRoles() {
        List<RoleEntity> roles = new ArrayList<>();
        for (UserRoleEntity userRoleEntity : userRoleEntities) {
            roles.add(userRoleEntity.getRoles());
        }
        return roles;
    }

    public void setRoles(List<RoleEntity> roles) {
        int i = 0;
        for (UserRoleEntity userRoleEntity : userRoleEntities) {
            userRoleEntity.setRoles(roles.get(i));
            i += 1;
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
        @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
