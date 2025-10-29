package com.javaweb.repository;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long> , UserRepositoryCustom {
    UserEntity findOneByUserNameAndStatus(String name, int status);
    Page<UserEntity> findByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status, Pageable pageable);

    // find UserEntity by status and go to list 'userRoleEntities'
    // go to roles in userRoleEntities
    // take code of the roles
    List<UserEntity> findByStatusAndUserRoleEntitiesRolesCode(Integer status, String roleCode);
    Page<UserEntity> findByStatusNot(int status, Pageable pageable);
    long countByUserNameContainingIgnoreCaseOrFullNameContainingIgnoreCaseAndStatusNot(String userName, String fullName, int status);
    long countByStatusNot(int status);
    UserEntity findOneByUserName(String userName);
    List<UserEntity> findByIdIn(List<Long> id);
}
