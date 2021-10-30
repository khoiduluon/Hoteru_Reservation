package com.hoterureservation.services;

import com.hoterureservation.entities.Food;

import java.util.List;

public interface FoodService {

    public List<Food> findAll();

    Food findById(Long id);

    Food insert(Food food);

    // void remove(Long id);
    
    public int countFood();
}
