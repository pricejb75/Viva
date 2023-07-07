package com.viva.demo.service;

import com.viva.demo.dao.JdbcCountryDao;
import com.viva.demo.dao.JdbcProductDao;
import com.viva.demo.dao.JdbcProductTypeDao;
import com.viva.demo.model.Product;
import com.viva.demo.model.ProductBase;
import com.viva.demo.model.ProductDO;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.List;

@Component
public class ProductService {

    private JdbcProductDao jdbcProductDao;
    private JdbcCountryDao jdbcCountryDao;
    private JdbcProductTypeDao jdbcProductTypeDao;


    public ProductService(JdbcProductDao jdbcProductDao, JdbcCountryDao jdbcCountryDao, JdbcProductTypeDao jdbcProductTypeDao) {
        this.jdbcProductDao = jdbcProductDao;
        this.jdbcCountryDao = jdbcCountryDao;
        this.jdbcProductTypeDao = jdbcProductTypeDao;
    }

    public List<Product> getAllProducts() {
        return jdbcProductDao.getAllProducts();
    }

    public Object getAllProducts(String qualityDetail, int type, int country, BigDecimal lowEnd, BigDecimal highEnd, Boolean withLinks) {
        List<Product> products = getAllProducts()
                .stream()
                .filter(p -> (type == 0 || p.getProductType() == type) &&
                        (country == 0 || p.getCountryId() == country) &&
                        p.getPrice().compareTo(lowEnd) >= 0 &&
                        p.getPrice().compareTo(highEnd) <= 0)
                .toList();

        if (withLinks) {
            return products.stream().map(p -> turnProductIntoProductDO(p)).toList();
        }

        return products;
    }

    public ProductBase getProductByProductId(int id, Boolean withLinks) {
        Product product = jdbcProductDao.getProductByProductId(id);
        if (withLinks) {
            return turnProductIntoProductDO(product);
        }
        return product;
    }

    public ProductDO turnProductIntoProductDO(Product product) {
        ProductDO result = new ProductDO();
        result.setId(product.getId());
        result.setName(product.getName());
        result.setDescription(product.getDescription());
        result.setPrice(product.getPrice());
        result.setInventory(product.getInventory());
        result.setCountry(jdbcCountryDao.getById(product.getCountryId()));
        result.setProductType(jdbcProductTypeDao.getById(product.getProductType()));
        return result;
    }

}
