package com.viva.demo.dao;

import com.viva.demo.model.CartItem;

import java.util.List;

public interface CartItemDao {


    CartItem getById(int cartItemId, int userId);

    CartItem getByProductAndUser(int productId, int userId);
    List<CartItem> getByUserId(int userId);
    int insert(CartItem item);
    void update(CartItem item);
    void delete(int cartItemId, int userId);

    void delete(int cartItemId);

    void clearItemsByUserId(int userId);




}
