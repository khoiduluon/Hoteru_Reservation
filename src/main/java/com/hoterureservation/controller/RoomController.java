package com.hoterureservation.controller;

import javax.servlet.http.HttpServletRequest;
import com.hoterureservation.entities.Room;
import com.hoterureservation.services.CommentService;
import com.hoterureservation.services.RoomService;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @Autowired
    private CommentService commentService;

    @Autowired
    HttpServletRequest request;

    @GetMapping("/list")
    public String listRoom(Model model) {
        model.addAttribute("listRoom",roomService.findAll());
        return "Room/rooms";
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") String id, Model model){
        model.addAttribute("room",roomService.findById(id));
        model.addAttribute("comment",commentService.countComment(id));
        return "Room/room-details";
    }

    @PostMapping("/search")
    public String search(Model model){
        String []months ={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
        String inDate = request.getParameter("checkin");
        String outDate = request.getParameter("checkout");
        String id = request.getParameter("roomType");
        String[] splitsIn = inDate.split(" ");
        String[] splitsOut= outDate.split(" ");
        int monthIn = 0, monthOut = 0;
        for(int i = 0; i < months.length; i++){
            if(splitsIn[1].equalsIgnoreCase(months[i])){
                monthIn = i + 1;
            }
            if(splitsOut[1].equalsIgnoreCase(months[i])){
                monthOut = i + 1;
            }
        }
        String checkin = splitsIn[2] + "/" + monthIn + "/" + splitsIn[0];
        String checkout = splitsOut[2] + "/" + monthOut + "/" + splitsOut[0];
        model.addAttribute("listRoom",roomService.search(checkin, checkout, id));
        return "Room/rooms";
    }
}
