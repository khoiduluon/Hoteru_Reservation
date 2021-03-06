package com.hoterureservation.repositories;

import com.hoterureservation.entities.Bed;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BedRepository extends JpaRepository<Bed, String>{

}
