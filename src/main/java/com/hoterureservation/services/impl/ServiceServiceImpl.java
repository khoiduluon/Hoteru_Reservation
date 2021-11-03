package com.hoterureservation.services.impl;

import com.hoterureservation.entities.Services;
import com.hoterureservation.repositories.ServiceRepository;
import com.hoterureservation.services.ServiceService;

import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService{
  @Autowired
  private ServiceRepository serviceRepository;

  @Override
  public List<Services> findAll() {
    return serviceRepository.findAll();
  }

  @Override
  public int countService() {
    return serviceRepository.countService();
  }
  
}
