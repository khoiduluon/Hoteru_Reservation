package com.hoterureservation.entities;
import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@EntityScan
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
