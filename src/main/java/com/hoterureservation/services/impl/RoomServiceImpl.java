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
  
}
