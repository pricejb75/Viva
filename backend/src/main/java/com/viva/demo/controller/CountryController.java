package com.viva.demo.controller;

import com.viva.demo.model.Country;
import com.viva.demo.service.CountryService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/countries")
@CrossOrigin
public class CountryController {

    private CountryService countryService;

    public CountryController(CountryService countryService) {
        this.countryService = countryService;
    }

    @GetMapping
    public List<Country> getAllCountries() {
        return countryService.getAllCountries();
    }

    @GetMapping(path = "/{id}")
    public Country getCountryById(@PathVariable int id) {
        return countryService.getCountryById(id);
    }


}
