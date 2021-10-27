package com.hoterureservation.controller.Admin;

import com.hoterureservation.dtos.CountDto;
import com.hoterureservation.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin("*")
@RestController
@RequestMapping("/report")
public class ReportController {
  @Autowired
  private ReportService reportService;
  
  @GetMapping("/count-all")
  public CountDto report1(){
    return reportService.report1();
  }
}
