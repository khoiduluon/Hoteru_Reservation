package com.hoterureservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("booking")
public class BookingController {

   @GetMapping()
    public String booking(){
        return "Booking/booking";
    }

    @GetMapping("/checkout")
    public String bookingDetail(){
        return "Booking/bookingdetail";
    }
}
