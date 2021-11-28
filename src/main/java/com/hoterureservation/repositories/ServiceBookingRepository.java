package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.dtos.SBookingDto;
import com.hoterureservation.entities.ServiceBooking;
import com.hoterureservation.entities.Services;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceBookingRepository extends JpaRepository<ServiceBooking, Long>{
  @Query("select new com.hoterureservation.dtos.SBookingDto(b.service.name, count(b.service.id)) from ServiceBooking b group by b.service.name order by count(b.service.id) desc")
  List<SBookingDto> countSBooking();

  @Query("select s from Services s where s.id in (select sb.service.id from ServiceBooking sb where sb.bookings.id = ?1 )")
  List<Services> findByBookingIn(Long id);
}
