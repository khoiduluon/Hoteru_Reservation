package com.hoterureservation.controller.Admin;


import java.util.List;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.repositories.CustomerRepository;
import com.hoterureservation.repositories.FoodRepository;
import com.hoterureservation.services.FoodService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CustomerRestController {

    //@Autowired FoodService service;

    @Autowired CustomerRepository CusRepository;

    @GetMapping("/api/cus/{id}")
    public Customer getCustomergetFood(@PathVariable("id") String id){
        return CusRepository.findById(id).get();
    }

    @PostMapping("/api/insertCus")
    public Customer insert(@RequestBody Customer obj){
        System.out.println(obj);
        return CusRepository.save(obj);
    }

    @GetMapping("/api/deleteCus/{id}")
    public Boolean DeleteFood(@PathVariable("id") String id){
        try {
            CusRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @GetMapping("/api/Allcustomer")
    public List<Customer> getCusAll(){
        return CusRepository.findAll();
    }
    
}
