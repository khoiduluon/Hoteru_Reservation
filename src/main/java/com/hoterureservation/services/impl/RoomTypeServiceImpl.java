package com.hoterureservation.services.impl;

import com.hoterureservation.entities.RoomType;
import com.hoterureservation.repositories.RoomTypeRepository;
import com.hoterureservation.services.RoomTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomTypeServiceImpl implements RoomTypeService{

    @Autowired
    RoomTypeRepository roomTypeRepository;

    @Override
    public List<RoomType> findAll() {
        return roomTypeRepository.findAll();
    }

    @Override
    public RoomType findByID(String id) {
        return roomTypeRepository.findById(id).get();
    }
}
