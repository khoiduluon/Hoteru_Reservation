package com.hoterureservation.services;

import com.fasterxml.jackson.databind.JsonNode;
import com.hoterureservation.entities.Booking;

public interface BookingService {
  public Booking save(Booking booking);

  public Booking createBooking(JsonNode req);
}
