package com.viva.demo.dao;

import com.viva.demo.model.Details;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcDetailsDao implements DetailsDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcDetailsDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }


    @Override
    public List<Details> getAll() {
        List<Details> details = new ArrayList();

        String sql = "SELECT product_id, quality_id, quality_details FROM details";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            details.add((mapRowToDetails(results)));
        }
        return details;
    }

    @Override
    public Details getByProductId(int id) {
        Details details = new Details();
        String sql = "product_id, quality_id, quality_details" +
                " FROM details WHERE product_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            details = mapRowToDetails(result);
        }
        return details;
    }

    private Details mapRowToDetails(SqlRowSet results) {
        Details details = new Details();
        details.setProductId(results.getInt("product_id"));
        details.setQualityId(results.getInt("quality_id"));
        details.setDetails(results.getString("quality_details"));
        return details;
    }
}
