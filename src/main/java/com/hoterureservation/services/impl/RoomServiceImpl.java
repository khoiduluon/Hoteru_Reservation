package com.hoterureservation.services.impl;

import java.util.List;

import com.hoterureservation.entities.Room;
import com.hoterureservation.repositories.RoomRepository;
import com.hoterureservation.services.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomServiceImpl implements RoomService{
  @Autowired
  private RoomRepository roomRepository;

  @Override
  public List<Room> findAll() {
    return roomRepository.findAll();
  }

  @Override
  public Room findById(String id) {
    return roomRepository.findById(id).get();
  }

  @Override
  public Room save(Room room) {
    return roomRepository.save(room);
  }

  @Override
  public int countRoom() {
    return roomRepository.countRoom();
  }

  @Override
  public void deleteRoom(String id) {
    roomRepository.deleteById(id);
  }

  @Override
  public List<Room> search(String checkin, String checkout, String id) {
    return roomRepository.search(checkin, checkout, id);
  }

}
