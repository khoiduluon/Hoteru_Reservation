package com.hoterureservation.dtos;

import lombok.*;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RevenueDto {
  private String month;
  private Integer total;
}
