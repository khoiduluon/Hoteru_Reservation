package com.hoterureservation.controller;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.hoterureservation.dtos.BookingDtos;
import com.hoterureservation.entities.Booking;
import com.hoterureservation.services.BookingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
public class BookRestController {
  @Autowired
  BookingService bookingService;
  
  @PostMapping("/book-create")
  public Long book(@RequestBody JsonNode req){
    Booking booking = bookingService.createBooking(req);
    return booking.getId();
  }

  @GetMapping("/getAllBooking")
  public List<Booking> getAllBookings (){
      return bookingService.findAll();
  }

  @GetMapping("/getOne/{id}")
  public Booking getOne(@PathVariable("id") Long id){
      return bookingService.findById(id);
  }

  @PostMapping("/updateBooking")
  public Boolean update(@RequestBody BookingDtos obj){
      Booking update = bookingService.findById(obj.getId());
      update.setStatus(obj.getStatus());
      bookingService.save(update);
      return true;
  }
}
