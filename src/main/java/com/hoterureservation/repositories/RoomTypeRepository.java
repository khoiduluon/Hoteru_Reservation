package com.hoterureservation.repositories;

import com.hoterureservation.entities.RoomType;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomTypeRepository extends JpaRepository<RoomType, String>{
  
}
