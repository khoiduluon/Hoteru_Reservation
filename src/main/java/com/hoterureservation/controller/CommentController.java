package com.hoterureservation.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hoterureservation.entities.Comment;
import com.hoterureservation.entities.Room;
import com.hoterureservation.services.CommentService;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.RoomService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private HttpServletRequest request;

    @GetMapping("/room")
    public String getRoom(Model model){
        List<Room> list = roomService.findAll();
        model.addAttribute("list", list);
        return "News/blog";
    }

    @GetMapping("/room/{id}")
    public String getCommentRoom(Model model,@PathVariable("id")String id){
        List<Comment> list = commentService.getCommnetByRoomId(id);
        model.addAttribute("listcmt", list);
        model.addAttribute("comment",commentService.countComment(id));
        model.addAttribute("room",roomService.findById(id));
        return "News/blog-details";
    }

    @PostMapping("/create/{id}")
    public String comment(@PathVariable("id")String id){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        Comment comment = new Comment();
        comment.setRoomc(roomService.findById(id));
        comment.setCustomerc(customerService.findByUsername(username));
        comment.setDescription(request.getParameter("description"));
        commentService.save(comment);
        return "redirect:/comment/room/"+id;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id")Long id, @RequestParam("roomid")String roomid){
        commentService.delete(id);
        return "redirect:/comment/room/"+roomid;
    }
}
