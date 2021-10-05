package com.hoterureservation.entities;
import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@EntityScan
@Table(name = "RoomFood")
public class RoomFood implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

	@ManyToOne
	@JoinColumn(name = "food_id")
	Food food;

	@ManyToOne
	@JoinColumn(name = "room_id")
	Room roomf;
}
