package com.sputnik.herokudemo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String hello(){

        System.out.println("Called the endpoint");

        return "Hello Ujunwa";
    }
}

