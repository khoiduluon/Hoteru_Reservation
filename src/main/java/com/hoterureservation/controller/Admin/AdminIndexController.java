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

    @RequestMapping("/admin/servicemgmt")
    public String getServicemgmt(){
        return "/Admin/Service_copy";
    }

    @RequestMapping("/admin/customermgmt")
    public String getcustomer(){
        return "/Admin/Customer_copy";
    }

    @RequestMapping("/admin/roommgmt")
    public String getroom(){
        return "/Admin/Room_copy";
    }
    
    @RequestMapping("/admin/bookingmgmt")
    public String getBooking(){
        return "/Admin/Booking_copy";
    }
    
}
