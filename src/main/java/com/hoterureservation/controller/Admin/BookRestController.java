package com.hoterureservation.controller.Admin;

import com.fasterxml.jackson.databind.JsonNode;
import com.hoterureservation.dtos.BookingDto;
import com.hoterureservation.entities.Booking;
import com.hoterureservation.services.BookingService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
}