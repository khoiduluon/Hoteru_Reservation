package com.hoterureservation.services.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoterureservation.dtos.BookingDto;
import com.hoterureservation.dtos.DateBookingDto;
import com.hoterureservation.entities.*;
import com.hoterureservation.repositories.BookingRepository;
import com.hoterureservation.repositories.FoodBookingRepository;
import com.hoterureservation.repositories.ServiceBookingRepository;
import com.hoterureservation.services.BookingService;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookingServiceImpl implements BookingService{
  @Autowired
  BookingService bookingService;
  @Autowired
  CustomerService customerService;
  @Autowired
  RoomService roomService;
  @Autowired
  ServiceBookingRepository serviceBookingRepository;
  @Autowired
  FoodBookingRepository foodBookingRepository;
  @Autowired
  BookingRepository bookingRepository;

  @Override
  public Booking createBooking(JsonNode req) {
    ObjectMapper mapper=new ObjectMapper();
    BookingDto dto=mapper.convertValue(req, BookingDto.class);

    Room room = roomService.findById(dto.getRoomb());
    Customer customer = customerService.findByUsername(dto.getCustomerb());
    
    Booking booking = new Booking();
    booking.setBookDate(new Date());
    booking.setInDate(dto.getInDate());
    booking.setOutDate(dto.getOutDate());
    booking.setTotal(dto.getTotal());
    booking.setFullname(dto.getFullname());
    booking.setPhone(dto.getPhone());
    booking.setRoomb(room);
    booking.setCustomerb(customer);
    booking.setStatus("PENDING");
    bookingService.save(booking);

    List<Services> serviceList = dto.getServiceBookings();
    List<Food> foodList = dto.getFoodBookings();

    List<ServiceBooking> listServiceBookings = new ArrayList<>();
    for(Services s : serviceList){
      ServiceBooking serviceBooking = new ServiceBooking();
      serviceBooking.setService(s);
      serviceBooking.setBookings(booking);
      listServiceBookings.add(serviceBooking);
    }
    serviceBookingRepository.saveAll(listServiceBookings);

    List<FoodBooking> lisFoodBookings = new ArrayList<>();
    for(Food f : foodList){
      FoodBooking foodBooking = new FoodBooking();
      foodBooking.setFood(f);
      foodBooking.setBookingf(booking);
      lisFoodBookings.add(foodBooking);
    }
    foodBookingRepository.saveAll(lisFoodBookings);

    return booking;
  }

  @Override
  public Booking save(Booking booking) {
    return bookingRepository.save(booking);
  }

  @Override
  public Booking findById(Long id) {
    return bookingRepository.findById(id).get();
  }

  @Override
  public List<Booking> findByUsername(String username) {
    return bookingRepository.findByUsername(username);
  }

  @Override
  public void cancel(Long id) {
    Booking booking = bookingRepository.findById(id).get();
    booking.setStatus("CANCEL");
    bookingRepository.save(booking);
  }

  @Override
  public List<DateBookingDto> finDateBooking(String id) {
    return bookingRepository.finDateBooking(id);
  }

  @Override
  public List<Booking> findAll() {
    return bookingRepository.findAll();
  }
}
