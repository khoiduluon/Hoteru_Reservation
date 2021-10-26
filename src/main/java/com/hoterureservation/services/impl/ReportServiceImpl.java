package com.hoterureservation.services.impl;

import com.hoterureservation.dtos.CountDto;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.FoodService;
import com.hoterureservation.services.ReportService;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.ServiceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{
  @Autowired
  private CustomerService customerService;
  @Autowired
  private RoomService roomService;
  @Autowired
  private FoodService foodService;
  @Autowired
  private ServiceService serviceService;

  @Override
  public CountDto report1() {
    CountDto dto = new CountDto();
    dto.setUser(customerService.countCustomer());
    dto.setFood(foodService.countFood());
    dto.setRoom(roomService.countRoom());
    dto.setService(serviceService.countService());
    return dto;
  }  
}
