package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@EntityScan
@Table(name = "Booking")
public class Booking implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

  @Column(name = "inDate")
  Date inDate;

  @Column(name = "outDate")
	Date outDate;

  @Column(name = "total")
	Double total;

  @ManyToOne
	@JoinColumn(name = "room_id")
	Room roomb;

  @ManyToOne
	@JoinColumn(name = "username")
	Customer customerb;
}
