package com.HotelReservation.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class HomeController {

    @RequestMapping({"/", "/home/index"})
    public String index() {
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
