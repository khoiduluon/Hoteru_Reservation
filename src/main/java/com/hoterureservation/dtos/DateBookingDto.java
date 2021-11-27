package com.hoterureservation.dtos;

import java.util.Date;

import lombok.*;

@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DateBookingDto {
    private Date inDate;
    private Date outDate;
}
