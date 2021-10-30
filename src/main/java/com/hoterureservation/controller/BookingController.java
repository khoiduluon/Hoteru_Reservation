package com.hoterureservation.controller;

import com.hoterureservation.entities.Food;
import com.hoterureservation.entities.Room;
import com.hoterureservation.entities.Service;
import com.hoterureservation.services.FoodService;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.ServiceService;
import org.springframework.beans.factory.annotation.Autowired;
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

   @GetMapping("{id}")
    public String booking(Model model, @PathVariable("id") String id){
        List<Service> list = serviceService.findAll();
        List<Food> listFood = foodService.findAll();
        Room room = roomService.findById(id);
        model.addAttribute("room",room);
        model.addAttribute("list",list);
        model.addAttribute("listFood",listFood);
        return "Booking/booking";
    }

    @GetMapping("/checkout")
    public String bookingDetail(){
        return "Booking/bookingdetail";
    }
}
