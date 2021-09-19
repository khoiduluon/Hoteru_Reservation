package com.HotelReservation.Controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {

    @GetMapping("/list")
    public String listRoom() {
        return "Room/rooms";
    }

    @GetMapping("/detail")
    public String detail(){
        return "Room/room-details";
    }
}
