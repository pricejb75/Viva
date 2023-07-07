package com.viva.demo.model;

import java.math.BigDecimal;

public class Product extends ProductBase {


    private int countryId;
    private int productType;

    public Product(int id, String name, String description, BigDecimal price, int inventory, int countryId, int productType) {
        super(id, name, description, price, inventory);
        this.countryId = countryId;
        this.productType = productType;
    }

    public Product() {
    }


    public int getCountryId() {
        return countryId;
    }

    public void setCountryId(int countryId) {
        this.countryId = countryId;
    }

    public int getProductType() {
        return productType;
    }

    public void setProductType(int productType) {
        this.productType = productType;
    }
}
