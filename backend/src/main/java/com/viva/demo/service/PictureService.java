package com.viva.demo.service;

import com.viva.demo.dao.JdbcPictureDao;
import com.viva.demo.model.Picture;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PictureService {

    private JdbcPictureDao jdbcPictureDao;

    public PictureService(JdbcPictureDao jdbcPictureDao){this.jdbcPictureDao = jdbcPictureDao;}

    public List<Picture>getAllPictures(){ return jdbcPictureDao.getAll();}

    public Picture getPictureById(int id) {return jdbcPictureDao.getByPictureId(id);}
}
