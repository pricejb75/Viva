package com.viva.demo.service;

import com.viva.demo.dao.JdbcProductTypeDao;
import com.viva.demo.model.ProductType;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public class ProductTypeService {

    private JdbcProductTypeDao jdbcProductTypeDao;

    public ProductTypeService(JdbcProductTypeDao jdbcProductTypeDao) {
        this.jdbcProductTypeDao = jdbcProductTypeDao;
    }

    public List<ProductType> getAllProductTypes() {
        return jdbcProductTypeDao.getAll();
    }

    public ProductType getProductTypeById(int id) {
        return jdbcProductTypeDao.getById(id);
    }

}




