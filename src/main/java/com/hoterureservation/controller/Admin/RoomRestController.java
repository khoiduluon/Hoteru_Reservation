package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Room;
import com.hoterureservation.repositories.RoomRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RoomRestController {

    @Autowired RoomRepository service;

    @GetMapping("/api/AllRoom")
    public List<Room> getFoodAll(){
        return service.findAll();
    }
    
}
