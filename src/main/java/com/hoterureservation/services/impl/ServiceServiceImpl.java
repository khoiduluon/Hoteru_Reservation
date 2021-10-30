package com.hoterureservation.services.impl;

import com.hoterureservation.entities.Service;
import com.hoterureservation.repositories.ServiceRepository;
import com.hoterureservation.services.ServiceService;

import org.springframework.beans.factory.annotation.Autowired;


import java.util.List;

@org.springframework.stereotype.Service
public class ServiceServiceImpl implements ServiceService{
  @Autowired
  private ServiceRepository serviceRepository;

  @Override
  public List<Service> findAll() {
    return serviceRepository.findAll();
  }

  @Override
  public int countService() {
    return serviceRepository.countService();
  }
  
}
