package com.hoterureservation.dtos;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomTypeDtos {
    String name;
    String id;
    Double price;
    Double size;
    Long capacity;
    String typeBed;
}
