package com.hoterureservation.repositories;

import com.hoterureservation.entities.RoomFood;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomFoodRepository extends JpaRepository<RoomFood, Long>{
  
}
