package com.viva.demo.dao;

import com.viva.demo.model.ProductType;

import java.util.List;

public interface ProductTypeDao {


    List<ProductType> getAll();

    ProductType getById(int id);


}
