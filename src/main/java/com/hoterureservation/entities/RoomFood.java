package com.hoterureservation.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
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
