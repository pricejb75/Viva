package com.viva.demo.model;

import java.math.BigDecimal;

public class ProductDO extends ProductBase {


    private Country country;
    private ProductType productType;

    public ProductDO(int id, String name, String description, BigDecimal price, int inventory, Country country, ProductType productType) {

        super(id, name, description, price, inventory);
        this.country = country;
        this.productType = productType;
    }

    public ProductDO() {
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public ProductType getProductType() {
        return productType;
    }

    public void setProductType(ProductType productType) {
        this.productType = productType;
    }
}
