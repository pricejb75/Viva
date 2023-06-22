package com.viva.demo.model;

public class Details {

    private int productId;
    private int qualityId;
    private String details;

    public Details() {
    }

    public Details(int productId, int qualityId, String details) {
        this.productId = productId;
        this.qualityId = qualityId;
        this.details = details;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQualityId() {
        return qualityId;
    }

    public void setQualityId(int qualityId) {
        this.qualityId = qualityId;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
