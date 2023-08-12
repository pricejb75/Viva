package com.viva.demo.dao;

import com.viva.demo.model.Wishlist;
import com.viva.demo.model.WishlistItem;

import java.util.List;

public interface WishlistDao {


    List<Wishlist> getWishlists(int userId);

    Wishlist getWishlist(int userId, int id);

    Wishlist createWishlist(Wishlist wishlist);

    void deleteWishlist(int userId, int wishlistId);

    int addItem(WishlistItem wishlistItem);

    void removeItem(int userId, int wishlistId, int productId);

    WishlistItem getWishlistItemByProduct(int wishlistId, int productId);


}
