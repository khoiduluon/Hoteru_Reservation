package com.hoterureservation.repositories;

import com.hoterureservation.entities.FoodBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodBookingRepository extends JpaRepository<FoodBooking, Long>{

}
