package com.viva.demo.controller;

import com.viva.demo.model.Picture;
import com.viva.demo.service.PictureService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping("/api/pictures")
public class PictureController {

    private PictureService pictureService;

    public PictureController(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    @GetMapping
    public List<Picture> getAllPictures(){
        return pictureService.getAllPictures();
    }

    @GetMapping(path = "/{id}")
    public Picture getPictureById(@PathVariable int id){
        return pictureService.getPictureById(id);
    }








}
