package com.hoterureservation.repositories;

import com.hoterureservation.entities.Food;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodRepository extends JpaRepository<Food, Long>{
  @Query("Select count(f) from Food f")
  public int countFood();
}
