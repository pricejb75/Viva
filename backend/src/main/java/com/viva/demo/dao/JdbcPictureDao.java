package com.viva.demo.dao;

import com.viva.demo.model.Picture;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcPictureDao implements PictureDao {


    private JdbcTemplate jdbcTemplate;

    public JdbcPictureDao(DataSource datasource) {
        jdbcTemplate = new JdbcTemplate(datasource);
    }


    @Override
    public List<Picture> getAll() {
        List<Picture> pictures = new ArrayList();

        String sql = "SELECT picture_id, product_id, picture_filepath FROM picture";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            pictures.add((mapRowToPicture(results)));
        }
        return pictures;
    }

    @Override
    public Picture getByPictureId(int id) {
        Picture picture = new Picture();
        String sql = "SELECT picture_Id, product_id, picture_filepath" +
                " FROM picture WHERE picture_id = ?";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, id);
        if (result.next()) {
            picture = mapRowToPicture(result);
        }
        return picture;
    }


    private Picture mapRowToPicture(SqlRowSet results) {

        Picture picture = new Picture();
        picture.setId(results.getInt("picture_id"));
        picture.setProductId(results.getInt("product_id"));
        picture.setFilepath(results.getString("picture_filepath"));
        return picture;

    }


}

