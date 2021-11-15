package com.hoterureservation.services;

import java.util.List;

import com.hoterureservation.entities.Room;

public interface RoomService {
  List<Room> findAll();
  
  Room findById(String id);

  Room save(Room room);

  public int countRoom();

  public void deleteRoom(String id);

  public List<Room> searchRooms(String inDate, String outDate, String id);
}
