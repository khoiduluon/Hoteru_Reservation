package com.hoterureservation.controller;


import com.hoterureservation.services.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @GetMapping("/list")
    public String listRoom(Model model) {
        model.addAttribute("listRoom",roomService.findAll());
        return "Room/rooms";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model){
        model.addAttribute("room",roomService.findById(id));
        return "Room/room-details";
    }
}
