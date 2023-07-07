package com.viva.demo.dao;

import com.viva.demo.model.Country;

import java.util.List;

public interface CountryDao {

    List<Country> getAll();

    Country getById(int id);


}
