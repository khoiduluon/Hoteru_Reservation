package com.hoterureservation.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Top6CustomerDto {
  private String username;
  private String fullname;
  private String phone;
  private double total; 
}
