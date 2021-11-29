package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.dtos.BookingDtos;
import com.hoterureservation.entities.Booking;
import com.hoterureservation.services.BookingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BookingRestController {
    
    @Autowired BookingService service;

    @GetMapping("/getAllBooking")
    public List<Booking> getAllBookings (){
        return service.findAll();
    }

    @GetMapping("/getOne/{id}")
    public Booking getOne(@PathVariable("id") Long id){
        return service.findById(id);
    }

    @PostMapping("/updateBooking")
    public Boolean update(@RequestBody BookingDtos obj){
        Booking update = service.findById(obj.getId());
        update.setStatus(obj.getStatus());
        service.save(update);
        return true;
    }

}
