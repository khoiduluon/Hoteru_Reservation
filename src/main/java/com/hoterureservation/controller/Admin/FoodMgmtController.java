package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Food;
import com.hoterureservation.repositories.FoodRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FoodMgmtController {
    @Autowired
    FoodRepository foodRepository;

    @RequestMapping("/Food")
    public String show(Model model) {
        // load Customer
        Food item = new Food();
        model.addAttribute("item", item);
        List<Food> FoodItems = foodRepository.findAll();
        model.addAttribute("List", FoodItems);
        return "Admin/Food";
    }

    @RequestMapping("/food/edit/{id}")
    public String edit(Model model, @PathVariable("id") Long id) {
        Food item = foodRepository.findById(id).get();
        model.addAttribute("item", item);
        List<Food> items = foodRepository.findAll();
        model.addAttribute("List", items);
        return "Admin/Food";
    }

    @RequestMapping("/food/save")
    public String create(Food item) {
        foodRepository.save(item);
        return "redirect:/Food";
    }

    @RequestMapping("/food/update")
    public String update(Food item, Model model) {
        try {
            foodRepository.save(item);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/food/edit/" + item.getId();
    }

    @RequestMapping("/food/delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model) {
        try {
            foodRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/Food";
    }
    
}
