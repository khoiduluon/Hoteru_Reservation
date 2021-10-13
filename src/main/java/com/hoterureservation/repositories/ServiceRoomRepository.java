package com.hoterureservation.repositories;

import com.hoterureservation.entities.ServiceRoom;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ServiceRoomRepository extends JpaRepository<ServiceRoom, Long>{

}
