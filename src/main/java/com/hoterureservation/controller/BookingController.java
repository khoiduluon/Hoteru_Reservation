package com.hoterureservation.controller;

import com.hoterureservation.entities.Booking;
import com.hoterureservation.entities.Customer;
import com.hoterureservation.entities.Food;
import com.hoterureservation.entities.Room;
import com.hoterureservation.entities.Services;
import com.hoterureservation.services.BookingService;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.FoodService;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("booking")
public class BookingController {

    @Autowired
    ServiceService serviceService;

    @Autowired
    FoodService foodService;

    @Autowired
    RoomService roomService;

    @Autowired
    CustomerService customerService;

    @Autowired
    BookingService bookingService;

   @GetMapping("{id}")
    public String booking(Model model, @PathVariable("id") String id){
        List<Services> list = serviceService.findAll();
        List<Food> listFood = foodService.findAll();
        Room room = roomService.findById(id);
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        Customer customer = customerService.findByUsername(username);
        model.addAttribute("customer", customer);
        model.addAttribute("room",room);
        model.addAttribute("list",list);
        model.addAttribute("listFood",listFood);
        return "Booking/booking";
    }

    @GetMapping("/history")
    public String bookingHistory(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        model.addAttribute("listBooing", bookingService.findByUsername(username));
        return "Booking/bookinghistory";
    }

    @GetMapping("/detail/{id}")
    public String bookingDetail(@PathVariable("id") Long id, Model model){
        model.addAttribute("bookingitem", bookingService.findById(id));
        return "Booking/bookingdetail";
    }
}
