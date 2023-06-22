package com.viva.demo.dao;

import com.viva.demo.model.Quality;

import java.util.List;

public interface QualityDao {


    List<Quality> getAll();

    Quality getById(int id);


}
