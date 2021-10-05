package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@EntityScan
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
