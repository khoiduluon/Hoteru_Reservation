package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.dtos.SBookingDto;
import com.hoterureservation.entities.ServiceBooking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceBookingRepository extends JpaRepository<ServiceBooking, Long>{
  @Query("select new com.hoterureservation.dtos.SBookingDto(b.service.name, count(b.service.id)) from ServiceBooking b group by b.service.name order by count(b.service.id) desc")
  List<SBookingDto> countSBooking();
}
