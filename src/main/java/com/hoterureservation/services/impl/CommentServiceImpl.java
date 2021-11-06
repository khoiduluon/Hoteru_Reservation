package com.hoterureservation.services.impl;

import com.hoterureservation.entities.Comment;
import com.hoterureservation.repositories.CommentRepository;
import com.hoterureservation.services.CommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentRepository commentRepository;

    @Override
    public int countComment(String id) {
        return commentRepository.countComment(id);
    }

    @Override
    public List<Comment> getCommnetByRoomId(String id) {
        return commentRepository.getCommnetByRoomId(id);
    }

    @Override
    public Comment save(Comment comment) {
        return commentRepository.save(comment);
    }

    @Override
    public void delete(Long id) {
        commentRepository.deleteById(id);
    }
}
