package com.hoterureservation.services;

import com.hoterureservation.entities.Comment;

import java.util.List;

public interface CommentService {

    public int countComment(String id);

    public List<Comment> getCommnetByRoomId(String id);

    public Comment save(Comment comment);

    public void delete(Long id);
}
