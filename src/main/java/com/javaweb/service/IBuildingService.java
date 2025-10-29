package com.javaweb.service;

import com.javaweb.model.response.ResponseDTO;
import org.springframework.stereotype.Service;

@Service
public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);

}
