package com.hoterureservation.services;

import java.util.List;

import com.hoterureservation.entities.Room;

public interface RoomService {
  List<Room> findAll();
  
  Room findById(String id);

  public int countRoom();
}
