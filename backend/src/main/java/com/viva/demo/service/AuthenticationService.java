package com.viva.demo.service;

import com.viva.demo.dao.JdbcUserDao;
import com.viva.demo.enums.LoginResult;
import com.viva.demo.enums.RegisterResult;
import com.viva.demo.model.LoginResponseDto;
import com.viva.demo.model.RegisterResponseDto;
import com.viva.demo.model.RegisterUserDto;
import com.viva.demo.model.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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

    public RegisterResponseDto register(RegisterUserDto registerUserDto) {
        RegisterResponseDto response = new RegisterResponseDto();

        // Ensure password and confirmpassword are the same
        if (!registerUserDto.getPassword().equals(registerUserDto.getConfirmPassword())) {
            response.setRegisterResult(RegisterResult.PASSWORDS_DO_NOT_MATCH);
            return response;
        }

        // Check to make sure username is unique
        try {
            findByUsername(registerUserDto.getUsername());
            response.setRegisterResult(RegisterResult.USERNAME_ALREADY_EXISTS);
            return response;
        } catch (Exception ignored) {}

        // Create the User object to pass to the create method
        User user = new User();
        user.setCity(registerUserDto.getCity());
        user.setPassword(registerUserDto.getPassword());
        user.setAddress(registerUserDto.getAddress());
        user.setName(registerUserDto.getName());
        user.setCity(registerUserDto.getCity());
        user.setStateCode(registerUserDto.getStateCode());
        user.setUsername(registerUserDto.getUsername());
        user.setZIP(registerUserDto.getZIP());

        // Attempt to create user
        try {
            create(user);
            response.setRegisterResult(RegisterResult.SUCCESS);
        } catch (Exception e) {
            response.setRegisterResult(RegisterResult.UNKNOWN_ERROR);
        }

        return response;

    }


    public LoginResponseDto validateUser(String username, String password) {
        LoginResponseDto validationDto = new LoginResponseDto();
        User user = jdbcUserDao.findByUsername(username);

        //@TODO Change to immediate returns rather than using else/ifs
         if (user != null && user.getPassword().equals(password)) {
             validationDto.setUsername(user.getUsername());
             validationDto.setId(user.getId());
             validationDto.setLoginResult(LoginResult.SUCCESS);
         }
         else if (user != null && !user.getPassword().equals(password)) {
             validationDto.setLoginResult(LoginResult.BAD_PASSWORD);
         } else {
             validationDto.setLoginResult(LoginResult.USER_DOES_NOT_EXIST);
         }

         return validationDto;
    }










}
