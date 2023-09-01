package com.viva.demo.model;

import com.viva.demo.enums.RegisterResult;

public class RegisterResponseDto {

    private RegisterResult registerResult;

    public RegisterResult getRegisterResult() {
        return registerResult;
    }

    public void setRegisterResult(RegisterResult registerResult) {
        this.registerResult = registerResult;
    }
}
