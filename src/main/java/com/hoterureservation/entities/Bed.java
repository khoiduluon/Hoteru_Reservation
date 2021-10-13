package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Bed")
public class Bed implements Serializable{

  @Id
  @Column(name = "code")
	String code;

  @Column(name = "name")
	String name;

  @JsonIgnore
	@OneToMany(mappedBy = "typeBed")
	List<RoomType> roomType;
}
