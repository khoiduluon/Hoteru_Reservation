package com.hoterureservation.repositories;

import java.util.Collection;
import java.util.List;

import com.hoterureservation.dtos.DateBookingDto;
import com.hoterureservation.dtos.Top6CustomerDto;
import com.hoterureservation.entities.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long>{
  @Query("select b from Booking b where b.customerb.username = ?1 and b.status in('NORMAL','COMPLETED')")
  public List<Booking> findByUsername(String username);

  @Query("select new com.hoterureservation.dtos.Top6CustomerDto(b.customerb.username, b.customerb.fullname, b.customerb.phone, sum(b.total)) "+
  "from Booking b where b.status = 'COMPLETED' group by b.customerb.username, b.customerb.fullname, b.customerb.phone order by sum(b.total) desc")
  public List<Top6CustomerDto> top6();

  @Query("select DISTINCT(MONTH(b.bookDate)) from Booking b where YEAR(b.bookDate) = ?1")
  public Collection<Integer> findAllMonthByYear(int year);

  @Query("select sum(b.total) from Booking b where MONTH(b.bookDate) = ?1 and YEAR(b.bookDate) = ?2")
  public Integer revenueMonth(int month, int year);

  public List<Booking> findByFullnameLike(String key);

  @Query("select com.hoterureservation.dtos.DateBookingDto(b.inDate, b.outDate) from Booking b where b.roomb.id = ?1")
  public List<DateBookingDto> finDateBooking(String id);
}
