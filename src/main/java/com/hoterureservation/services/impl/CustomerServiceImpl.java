package com.hoterureservation.services.impl;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.repositories.CustomerRepository;
import com.hoterureservation.services.CustomerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService{

    @Autowired
    CustomerRepository customerRepository;

    @Override
    public Customer findByUsername(String username) {
        return customerRepository.findById(username).get();
    }
}
