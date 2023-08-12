package com.viva.demo.service;

import com.viva.demo.dao.JdbcUserDao;
import com.viva.demo.model.User;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class AuthenticationService {

    private JdbcUserDao jdbcUserDao;

    public AuthenticationService(JdbcUserDao jdbcUserDao) { this.jdbcUserDao = jdbcUserDao;}

    public List<User> findAll(){
        return jdbcUserDao.findAll();
    }

    public User getUserById(int userId){
        return jdbcUserDao.getUserById(userId);
    }

    public User findByUsername(String username){
        return jdbcUserDao.findByUsername(username);
    }

    public int findIdByUsername(String username){
        return findIdByUsername(username);
    }

    public User create(User newUser){
        return jdbcUserDao.create(newUser);
    }

    public int validateUser(String username, String password) {
        User user = jdbcUserDao.findByUsername(username);
         if (user != null && user.getPassword().equals(password)) {
             return 1;
         }
         if (user != null && !user.getPassword().equals(password)) {
             return 2;
         } else {
             return 3;
         }
    }










}
