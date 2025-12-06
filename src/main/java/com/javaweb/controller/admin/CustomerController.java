package com.javaweb.controller.admin;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import org.springframework.data.domain.Pageable;

@Controller(value="customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping(value="/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("customerSearch") CustomerSearchRequest  customerSearchRequest,
                                     HttpServletRequest request, @PageableDefault(size = 2, page = 0) Pageable pageable) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/list");

        modelAndView.addObject("customerSearch",  customerSearchRequest);
        modelAndView.addObject("listStaffs", userService.getStaffs());
        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
            modelAndView.addObject("customerPage", customerService.listCustomers(customerSearchRequest, pageable));
        } else {
            modelAndView.addObject("customerPage", customerService.listCustomers(customerSearchRequest, pageable));
        }
        return modelAndView;
    }


    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@ModelAttribute CustomerDTO customerDTO, HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView("admin/customer/edit");
        modelAndView.addObject("customerEdit", customerDTO);
        return modelAndView;
    }
}
