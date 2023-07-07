package com.viva.demo.dao;


import com.viva.demo.model.Quality;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcQualityDao implements QualityDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcQualityDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }


    @Override
    public List<Quality> getAll() {
        List<Quality> qualities = new ArrayList();

        String sql = "SELECT quality_id, quality_name FROM quality";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            qualities.add(mapRowToQuality(results));
        }
        return qualities;
    }

    @Override
    public Quality getById(int id) {
        Quality quality = new Quality();
        String sql = "SELECT quality_id, quality_name FROM quality WHERE quality_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            quality = mapRowToQuality(result);
        }
        return quality;
    }


    private Quality mapRowToQuality(SqlRowSet results) {
        Quality quality = new Quality();
        quality.setId(results.getInt("quality_id"));
        quality.setName(results.getString("quality_name"));
        return quality;
    }


}
