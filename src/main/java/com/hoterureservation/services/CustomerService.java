package com.hoterureservation.services;


import com.hoterureservation.entities.Customer;

public interface CustomerService {

    public Customer findByUsername(String username);

    public Customer save(Customer customer);

    public boolean checkUserExist(String username);

}
