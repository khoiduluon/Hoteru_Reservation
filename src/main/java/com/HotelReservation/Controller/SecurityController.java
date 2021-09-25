package com.HotelReservation.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SecurityController {

    @RequestMapping("login")
    public String login(){
        return "Security/login";
    }

    @RequestMapping("register")
    public String register(){
        return "Security/register";
    }
}
