package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.hibernate.annotations.Where;

import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Booking")
public class Booking implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

  @Column(name = "book_Date")
  Date bookDate;

  @Column(name = "in_Date")
  Date inDate;

  @Column(name = "out_Date")
	Date outDate;

  @Column(name = "total")
	Double total;

  @Column(name = "fullname")
	String fullname;

  @Column(name = "phone")
	String phone;

  @Column(name = "status")
	String status;

  @ManyToOne
	@JoinColumn(name = "room_id")
	Room roomb;

  @ManyToOne
	@JoinColumn(name = "username")
	Customer customerb;

  @JsonIgnore
  @OneToMany(mappedBy = "bookingf")
  List<FoodBooking> foodBookings;

  @JsonIgnore
  @OneToMany(mappedBy = "bookings")
  List<ServiceBooking> serviceBookings;
}
