package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "RoomType")
public class RoomType implements Serializable{

  @Id
  @Column(name = "id")
	String id;
  
  @Column(name = "name")
	String name;

  @Column(name = "price")
	Double price;

  @Column(name = "size")
	Double size;

  @Column(name = "capacity")
	Long capacity;

  @JsonIgnore
	@OneToMany(mappedBy = "roomType")
	List<Room> room;

  @ManyToOne
	@JoinColumn(name = "bed_code")
	Bed typeBed;
}
