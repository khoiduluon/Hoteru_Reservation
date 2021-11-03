package com.hoterureservation.dtos;

import java.util.Date;
import java.util.List;

import com.hoterureservation.entities.Food;
import com.hoterureservation.entities.Services;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookingDto {
  private String customerb;
  private String roomb;
  private Date inDate;
  private Date outDate;
  private double total;
  private String fullname;
  private String phone;
  private List<Food> foodBookings;
  private List<Services> serviceBookings;
}
