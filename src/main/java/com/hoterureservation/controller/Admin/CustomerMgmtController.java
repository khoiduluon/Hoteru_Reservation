package com.hoterureservation.controller.Admin;

import java.util.List;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.repositories.CustomerRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerMgmtController {

    @Autowired
    CustomerRepository customerRepository;

    @RequestMapping("/Customer")
    public String show(Model model) {
        // load Customer
        Customer item = new Customer();
        model.addAttribute("item", item);
        List<Customer> CustomerItems = customerRepository.findAll();
        model.addAttribute("List", CustomerItems);
        return "Admin/Customer";
    }

    @RequestMapping("/customer/edit/{id}")
    public String edit(Model model, @PathVariable("id") String id) {
        Customer item = customerRepository.findById(id).get();
        model.addAttribute("item", item);
        List<Customer> items = customerRepository.findAll();
        model.addAttribute("List", items);
        return "Admin/Customer";
    }

    @RequestMapping("/customer/save")
    public String create(Customer item) {
        customerRepository.save(item);
        return "redirect:/Customer";
    }

    @RequestMapping("/customer/update")
    public String update(Customer item, Model model) {
        try {
            customerRepository.save(item);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/customer/edit/" + item.getUsername();
    }

    @RequestMapping("/customer/delete/{id}")
    public String delete(@PathVariable("id") String id, Model model) {
        try {
            customerRepository.deleteById(id);
        } catch (Exception e) {
            model.addAttribute("message", "Có Lỗi Xảy Ra");
        }
        return "redirect:/Customer";
    }

}
