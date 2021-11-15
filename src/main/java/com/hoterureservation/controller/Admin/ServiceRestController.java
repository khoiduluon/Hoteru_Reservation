package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Services;
import com.hoterureservation.repositories.ServiceRepository;
import com.hoterureservation.services.ServiceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ServiceRestController {
    
    
    @Autowired ServiceService service;

    @Autowired ServiceRepository serviceRepository;

    @GetMapping("/api/Service/{id}")
    public Services getService(@PathVariable("id") Long id){
        return service.findById(id);
    }

    @PostMapping("/api/insertService")
    public Services insert(@RequestBody Services obj){
        System.out.println(obj);
        return service.insert(obj);
    }

    @GetMapping("/api/deleteService/{id}")
    public Boolean DeleteFood(@PathVariable("id") Long id){
        try {
            serviceRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    @GetMapping("/api/AllService")
    public List<Services> getFoodAll(){
        return service.findAll();
    }
}
