package com.hoterureservation.dtos;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DateBookingDto {
    private String inDate;
    private String outDate;
}
