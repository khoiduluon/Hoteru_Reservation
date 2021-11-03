package com.hoterureservation.services;

import com.hoterureservation.entities.Services;

import java.util.List;

public interface ServiceService {

  public List<Services> findAll();
  public int countService();
}
