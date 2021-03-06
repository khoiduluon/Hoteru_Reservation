package com.hoterureservation.dtos;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RoomDtos {
    String name;
    String id;
    String roomType;
    String description;
    String image;
    String image2;
    String image3;
    String image4;
}
