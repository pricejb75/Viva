package com.viva.demo.service;

import com.viva.demo.dao.JdbcUserDao;
import com.viva.demo.enums.LoginResult;
import com.viva.demo.model.User;
import com.viva.demo.model.LoginResponseDto;
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

    public LoginResponseDto validateUser(String username, String password) {
        LoginResponseDto validationDto = new LoginResponseDto();
        User user = jdbcUserDao.findByUsername(username);
         if (user != null && user.getPassword().equals(password)) {
             validationDto.setUsername(user.getUsername());
             validationDto.setId(user.getId());
             validationDto.setLoginResult(LoginResult.SUCCESS);
         }
         if (user != null && !user.getPassword().equals(password)) {
             validationDto.setLoginResult(LoginResult.BAD_PASSWORD);
         } else {
             validationDto.setLoginResult(LoginResult.USER_DOES_NOT_EXIST);
         }

         return validationDto;
    }










}
