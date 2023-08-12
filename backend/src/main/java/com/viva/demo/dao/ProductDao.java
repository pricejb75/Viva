package com.viva.demo.dao;

import com.viva.demo.model.Product;

import java.util.List;

public interface ProductDao {

    List<Product> getAllProducts();

    Product getProductByProductId(int id);

    List<Product> getProductsByCountryId(int id);

    List<Product> getProductsByProductTypeId(int id);

    List<Product> getProductsByQualityDetail(String color);

    List<Product> getProductsByPrice(int lowEnd, int highEnd);

    List<Product> getProductsInUserCart(int userId);
}
