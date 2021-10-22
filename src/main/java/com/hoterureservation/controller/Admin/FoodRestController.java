package com.hoterureservation.controller.Admin;


import com.hoterureservation.entities.Food;
import com.hoterureservation.repositories.FoodRepository;
import com.hoterureservation.services.FoodService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FoodRestController {

    @Autowired FoodService service;

    @Autowired FoodRepository foodRepository;

    @GetMapping("/api/Food/{id}")
    public Food getFood(@PathVariable("id") Long id){
        return service.findById(id);
    }

    @PostMapping("/api/insert")
    public Food insert(@RequestBody Food obj){
        System.out.println(obj);
        return service.insert(obj);
    }

    @GetMapping("/api/delete/{id}")
    public Boolean DeleteFood(@PathVariable("id") Long id){
        try {
            foodRepository.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }
    
}
