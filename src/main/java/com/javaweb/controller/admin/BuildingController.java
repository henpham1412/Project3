package com.javaweb.controller.admin;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {

    @RequestMapping(value="/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/list");
        return modelAndView;
    }

    @RequestMapping(value="/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/building/edit");
        return modelAndView;
    }
}
