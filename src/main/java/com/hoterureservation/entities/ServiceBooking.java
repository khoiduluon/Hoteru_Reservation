package com.hoterureservation.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Booking_Service")
public class ServiceBooking implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

	@ManyToOne
	@JoinColumn(name = "service_id")
	Services service;

	@ManyToOne
	@JoinColumn(name = "booking_id")
	Booking bookings;
}
