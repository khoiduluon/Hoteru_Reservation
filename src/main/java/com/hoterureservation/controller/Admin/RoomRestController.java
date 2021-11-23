package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.dtos.RoomDtos;
import com.hoterureservation.entities.Room;
import com.hoterureservation.entities.RoomType;
import com.hoterureservation.repositories.RoomRepository;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.RoomTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @PostMapping("/api/insertRoom")
    public Room insert(@RequestBody RoomDtos obj){
        System.out.println(obj);
        Room room = new Room();
        RoomType type = serviceType.findByID(obj.getRoomType());

        room.setId(obj.getId());
        room.setName(obj.getName());
        room.setRoomType(type);
        room.setDescription(obj.getDescription());
        room.setImage1(obj.getImage());
        room.setImage2(obj.getImage());
        room.setImage3(obj.getImage());
        room.setImage4(obj.getImage());
        return service.save(room);
    }

    @GetMapping("/api/deleteRoom/{id}")
    public Boolean DeleteFood(@PathVariable("id") String id){
        try {
            service.deleteRoom(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

    
}
