package com.viva.demo.controller;

import com.viva.demo.enums.LoginResult;
import com.viva.demo.enums.RegisterResult;
import com.viva.demo.model.LoginDto;
import com.viva.demo.model.LoginResponseDto;
import com.viva.demo.model.RegisterResponseDto;
import com.viva.demo.model.RegisterUserDto;
import com.viva.demo.service.AuthenticationService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api")
public class AuthenticationController {

    private AuthenticationService authenticationService;

    public AuthenticationController(AuthenticationService authenticationService){
        this.authenticationService = authenticationService;
    }

    @PostMapping("/register")
    public ResponseEntity<RegisterResponseDto> registerUser (@RequestBody RegisterUserDto registerUserDto) {

        RegisterResponseDto registerResponseDto = authenticationService.register(registerUserDto);

        if (registerResponseDto.getRegisterResult() == RegisterResult.SUCCESS) {
            return new ResponseEntity<>(registerResponseDto, HttpStatus.CREATED);
        }
        if (registerResponseDto.getRegisterResult() == RegisterResult.UNKNOWN_ERROR) {
            return new ResponseEntity<>(registerResponseDto, HttpStatus.INTERNAL_SERVER_ERROR);
        }

        return new ResponseEntity<>(registerResponseDto, HttpStatus.BAD_REQUEST);


    }

    @PostMapping("/authenticate")
    public ResponseEntity<LoginResponseDto> authenticateUser (@RequestBody LoginDto loginDto){
       LoginResponseDto loginResponseDto =
               authenticationService.validateUser(loginDto.getUsername(),loginDto.getPassword());
       if (loginResponseDto.getLoginResult() == LoginResult.SUCCESS) {
           return new ResponseEntity<>(loginResponseDto, HttpStatus.OK);
       }

       return new ResponseEntity<>(loginResponseDto, HttpStatus.UNAUTHORIZED);

    }


}
