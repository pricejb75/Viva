package com.viva.demo.controller;

import com.viva.demo.model.Cart;
import com.viva.demo.model.CartItem;
import com.viva.demo.service.CartService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@RestController
@CrossOrigin
@RequestMapping("/api/cart")
public class CartController {

    private CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    // Get the user's cart
    @RequestMapping(path = "", method = RequestMethod.GET)
    public Cart get(Principal principal) {
        return cartService.getUserCart(principal);
    }

    // Add an item to the user's cart
    @RequestMapping(path = "/items", method = RequestMethod.POST)
    public CartItem addProduct(@RequestBody CartItem item, Principal principal) {
        return cartService.addToCart(principal, item);
    }

    // Remove an item from the user's cart
    @RequestMapping(path = "/items/{itemId}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeProduct(@PathVariable int itemId, Principal principal) {
        cartService.removeFromCart(principal, itemId);
    }

    // Clear the user's cart
    @RequestMapping(path = "", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void clear(Principal principal) {
        cartService.clearCart(principal);
    }


}
