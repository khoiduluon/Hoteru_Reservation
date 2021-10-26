package com.hoterureservation.repositories;

import com.hoterureservation.entities.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomRepository extends JpaRepository<Room, String>{
  @Query("Select count(r) from Room r")
  public int countRoom();
}
