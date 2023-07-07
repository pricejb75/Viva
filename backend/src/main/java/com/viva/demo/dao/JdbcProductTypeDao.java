package com.viva.demo.dao;

import com.viva.demo.model.ProductType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcProductTypeDao implements ProductTypeDao {
    private JdbcTemplate jdbcTemplate;

    public JdbcProductTypeDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<ProductType> getAll() {
        List<ProductType> productTypes = new ArrayList();

        String sql = "SELECT product_type_id, product_type_name FROM product_type";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            productTypes.add(mapRowToProductType(results));
        }
        return productTypes;
    }

    @Override
    public ProductType getById(int id) {
        ProductType productType = new ProductType();
        String sql = "SELECT product_type_id, product_type_name FROM product_type WHERE product_type_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            productType = mapRowToProductType(result);
        }
        return productType;
    }

    private ProductType mapRowToProductType(SqlRowSet results) {
        ProductType productType = new ProductType();
        productType.setId(results.getInt("product_type_id"));
        productType.setName(results.getString("product_type_name"));
        return productType;
    }
}
