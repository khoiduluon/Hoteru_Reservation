package com.hoterureservation.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CountDto {
  private int room;
  private int service;
  private int food;
  private int user;
}
