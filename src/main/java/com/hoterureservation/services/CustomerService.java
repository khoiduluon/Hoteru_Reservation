package com.hoterureservation.services;


import com.hoterureservation.entities.Customer;

public interface CustomerService {

    public Customer findByUsername(String username);

}
