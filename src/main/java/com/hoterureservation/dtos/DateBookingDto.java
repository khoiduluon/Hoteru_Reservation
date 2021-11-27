package com.hoterureservation.dtos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAccessor;
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


    @SneakyThrows
    @Override
    public String toString() {
        return "{" + "\"inDate\"" + ":" + "\""+formatter(inDate)+ "\" , \"outDate\"" + ":" + "\""+formatter(outDate)+"\"" + "}";
    }

    public String formatter(Date value) throws ParseException {
        String pattern = "yyyy/MM/dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String ss = simpleDateFormat.format(value);
        return ss;
    }
}
