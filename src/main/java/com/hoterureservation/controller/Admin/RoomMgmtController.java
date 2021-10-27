package com.hoterureservation.controller.Admin;



import com.hoterureservation.entities.Room;
import com.hoterureservation.entities.RoomType;
import com.hoterureservation.services.RoomService;
import com.hoterureservation.services.RoomTypeService;

import com.hoterureservation.ultil.FileUplloadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class RoomMgmtController {

    @Autowired
    private RoomService roomService;

    @Autowired
    private RoomTypeService roomTypeService;

    @RequestMapping("/admin/room")
    public String show(Model model){
        Room room = new Room();
        List<Room> list = roomService.findAll();
        List<RoomType> listType = roomTypeService.findAll();
        model.addAttribute("room",room);
        model.addAttribute("list",list);
        model.addAttribute("listType",listType);
        return "Admin/Room";
    }

    @RequestMapping("/admin/room/save")
    public String saveRoom(Room room, @RequestParam("image")MultipartFile multipartFile) throws IOException {
        String filename = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        room.setImage1(filename);
        room.setImage2(filename);
        room.setImage3(filename);
        room.setImage4(filename);
        Room saveRoom = roomService.save(room);
        //chỉnh lại chỗ save hình
        String uploadDir = "room-img/" + saveRoom.getId();
        FileUplloadUtil.saveFile(uploadDir,filename,multipartFile);
        return "redirect:/admin/room";
    }

    @RequestMapping("/admin/room/edit/{id}")
    public String editRoom(Model model,@PathVariable("id") String id){
        Room room = roomService.findById(id);
        List<Room> list = roomService.findAll();
        List<RoomType> listType = roomTypeService.findAll();
        model.addAttribute("room",room);
        model.addAttribute("list",list);
        model.addAttribute("listType",listType);
        return "Admin/Room";
    }

    @RequestMapping("/admin/room/delete/{id}")
    public String deleteRoom(Model model, @PathVariable("id") String id){
        try{
            roomService.deleteRoom(id);
        } catch (Exception e){
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/admin/room";
    }
}
