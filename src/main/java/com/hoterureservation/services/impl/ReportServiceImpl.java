package com.hoterureservation.services.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.hoterureservation.dtos.CountDto;
import com.hoterureservation.dtos.FBookingDto;
import com.hoterureservation.dtos.RevenueDto;
import com.hoterureservation.dtos.SBookingDto;
import com.hoterureservation.dtos.Top6CustomerDto;
import com.hoterureservation.repositories.BookingRepository;
import com.hoterureservation.repositories.FoodBookingRepository;
import com.hoterureservation.repositories.ServiceBookingRepository;
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
  @Autowired
  private BookingRepository bookingRepository;
  @Autowired
  private FoodBookingRepository foodBookingRepository;
  @Autowired
  private ServiceBookingRepository serviceBookingRepository;

  @Override
  public CountDto count() {
    CountDto dto = new CountDto();
    dto.setUser(customerService.countCustomer());
    dto.setFood(foodService.countFood());
    dto.setRoom(roomService.countRoom());
    dto.setService(serviceService.countService());
    return dto;
  }

  @Override
  public List<Top6CustomerDto> top6Customer() {
    return bookingRepository.top6();
  }

  @Override
  public List<FBookingDto> countFBooking() {
    return foodBookingRepository.countFBooking();
  }

  @Override
  public List<SBookingDto> countSBooking() {
    return serviceBookingRepository.countSBooking();
  }

  @Override
  public List<RevenueDto> revenue12Month(int year) {
    String []months ={"January","February","March","April","May","June","July","August","September","October","November","December"};
    Collection<Integer> listmonth = bookingRepository.findAllMonthByYear(year);
    List<RevenueDto> list = new ArrayList<>();
    for(int i = 1; i <= 12; i++){
      RevenueDto dto = null;
      if(listmonth.contains(i)){
        dto = RevenueDto.builder()
                        .month(months[i-1])
                        .total(bookingRepository.revenueMonth(i, year))
                        .build();
      }else{
        dto = RevenueDto.builder()
                        .month(months[i-1])
                        .total(0)
                        .build();
      }
      list.add(dto);
    }
    return list;
  }
}
