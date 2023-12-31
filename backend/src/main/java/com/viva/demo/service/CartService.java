package com.viva.demo.service;

import com.viva.demo.dao.CartItemDao;
import com.viva.demo.dao.ProductDao;
import com.viva.demo.dao.UserDao;
import com.viva.demo.model.Cart;
import com.viva.demo.model.CartItem;
import com.viva.demo.model.Product;
import com.viva.demo.model.User;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.Principal;
import java.util.List;

@Component
public class CartService {

    private CartItemDao cartItemDao;
    private ProductDao productDao;
    private UserDao userDao;
    private TaxService taxService;

    public CartService(CartItemDao cartItemDao, ProductDao productDao, UserDao userDao, TaxService taxService) {
        this.cartItemDao = cartItemDao;
        this.productDao = productDao;
        this.userDao = userDao;
        this.taxService = taxService;
    }


    public Cart getUserCart(String username) {
        User user = userDao.findByUsername(username);
        int userId =  user.getId();

        // Get the list of items in the user's cart
        List<CartItem> items = cartItemDao.getByUserId(userId);
        Cart cart = new Cart(items);

        // Get the list of Products
        List<Product> products = productDao.getProductsInUserCart(userId);

        // Merge the Product data into the Cart Items
        for (CartItem item : items) {
            item.setProduct(findProduct(products, item.getProductId()));
        }

        // With all the items in the cart, now the subtotal (calculated in the getter) is accurate. Now
        // use an external tax table API to calculate the tax for this order.
        BigDecimal taxRate = taxService.getTaxRate(user.getStateCode());
        BigDecimal subtotal = cart.getItemSubtotal();
        BigDecimal tax = subtotal.multiply(taxRate).setScale(2, RoundingMode.UP);
        cart.setTax(tax);
        return cart;
    }

    public void clearCart(int userId) {
        cartItemDao.clearItemsByUserId(userId);
    }

    private Product findProduct(List<Product> products, int productId) {
        for (Product product : products) {
            if (product.getId() == productId) {
                return product;
            }
        }
        return null;
    }

    private int getUserId(Principal principal) {
        return userDao.findByUsername(principal.getName()).getId();
    }



    public CartItem addToCart(CartItem item) {
        // See if it's in the cart
        CartItem existingItem = cartItemDao.getByProductAndUser(item.getProductId(), item.getUserId());

        if (existingItem == null) {
            // Not in the cart yet -- add it
            int newId = cartItemDao.insert(item);
            return cartItemDao.getById(newId, item.getUserId());
        } else {
            // It's in the cart, update the quantity
            existingItem.setQuantity(existingItem.getQuantity() + item.getQuantity());
            cartItemDao.update(existingItem);
            return cartItemDao.getById(existingItem.getCartItemId(), item.getUserId());
        }
    }

    public CartItem updateCartItem(CartItem cartItem) {
        cartItemDao.update(cartItem);
        return cartItemDao.getById(cartItem.getCartItemId(), cartItem.getUserId());
    }

    public void removeFromCart(int cartItemId) {
        cartItemDao.delete(cartItemId);
    }







}
