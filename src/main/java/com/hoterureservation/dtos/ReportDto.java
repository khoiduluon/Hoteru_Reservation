package com.hoterureservation.dtos;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReportDto {
  private CountDto countDto;
  private List<Top6CustomerDto> listCustomer;
  private List<FBookingDto> listFoodBooking;
  private List<SBookingDto> listServiceBooking;
}
