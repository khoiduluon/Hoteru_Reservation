package com.hoterureservation.repositories;

import java.util.List;

import com.hoterureservation.entities.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, String>{
  @Query("Select count(c) from Customer c")
  public int countCustomer();

  public List<Customer> findByFullnameLike(String key);
}
