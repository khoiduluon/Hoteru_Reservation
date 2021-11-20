package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.dtos.Top6CustomerDto;
import com.hoterureservation.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long>{
  @Query("select b from Booking b where b.customerb.username = ?1")
  public List<Booking> findByUsername(String username);

  @Query("select new com.hoterureservation.dtos.Top6CustomerDto(b.customerb.username, b.customerb.fullname, b.customerb.phone, sum(b.total)) "+
  "from Booking b group by b.customerb.username, b.customerb.fullname, b.customerb.phone order by sum(b.total) desc")
  public List<Top6CustomerDto> top6();
}
