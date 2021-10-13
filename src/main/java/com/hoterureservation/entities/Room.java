package com.hoterureservation.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Room")
public class Room implements Serializable {

    @Id
    @Column(name = "id")
    String id;

    @Column(name = "name")
    String name;

    @Column(name = "thumbnail")
    String thumbnail;

    @Column(name = "image1")
    String image1;

    @Column(name = "image2")
    String image2;

    @Column(name = "image3")
    String image3;

    @Column(name = "image4")
    String image4;

    @Column(name = "description")
    String description;

    @ManyToOne
    @JoinColumn(name = "roomtype_id")
    RoomType roomType;

    @JsonIgnore
    @OneToMany(mappedBy = "rooms")
    List<ServiceRoom> roomService;

    @JsonIgnore
    @OneToMany(mappedBy = "roomf")
    List<RoomFood> roomFood;

    @JsonIgnore
    @OneToMany(mappedBy = "roomb")
    List<Booking> booking;

    @JsonIgnore
    @OneToMany(mappedBy = "roomc")
    List<Comment> bomment;
}
