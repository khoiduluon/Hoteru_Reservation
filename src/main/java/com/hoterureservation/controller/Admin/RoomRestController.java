package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Room;
import com.hoterureservation.entities.RoomType;
import com.hoterureservation.repositories.RoomRepository;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.RoomTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RoomRestController {

    @Autowired RoomRepository repository;

    @Autowired RoomService    service;

    @Autowired RoomTypeService serviceType;

    @GetMapping("/api/AllRoom")
    public List<Room> getRoomALl(){
        return service.findAll();
    }

    @GetMapping("/api/room/{id}")
    public Room getOne(@PathVariable("id") String id){
        return service.findById(id);
    }

    @GetMapping("/api/AllType")
    public List<RoomType> getTypeALl(){
        return serviceType.findAll();
    }

    
}
