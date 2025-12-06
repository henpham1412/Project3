package com.javaweb.service.impl;

import com.javaweb.converter.CustomerConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private CustomerConverter customerConverter;

    @Autowired
    private UserRepository userRepository;

    @Override
    public ResponseDTO loadStaffs(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id).get();
        List<UserEntity> allStaffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> assignedStaffs = customerEntity.getUserEntities();
        // optimize
        List<Long> assignedStaffIds = new ArrayList<>();
        for (UserEntity staff : assignedStaffs) {
            assignedStaffIds.add(staff.getId());
        }
        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity staff : allStaffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(staff.getId());
            staffResponseDTO.setFullName(staff.getFullName());
            if (assignedStaffIds.contains(staff.getId())) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOList.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOList);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public Page<CustomerSearchResponse> listCustomers(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        Page<CustomerEntity> customerEntities = customerRepository.getCustomerEntities(customerSearchRequest, pageable);
        Page<CustomerSearchResponse> customerSearchResponsePage = customerEntities.map(entity -> customerConverter.convertEntityToResponse(entity));
        return customerSearchResponsePage;
    }
}
