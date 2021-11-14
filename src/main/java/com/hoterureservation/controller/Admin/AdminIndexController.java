package com.hoterureservation.controller.Admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminIndexController {

    @RequestMapping("/admin/index")
    public String getIndex(){
        return "/Admin/index";
    }

    @RequestMapping("/admin/foodmgmt")
    public String getwebix(){
        return "/Admin/Food_copy";
    }
    
}
