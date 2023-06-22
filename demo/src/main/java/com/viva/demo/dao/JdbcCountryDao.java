package com.viva.demo.dao;

import com.viva.demo.model.Country;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcCountryDao implements CountryDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcCountryDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }

    @Override
    public List<Country> getAll() {
        List<Country> countries = new ArrayList();

        String sql = "SELECT country_id,country_name FROM country";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            countries.add(mapRowToCountry(results));
        }
        return countries;
    }

    @Override
    public Country getById(int id) {
        Country country = new Country();
        String sql = "SELECT country_id, country_name FROM country WHERE country_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            country = mapRowToCountry(result);
        }
        return country;
    }

    private Country mapRowToCountry(SqlRowSet results) {
        Country country = new Country();
        country.setId(results.getInt("country_id"));
        country.setName(results.getString("country_name"));
        return country;
    }
}
