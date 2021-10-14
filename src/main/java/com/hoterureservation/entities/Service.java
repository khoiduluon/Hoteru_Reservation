package com.hoterureservation.entities;
import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Service")
public class Service implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

  @Column(name = "name")
	String name;

  @Column(name = "price")
	Double price;

  @Column(name = "description")
	String description;

  @JsonIgnore
	@OneToMany(mappedBy = "service")
	List<ServiceBooking> serviceBookings;
}
