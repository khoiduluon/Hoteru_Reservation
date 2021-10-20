package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Service;
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
        Service item = new Service();
        model.addAttribute("item", item);
        List<Service> serviceItems = serviceRepository.findAll();
        model.addAttribute("List", serviceItems);
        return "Admin/Service";
    }

    @RequestMapping("/service/edit/{id}")
    public String edit(Model model, @PathVariable("id") Long id) {
        Service item = serviceRepository.findById(id).get();
        model.addAttribute("item", item);
        List<Service> items = serviceRepository.findAll();
        model.addAttribute("List", items);
        return "Admin/Service";
    }

    @RequestMapping("/service/save")
    public String create(Service item) {
        serviceRepository.save(item);
        return "redirect:/Service";
    }

    @RequestMapping("/service/update")
    public String update(Service item, Model model) {
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
