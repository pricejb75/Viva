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

    public List<Picture> getAllPictures(String prependPath) {
        List<Picture> pictures = jdbcPictureDao.getAll();
        for (Picture picture : pictures) {
            picture.setFilepath(prependPath + picture.getFilepath());
        }
        return pictures;
    }

    public Picture getPictureById(int id) {return jdbcPictureDao.getByPictureId(id);}
}
