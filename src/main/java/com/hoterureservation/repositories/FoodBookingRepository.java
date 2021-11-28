package com.hoterureservation.repositories;

import java.util.List;
import com.hoterureservation.dtos.FBookingDto;
import com.hoterureservation.entities.Food;
import com.hoterureservation.entities.FoodBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface FoodBookingRepository extends JpaRepository<FoodBooking, Long>{
  @Query("select new com.hoterureservation.dtos.FBookingDto(b.food.name, count(b.food.id)) from FoodBooking b group by b.food.name order by count(b.food.id) desc")
  List<FBookingDto> countFBooking();

  @Query("select f from Food f where f.id in (select fb.food.id from FoodBooking fb where fb.bookingf.id = ?1 )")
  List<Food> findByBookingIn(Long id);
}
