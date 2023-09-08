package com.viva.demo.controller;

import com.viva.demo.model.Cart;
import com.viva.demo.model.CartItem;
import com.viva.demo.service.CartService;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping("/api/cart")
public class CartController {

    private CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    // Get the user's cart
    @GetMapping("/{username}")
    public Cart get(@PathVariable String username) {
        return cartService.getUserCart(username);
    }

    // Add an item to the user's cart
    @PostMapping("/items")
    public CartItem addProduct(@RequestBody CartItem item) {
        return cartService.addToCart(item);
    }

    // Remove an item from the user's cart
    @DeleteMapping("/items/{cartItemId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeProduct(@PathVariable int cartItemId) {
        cartService.removeFromCart(cartItemId);
    }

    @PutMapping("/items")
    public CartItem updateCartItem( @RequestBody CartItem cartItem) {
        return cartService.updateCartItem(cartItem);
    }

    // Clear the user's cart

    @DeleteMapping("/{userId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void clear(@PathVariable int userId) {
        cartService.clearCart(userId);
    }


}
