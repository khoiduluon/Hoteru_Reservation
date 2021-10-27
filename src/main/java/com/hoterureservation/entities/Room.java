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
    @OneToMany(mappedBy = "roomb")
    List<Booking> booking;

    @JsonIgnore
    @OneToMany(mappedBy = "roomc")
    List<Comment> comment;

    @Override
    public String toString() {
        return "Room{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", image1='" + image1 + '\'' +
                ", image2='" + image2 + '\'' +
                ", image3='" + image3 + '\'' +
                ", image4='" + image4 + '\'' +
                ", description='" + description + '\'' +
                super.toString() +
                '}';
    }
}
