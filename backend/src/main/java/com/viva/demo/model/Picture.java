package com.viva.demo.model;

public class Picture {

    private int id;
    private int productId;
    private String filepath;


    public Picture() {
    }

    public Picture(int id, int productId, String filepath) {
        this.id = id;
        this.productId = productId;
        this.filepath = filepath;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }
}
