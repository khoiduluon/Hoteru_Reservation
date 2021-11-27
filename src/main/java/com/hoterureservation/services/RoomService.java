package com.hoterureservation.services;

import java.util.List;

import com.hoterureservation.entities.Room;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface RoomService {
  List<Room> findAll();

  Page<Room> pageAll(Pageable pageable);

  Room findById(String id);

  Room save(Room room);

  public int countRoom();

  public void deleteRoom(String id);

  public List<Room> search(String checkin, String checkout, String id);

}
