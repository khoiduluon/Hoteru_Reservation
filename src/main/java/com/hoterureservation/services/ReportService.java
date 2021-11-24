package com.hoterureservation.services;

import java.util.List;

import com.hoterureservation.dtos.CountDto;
import com.hoterureservation.dtos.FBookingDto;
import com.hoterureservation.dtos.RevenueDto;
import com.hoterureservation.dtos.SBookingDto;
import com.hoterureservation.dtos.Top6CustomerDto;

public interface ReportService {
  public CountDto count();

  public List<Top6CustomerDto> top6Customer();

  public List<FBookingDto> countFBooking();

  public List<SBookingDto> countSBooking();

  public List<RevenueDto> revenue12Month(int year);
}
