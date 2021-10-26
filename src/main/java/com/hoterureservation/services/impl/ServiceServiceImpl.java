package com.hoterureservation.services.impl;

import com.hoterureservation.repositories.ServiceRepository;
import com.hoterureservation.services.ServiceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceServiceImpl implements ServiceService{
  @Autowired
  private ServiceRepository serviceRepository;

  @Override
  public int countService() {
    return serviceRepository.countService();
  }
  
}
