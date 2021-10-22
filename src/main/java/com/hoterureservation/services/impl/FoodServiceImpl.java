package com.hoterureservation.services.impl;

import com.hoterureservation.entities.Food;
import com.hoterureservation.repositories.FoodRepository;
import com.hoterureservation.services.FoodService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FoodServiceImpl implements FoodService{

    @Autowired FoodRepository foodRepository;

    @Override
    public Food findById(Long id) {
        return foodRepository.findById(id).get();
    }

    @Override
    public Food insert(Food food) {
        return foodRepository.save(food);
    }

    // @Override
    // public Boolean remove(Long id) {
    //     try{
    //         foodRepository.deleteById(id);

    //         return true;
    //     }catch(Exception e){
    //         return false;
    //     }
       
    // }
}
