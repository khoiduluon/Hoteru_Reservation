package com.hoterureservation.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "RoomService")
public class ServiceRoom implements Serializable{

  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

	@ManyToOne
	@JoinColumn(name = "service_id")
	Service service;

	@ManyToOne
	@JoinColumn(name = "room_id")
	Room rooms;
}
