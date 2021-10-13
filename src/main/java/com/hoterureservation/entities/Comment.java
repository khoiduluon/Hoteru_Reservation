package com.hoterureservation.entities;

import java.io.Serializable;
import javax.persistence.*;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
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
