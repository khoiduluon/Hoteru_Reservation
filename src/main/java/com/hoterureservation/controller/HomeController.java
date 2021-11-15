package com.hoterureservation.controller;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.RoomTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {
    @Autowired
    RoomTypeService roomTypeService;

    @Autowired
    CustomerService customerService;

    @RequestMapping({"/", "/home/index"})
    public String index(Model model) {
        model.addAttribute("listRoomType", roomTypeService.findAll());
        return "Layout/session";
    }

    @RequestMapping("/about")
    public String about(){
        return "AboutUs/about";
    }
    @RequestMapping("/blog")
    public String blog(){
        return "News/blog";
    }

    @RequestMapping("/blog/detail")
    public String blog_detail(){
        return "News/blog-details";
    }

    @RequestMapping("/contact")
    public String contact(){
        return "Contact/contact";
    }

    @RequestMapping({"/admin", "/admin/home/index"})
    public String admin() {
        return "admin/index";
    }
}
