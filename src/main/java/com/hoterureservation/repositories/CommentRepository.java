package com.hoterureservation.repositories;

import com.hoterureservation.entities.Comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long>{
    @Query("select COUNT(u) from Comment u where u.roomc.id = ?1")
    public int countComment(String id);

    @Query("select u from Comment u where u.roomc.id = ?1")
    public List<Comment> getCommnetByRoomId(String id);
}
