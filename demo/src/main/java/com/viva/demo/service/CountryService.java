package com.viva.demo.service;

import com.viva.demo.dao.JdbcCountryDao;
import com.viva.demo.model.Country;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class CountryService {

    private JdbcCountryDao jdbcCountryDao;

    public CountryService(JdbcCountryDao jdbcCountryDao) {
        this.jdbcCountryDao = jdbcCountryDao;
    }

    public List<Country> getAllCountries() {
        return jdbcCountryDao.getAll();
    }

    public Country getCountryById(int id) {
        return jdbcCountryDao.getById(id);
    }


}
