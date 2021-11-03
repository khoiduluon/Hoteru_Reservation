package com.hoterureservation.repositories;

import com.hoterureservation.entities.Services;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Services, Long>{
  @Query("Select count(s) from Service s")
  public int countService();
}
