package com.example.demo.service;

import com.example.demo.model.Todo;
import com.example.demo.repository.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TodoService {

    @Autowired
    private TodoRepository repo;

    public List<Todo> getAll() {
        return repo.findAll();
    }

    public Todo create(Todo todo) {
        return repo.save(todo);
    }

    public Todo update(Long id, Todo updated) {
        Todo todo = repo.findById(id).orElseThrow();
        todo.setTitle(updated.getTitle());
        todo.setDescription(updated.getDescription());
        todo.setCompleted(updated.isCompleted());
        return repo.save(todo);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
