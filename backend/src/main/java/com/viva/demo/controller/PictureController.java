package com.viva.demo.controller;

import com.viva.demo.model.Picture;
import com.viva.demo.service.PictureService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api/pictures")
public class PictureController {

//    @Value("${server.port}")
//    private int port;
//
//    @Value("${server.host")
//    private String host;

    private PictureService pictureService;

    public PictureController(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    @GetMapping
    public List<Picture> getAllPictures(){
        return this.pictureService.getAllPictures("http://localhost:8081/images/");
    }

    @GetMapping(path = "/{id}")
    public Picture getPictureById(@PathVariable int id){
        return pictureService.getPictureById(id);
    }








}
