package com.hoterureservation.controller;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.validation.Valid;

@Controller
public class SecurityController {

    @Autowired
    CustomerService customerService;

    @RequestMapping("/login")
    public String login(Model model, @RequestParam(value = "error", required = false) String error) {
        ;
        if (error != null) {
            model.addAttribute("errorMessage", "Username or Password không đúng");
        }
        return "Security/login";
    }


    @GetMapping("/register")
    public String create(@ModelAttribute("customer") Customer customer) {
        return "Security/register";
    }

    @PostMapping("/register")
    public String register(Model model, @Valid Customer customer, BindingResult bindingResult) {
        if (customerService.checkUserExist(customer.getUsername())) {
            model.addAttribute("message", "Username đã tồn tại");
        } else if (!customer.getPassword().equals(customer.getRe_password())) {
            model.addAttribute("message", "Mật khẩu không trùng");
        }
            model.addAttribute("message", "Đăng ký thành công");
            customer.setRole("Customer");
            customerService.save(customer);


        return "Security/register";
    }
}
