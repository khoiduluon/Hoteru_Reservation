package com.hoterureservation.dtos;

import java.util.List;

import com.hoterureservation.entities.*;
import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SFBookDto {
  private List<Services> listServices;
  private List<Food> listFoods;
}
