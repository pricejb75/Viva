package com.viva.demo.dao;

import com.viva.demo.model.Product;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcProductDao implements ProductDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcProductDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList();

        String sql = """
                SELECT product_id,
                       product_name,
                       description,
                       price,
                       inventory,
                       country_id,
                       product_type_id
                FROM   product
                """;

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            products.add(mapRowToProduct(results));
        }
        return products;
    }

    @Override
    public Product getProductByProductId(int id) {
        Product product = new Product();
        String sql = "SELECT product_id, product_name, description, price, " +
                "inventory, country_id, product_type_id " +
                "FROM product " +
                "WHERE product_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            product = mapRowToProduct(result);
        }
        return product;
    }

    @Override
    public List<Product> getProductsByCountryId(int id) {
        List<Product> products = new ArrayList();
        String sql = """
                SELECT product_id,
                       product_name,
                       description,
                       price,
                       inventory,
                       country_id,
                       product_type_id
                FROM   product
                WHERE  country_id = ?
                """;
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while (results.next()) {
            products.add(mapRowToProduct(results));
        }
        return products;
    }

    @Override
    public List<Product> getProductsByProductTypeId(int id) {
        List<Product> products = new ArrayList();
        String sql = """
                SELECT product_id,
                       product_name,
                       description,
                       price,
                       inventory,
                       country_id,
                       product_type_id
                FROM   product
                WHERE  product_type_id = ?
                """;
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while (results.next()) {
            products.add(mapRowToProduct(results));
        }
        return products;
    }

    @Override
    public List<Product> getProductsByQualityDetail(String qualityDetail) {
        List<Product> products = new ArrayList();
        String sql = """
                SELECT				  
                	p.product_id,
                	p.product_name,
                	p.description,
                	p.price,
                	p.inventory,
                	p.country_id,
                	p.product_type_id,
                	d.quality_id,
                	d.quality_details,
                	q.quality_name
                FROM
                	product as p
                JOIN
                	details as d ON p.product_id = d.product_id
                JOIN
                	quality as q ON d.quality_id = q.quality_id
                WHERE
                	d.quality_details = ?   
                	""";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, qualityDetail);
        while (results.next()) {
            products.add(mapRowToProduct(results));
        }
        return products;
    }

    @Override
    public List<Product> getProductsByPrice(int lowEnd, int highEnd) {
        List<Product> products = new ArrayList();
        String sql = """
                SELECT\s
                	product_id,
                	product_name,
                	description,
                	price,
                	inventory,
                	country_id,
                	product_type_id
                FROM  
                	product
                WHERE 
                	price > ? and price < ?;
                """;
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, lowEnd, highEnd);
        while (results.next()) {
            products.add(mapRowToProduct(results));
        }
        return products;
    }

    @Override
    public List<Product> getProductsInUserCart(int userId) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM product WHERE product_id IN (SELECT product_id FROM cart_item WHERE user_id = ?)";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            Product product = mapRowToProduct(results);
            list.add(product);
        }
        return list;
    }

    @Override
    public List<Product> getProductsInWishlist(int wishlistId) {
            List<Product> list = new ArrayList<>();
            String sql = "SELECT * FROM product " +
                    "WHERE product_id IN " +
                    "(SELECT product_id FROM wishlist_item WHERE wishlist_id = ?)";
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, wishlistId);
            while (results.next()) {
                Product product = mapRowToProduct(results);
                list.add(product);
            }
            return list;
        }
    }


    private Product mapRowToProduct(SqlRowSet results) {
        Product product = new Product();
        product.setId(results.getInt("product_id"));
        product.setName(results.getString("product_name"));
        product.setDescription(results.getString("description"));
        product.setPrice(results.getBigDecimal("price"));
        product.setInventory(results.getInt("inventory"));
        product.setCountryId(results.getInt("country_id"));
        product.setProductType(results.getInt("product_type_id"));
        return product;
    }


}
