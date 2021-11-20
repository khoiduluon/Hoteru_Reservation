package com.hoterureservation.controller.Admin;

import com.hoterureservation.dtos.*;
import com.hoterureservation.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/report")
public class ReportController {
  @Autowired
  private ReportService reportService;
  
  @GetMapping("/index")
  public ReportDto report1(){
    ReportDto reportDto = ReportDto.builder()
    .countDto(reportService.count())
    .listCustomer(reportService.top6Customer())
    .listFoodBooking(reportService.countFBooking())
    .listServiceBooking(reportService.countSBooking())
    .build();
    return reportDto;
  }
}
