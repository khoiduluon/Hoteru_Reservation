package com.hoterureservation.services;

import com.hoterureservation.entities.RoomType;

import java.util.List;

public interface RoomTypeService {

    public List<RoomType> findAll();

    public RoomType findByID(String id);
}
