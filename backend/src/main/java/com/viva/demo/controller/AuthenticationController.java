package com.viva.demo.controller;

import com.viva.demo.enums.LoginResult;
import com.viva.demo.model.LoginDto;
import com.viva.demo.model.LoginResponseDto;
import com.viva.demo.service.AuthenticationService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api/authentication")
public class AuthenticationController {


    private AuthenticationService authenticationService;


    @PostMapping
    public ResponseEntity<LoginResponseDto> authenticateUser (@RequestBody LoginDto loginDto){
       LoginResponseDto loginResponseDto =
               authenticationService.validateUser(loginDto.getUsername(),loginDto.getPassword());
       if (loginResponseDto.getLoginResult() == LoginResult.SUCCESS) {
           return new ResponseEntity<>(loginResponseDto, HttpStatus.OK);
       }

       return new ResponseEntity<>(loginResponseDto, HttpStatus.UNAUTHORIZED);

    }


}
