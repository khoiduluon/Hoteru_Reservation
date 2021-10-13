package com.hoterureservation.repositories;

import com.hoterureservation.entities.Service;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Service, Long>{

}
