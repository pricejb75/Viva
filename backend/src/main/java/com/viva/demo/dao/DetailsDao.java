package com.viva.demo.dao;

import com.viva.demo.model.Details;

import java.util.List;

public interface DetailsDao {


    List<Details> getAll();

    Details getByProductId(int id);


}
