package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long>{
  @Query("select b from Booking b where b.customerb.username = ?1")
  public List<Booking> findByUsername(String username);
}
