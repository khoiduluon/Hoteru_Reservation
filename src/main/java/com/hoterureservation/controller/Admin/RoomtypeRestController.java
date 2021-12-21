package com.hoterureservation.controller.Admin;

import java.util.List;
import com.hoterureservation.dtos.RoomTypeDtos;
import com.hoterureservation.entities.Bed;
import com.hoterureservation.entities.RoomType;
import com.hoterureservation.repositories.BedRepository;
import com.hoterureservation.repositories.RoomTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RoomtypeRestController {
    
    @Autowired RoomTypeRepository roomType;

    @Autowired BedRepository bed;

    @GetMapping("/api/AllRoomType")
    public List<RoomType> getRoomALl(){
        return roomType.findAll();
    }

    @GetMapping("/api/roomType/{id}")
    public RoomType getOne(@PathVariable("id") String id){
        return roomType.findById(id).get();
    }

    @GetMapping("/api/AllBed")
    public List<Bed> getTypeALl(){
        return bed.findAll();
    }

    @PostMapping("/api/saveRoomType")
    public RoomType insertRoomType(@RequestBody RoomTypeDtos obj){

        RoomType dtos = new RoomType();
        Bed newBed = bed.findById(obj.getTypeBed()).get();
        dtos.setName(obj.getName());
        dtos.setId(obj.getId());
        dtos.setSize(obj.getSize());
        dtos.setPrice(obj.getPrice());
        dtos.setCapacity(obj.getCapacity());
        dtos.setTypeBed(newBed);

        return roomType.save(dtos);
    }

    @GetMapping("/api/deleteRoomType/{id}")
    public Boolean DeleteFood(@PathVariable("id") String id){
        try {
            roomType.deleteById(id);
            return true;
        }catch (Exception e){
            return false;
        }
    }

}
