package com.viva.demo.model;

import java.math.BigDecimal;

public class ProductBase {

    private int id;
    private String name;
    private String description;
    private BigDecimal price;
    private int inventory;


    public ProductBase() {
    }

    public ProductBase(int id, String name, String description, BigDecimal price, int inventory) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventory = inventory;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }
}
