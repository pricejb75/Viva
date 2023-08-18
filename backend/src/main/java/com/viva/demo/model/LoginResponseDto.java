package com.viva.demo.model;

import com.viva.demo.enums.LoginResult;

public class LoginResponseDto {

    private int id;
    private String username;
    private LoginResult loginResult;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public LoginResult getLoginResult() {
        return loginResult;
    }

    public void setLoginResult(LoginResult loginResult) {
        this.loginResult = loginResult;
    }
}
