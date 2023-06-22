package com.viva.demo.dao;

import com.viva.demo.model.Picture;

import java.util.List;

public interface PictureDao {


    List<Picture> getAll();

    Picture getByPictureId(int id);


}
