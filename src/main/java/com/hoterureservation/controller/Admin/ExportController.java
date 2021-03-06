package com.hoterureservation.controller.Admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import javax.servlet.http.HttpServletResponse;
import com.hoterureservation.Export.*;
import com.hoterureservation.entities.*;
import com.hoterureservation.repositories.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/excel")
public class ExportController {
  @Autowired
  private CustomerRepository customerRepository;
  @Autowired
  private ServiceRepository serviceRepository;
  @Autowired
  private FoodRepository foodRepository;
  @Autowired
  private RoomRepository roomRepository;
  @Autowired
  private BookingRepository bookingRepository;
  
  @GetMapping("/customer")
  public void exportCustomer(HttpServletResponse response, @RequestParam("key") String key){
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username = ((UserDetails)principal).getUsername();
    Customer customer = customerRepository.findById(username).get();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String toDay = dateFormat.format(new Date());

    List<Customer> list = new ArrayList<>();
    if(key.isEmpty() || key == null){
      list = customerRepository.findAll();
    }else{
      list = customerRepository.findByFullnameLike("%" + key + "%");
    }

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachement; filename=Customer_" + toDay + ".xlsx");
    ExportCustomerService exportCustomerService = new ExportCustomerService(customer.getFullname(), toDay, list);
    exportCustomerService.export(response);
  }

  @GetMapping("/room")
  public void exportRoom(HttpServletResponse response, @RequestParam("key") String key){
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username = ((UserDetails)principal).getUsername();
    Customer customer = customerRepository.findById(username).get();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String toDay = dateFormat.format(new Date());
    List<Room> list = new ArrayList<>();
    if(key.isEmpty() || key == null){
      list = roomRepository.findAll();
    }else{
      list = roomRepository.findByNameLike("%" + key + "%");
    }
    
    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachement; filename=Room_" + toDay + ".xlsx");
    ExportRoomService exportRoomService = new ExportRoomService(customer.getFullname(), toDay, list);
    exportRoomService.export(response);
  }

  @GetMapping("/food")
  public void exportFood(HttpServletResponse response, @RequestParam("key") String key){
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username = ((UserDetails)principal).getUsername();
    Customer customer = customerRepository.findById(username).get();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String toDay = dateFormat.format(new Date());

    List<Food> list = new ArrayList<>();
    if(key.isEmpty() || key == null){
      list = foodRepository.findAll();
    }else{
      list = foodRepository.findByNameLike("%" + key + "%");
    }

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachement; filename=Food_" + toDay + ".xlsx");
    ExportFoodService exportFoodService = new ExportFoodService(customer.getFullname(), toDay, list);
    exportFoodService.export(response);
  }

  @GetMapping("/booking")
  public void exportBooking(HttpServletResponse response, @RequestParam("key") String key){
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username = ((UserDetails)principal).getUsername();
    Customer customer = customerRepository.findById(username).get();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String toDay = dateFormat.format(new Date());

    List<Booking> list = new ArrayList<>();
    if(key.isEmpty() || key == null){
      list = bookingRepository.findAll();
    }else{
      list = bookingRepository.findByFullnameLike("%" + key + "%");
    }

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachement; filename=Booking_" + toDay + ".xlsx");
    ExportBookingService exportBookingService = new ExportBookingService(customer.getFullname(), toDay, list);
    exportBookingService.export(response);
  }

  @GetMapping("/service")
  public void exportService(HttpServletResponse response, @RequestParam("key") String key){
    Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    String username = ((UserDetails)principal).getUsername();
    Customer customer = customerRepository.findById(username).get();

    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    String toDay = dateFormat.format(new Date());

    List<Services> list = new ArrayList<>();
    if(key.isEmpty() || key == null){
      list = serviceRepository.findAll();
    }else{
      list = serviceRepository.findByNameLike("%" + key + "%");
    }

    response.setContentType("application/octet-stream");
    response.setHeader("Content-Disposition", "attachement; filename=Service_" + toDay + ".xlsx");
    ExportServiceService exportServiceService = new ExportServiceService(customer.getFullname(), toDay, list);
    exportServiceService.export(response);
  }
}
