package com.viva.demo.controller;

import com.viva.demo.model.ProductBase;
import com.viva.demo.service.ProductService;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;

@RestController
@RequestMapping("/products")
public class ProductController {

    private ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // localhost:8888/products?type=1&qualityDetail=red
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

//    @GetMapping(path = "/country/{id}")
//    public Object getProductsByCountryId(
//            @RequestParam(defaultValue = "true") Boolean withLinks,
//            @PathVariable int id) {
//        if (withLinks) {
//            return productService.getProductsWithLinksByCountryId(id);
//        }
//        return productService.getProductsByCountryId(id);
//    }
//
//    @GetMapping(path = "/type/{id}")
//    public Object getProductsByProductTypeId(
//            @RequestParam(defaultValue = "true") Boolean withLinks,
//            @PathVariable int id) {
//        if (withLinks) {
//            return productService.getProductsWithLinksByTypeId(id);
//        }
//        return productService.getProductsByProductTypeId(id);
//    }
//
//    @GetMapping(path = "/qualityDetail")
//    public Object getProductsByQualityDetail(
//            @RequestParam(defaultValue = "true") Boolean withLinks,
//            @RequestParam String qualityDetail) {
//        if (withLinks) {
//            return productService.getProductsWithLinksByQualityDetail(qualityDetail);
//        }
//        return productService.getProductsByQualityDetail(qualityDetail);
//    }
//
//    @GetMapping(path = "/price")
//    public Object getProductsByPrice(
//            @RequestParam(defaultValue = "true") Boolean withLinks,
//            @RequestParam(defaultValue = "0") int lowEnd,
//            @RequestParam(required = true) int highEnd) {
//        if (withLinks) {
//            return productService.getProductsWithLinksByPrice(lowEnd, highEnd);
//        }
//        return productService.getProductsByPrice(lowEnd, highEnd);
//    }


}
