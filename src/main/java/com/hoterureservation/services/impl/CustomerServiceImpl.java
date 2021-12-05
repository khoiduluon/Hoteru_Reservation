package com.hoterureservation.services.impl;

import java.util.Objects;
import java.util.Optional;

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

    @Override
    public Customer save(Customer customer) {
        if(checkUserExist(customer.getUsername())){
            System.out.println("User already exist");
        }
        return customerRepository.save(customer);
    }

    @Override
    public boolean checkUserExist(String username){
        Optional<Customer> customer = customerRepository.findById(username);
        return customer.isEmpty() ? false : true;
    }

    @Override
    public Customer update(Customer customer) {
        return customerRepository.save(customer);
    }

    @Override
    public int countCustomer() {
        return customerRepository.countCustomer();
    }
}
