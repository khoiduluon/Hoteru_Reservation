package com.hoterureservation;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.io.File;

import com.hoterureservation.controller.FileUploadController;

@SpringBootApplication
@EnableAutoConfiguration
public class HotelReservationApplication {
	public static void main(String[] args) {
		new File(FileUploadController.uploadDirectory).mkdir();
		SpringApplication.run(HotelReservationApplication.class, args);
	}
}
