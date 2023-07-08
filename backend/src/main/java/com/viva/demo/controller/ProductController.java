package com.viva.demo.controller;

import com.viva.demo.model.ProductBase;
import com.viva.demo.service.ProductService;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@CrossOrigin
@RequestMapping("/api/products")
public class ProductController {

    private ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping
    public Object getAllProducts(
            @RequestParam(defaultValue = "true") Boolean withLinks,
            @RequestParam(defaultValue = "") String qualityDetail,
            @RequestParam(defaultValue = "0") int type,
            @RequestParam(defaultValue = "0") int country,
            @RequestParam(defaultValue = "0") BigDecimal lowEnd,
            @RequestParam(defaultValue = "999999.99") BigDecimal highEnd) {
        return productService.getAllProducts(qualityDetail, type, country, lowEnd, highEnd, withLinks);
    }

    @GetMapping(path = "/{id}")
    public ProductBase getProductByProductId(
            @RequestParam(defaultValue = "true") Boolean withLinks,
            @PathVariable int id) {

        return productService.getProductByProductId(id, withLinks);
    }



}
