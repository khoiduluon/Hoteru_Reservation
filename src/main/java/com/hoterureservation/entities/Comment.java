package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@EntityScan
@Table(name = "Comment")
public class Comment implements Serializable{
  
  @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "id")
	Long id;

  @Column(name = "description")
  String description;

	@ManyToOne
	@JoinColumn(name = "room_id")
	Room roomc;

  @ManyToOne
	@JoinColumn(name = "username")
	Customer customerc;
}
