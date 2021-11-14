package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.entities.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, String>{
  @Query("Select count(r) from Room r")
  public int countRoom();

  @Query("select r from Room r where r.id not in(select b.roomb.id from Booking b where in_Date between ?1 and ?2"+
  " or out_Date between ?1 and ?2) and r.roomType.id = ?3")
  public List<Room> searhRoom(String inDate, String outDate, String id);
}
