package com.javaweb.repository.custom;

import com.javaweb.entity.CustomerEntity;

import com.javaweb.model.request.CustomerSearchRequest;
import org.springframework.stereotype.Repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

@Repository
public interface CustomerRepositoryCustom {
    Page<CustomerEntity> getCustomerEntities(CustomerSearchRequest customerSearchRequest, Pageable pageable);
}
