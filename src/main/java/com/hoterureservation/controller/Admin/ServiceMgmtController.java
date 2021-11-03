package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Services;
import com.hoterureservation.repositories.ServiceRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ServiceMgmtController {
    
    @Autowired
    ServiceRepository serviceRepository;

    @RequestMapping("/Service")
    public String show(Model model) {
        // load Customer
        Services item = new Services();
        model.addAttribute("item", item);
        List<Services> serviceItems = serviceRepository.findAll();
        model.addAttribute("List", serviceItems);
        return "Admin/Service";
    }

    @RequestMapping("/service/edit/{id}")
    public String edit(Model model, @PathVariable("id") Long id) {
        Services item = serviceRepository.findById(id).get();
        model.addAttribute("item", item);
        List<Services> items = serviceRepository.findAll();
        model.addAttribute("List", items);
        return "Admin/Service";
    }

    @RequestMapping("/service/save")
    public String create(Services item) {
        serviceRepository.save(item);
        return "redirect:/Service";
    }

    @RequestMapping("/service/update")
    public String update(Services item, Model model) {
        try {
            serviceRepository.save(item);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/service/edit/" + item.getId();
    }

    @RequestMapping("/service/delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model) {
        try {
            serviceRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/Service";
    }

}
