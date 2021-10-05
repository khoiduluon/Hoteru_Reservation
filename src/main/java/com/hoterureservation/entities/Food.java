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
@Table(name = "Food")
public class Food implements Serializable{

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
	@OneToMany(mappedBy = "food")
	List<RoomFood> roomFood;
}
