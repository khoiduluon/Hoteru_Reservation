package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.entities.Services;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRepository extends JpaRepository<Services, Long>{
  @Query("Select count(s) from Services s")
  public int countService();

  public List<Services> findByNameLike(String key);
}
