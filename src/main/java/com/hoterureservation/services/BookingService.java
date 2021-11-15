package com.hoterureservation.services;

import java.util.List;

import com.fasterxml.jackson.databind.JsonNode;
import com.hoterureservation.entities.Booking;

public interface BookingService {
  public Booking save(Booking booking);

  public Booking createBooking(JsonNode req);

  public Booking findById(Long id);

  public List<Booking> findByUsername(String username);

  public void cancel(Long id);
}
