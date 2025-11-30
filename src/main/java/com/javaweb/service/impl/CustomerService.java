package com.javaweb.service.impl;

import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.service.ICustomerService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class CustomerService implements ICustomerService {
    @Override
    public Page<CustomerSearchResponse> listCustomers(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        return null;
    }
}
