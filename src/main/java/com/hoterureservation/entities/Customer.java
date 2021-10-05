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
@Table(name = "Customer")
public class Customer implements Serializable{
  
  @Id
  @Column(name = "username")
  String username;

  @Column(name = "password")
	String password;

  @Column(name = "fullname")
	String fullname;

  @Column(name = "phone")
	String phone;

  @Column(name = "address")
	String address;

  @Column(name = "email")
	String email;

  @Column(name = "isAdmin")
	boolean isAdmin = false;

  @JsonIgnore
	@OneToMany(mappedBy = "customerb")
	List<Booking> booking;

  
  @JsonIgnore
	@OneToMany(mappedBy = "customerc")
	List<Comment> comment;
}
