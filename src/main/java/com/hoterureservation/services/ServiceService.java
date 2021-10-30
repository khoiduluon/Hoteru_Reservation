package com.hoterureservation.services;

import com.hoterureservation.entities.Service;

import java.util.List;

public interface ServiceService {

  public List<Service> findAll();
  public int countService();
}
