package com.hoterureservation.services;

import com.hoterureservation.entities.Food;

public interface FoodService {

    Food findById(Long id);

    Food insert(Food food);

    // void remove(Long id);
    
    public int countFood();
}
