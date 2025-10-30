package com.javaweb.controller.admin;



import com.javaweb.enums.District;
import com.javaweb.enums.TypeCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.impl.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    private BuildingService buildingService;

    @Autowired
    private UserService userService;
    @RequestMapping(value="/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        modelAndView.addObject("modelSearch",  buildingSearchRequest); // luu du lieu sau khi tim kiem tren bang search
        // xử lí dữ liệu dưới DB
        List<BuildingSearchResponse> list = buildingService.listBuildings(buildingSearchRequest);
        modelAndView.addObject("buildingList", list);
        modelAndView.addObject("listStaffs", userService.getStaffs());
        modelAndView.addObject("districts", District.type());
        modelAndView.addObject("typeCodes", TypeCode.type());
        return modelAndView;
    }

    @RequestMapping(value="/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        modelAndView.addObject("buildingEdit", buildingDTO);
        modelAndView.addObject("districts", District.type());
        modelAndView.addObject("typeCodes", TypeCode.type());
        return modelAndView;
    }

    @RequestMapping(value="/admin/building-edit-{id}", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        // find building by id in DB
        BuildingDTO buildingDTO = new BuildingDTO();
        buildingDTO.setId(id);
        buildingDTO.setName("KTX Khu A");
        modelAndView.addObject("buildingEdit", buildingDTO);
        modelAndView.addObject("districts", District.type());
        modelAndView.addObject("typeCodes", TypeCode.type());
        return modelAndView;
    }
}
