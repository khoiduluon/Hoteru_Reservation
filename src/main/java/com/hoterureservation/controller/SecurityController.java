package com.hoterureservation.controller;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class SecurityController {

    @Autowired
    CustomerService customerService;
    @Autowired
    UserService userService;
    @Autowired
    HttpServletRequest request;

    @RequestMapping("/login")
    public String login(Model model, @RequestParam(value = "error", required = false) String error) {
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
            if (!customer.getPassword().equals(customer.getRe_password())) {
                model.addAttribute("message", "Mật khẩu không trùng");
            }
        }
            customer.setRole("Customer");
            customerService.save(customer);
            model.addAttribute("message", "Đăng ký thành công");
        return "Security/register";
    }

    @GetMapping("/update-account")
    public String updateAccount(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        Customer customer = customerService.findByUsername(username);
        model.addAttribute("customer", customer);
        return "Security/update_account";
    }

    @PostMapping("/update-account")
    public String updateAccount(Model model, @Valid Customer customer, BindingResult bindingResult){
        customer.setRole("Customer");
        customerService.update(customer);
        Customer customer1 = customerService.findByUsername(customer.getUsername());
        model.addAttribute("customer", customer1);
        model.addAttribute("message", "Cập nhật thành công");
        return "Security/update_account";
    }

    @GetMapping("/update-password")
    public String updatePassword(Model model){
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        Customer customer = customerService.findByUsername(username);
        model.addAttribute("customer", customer);
        return "Security/update_password";
    }

    @PostMapping("/update-password")
    public String updatePassword(Model model,@Valid Customer customer, BindingResult bindingResult){
        String newpw = request.getParameter("newpassword");
        String repw = request.getParameter("repassword");
        Customer customer2 = customerService.findByUsername(customer.getUsername());
        if(repw.equals(newpw)){
            customer2.setPassword(newpw);
            customerService.update(customer2);
            model.addAttribute("message", "Cập nhật thành công");
        }else{
            model.addAttribute("message", "Xác nhập mật khẩu không trùng với mật khẩu mới");
        }
        return "Security/update_password";
    }

    @GetMapping("/forgot-password")
    public String forgotPassword(){
        return "Security/forgot_password";
    }

    @PostMapping("/forgot-password")
    public String forgotPassword(Model model){
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        Customer customer = customerService.findByUsername(username);
        if(username.equals(customer.getUsername()) && email.equals(customer.getEmail())){
            String text = "Mật khẩu của account " + customer.getUsername() + "là: " + customer.getPassword();
            userService.sendMmail(email, text);
            model.addAttribute("message", "Đã gửi mật khẩu về email của bạn.");
        }else{
            model.addAttribute("message", "Yêu cầu thất bại.");
        }
        return "Security/forgot_password";
    }
}
