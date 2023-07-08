package com.viva.demo.controller;


import com.viva.demo.model.ProductType;
import com.viva.demo.service.ProductTypeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/types")
public class ProductTypeController {

    private ProductTypeService productTypeService;

    public ProductTypeController(ProductTypeService productTypeService) {
        this.productTypeService = productTypeService;
    }

    @GetMapping
    public List<ProductType> getAllProductTypes() {
        return productTypeService.getAllProductTypes();
    }

    @GetMapping(path = "/{id}")
    public ProductType getProductTypeById(@PathVariable int id) {
        return productTypeService.getProductTypeById(id);
    }


}
