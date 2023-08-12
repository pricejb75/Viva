package com.viva.demo.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class AuthenticationController {

    /*
    TO D0 -
        This class should call the method defined in the Authentication Service class called validateUser()

        if 1 is returned -> Properties of User stored in Vuex Data Store and user is taken into website
        they can see shopping cart icons, add items to wishlist, and add items to cart

        if 2 is returned -> They recieve a message like "Username is correct but wrong password."

        if 3 is returned -> they get "There is no user matching entry in our database"
     */

}
