package com.hoterureservation.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Booking_Food")
public class FoodBooking implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

	@ManyToOne
	@JoinColumn(name = "food_id")
	Food food;

	@ManyToOne
	@JoinColumn(name = "booking_id")
	Booking bookingf;
}
