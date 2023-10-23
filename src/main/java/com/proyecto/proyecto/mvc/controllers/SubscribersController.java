package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyecto.proyecto.mvc.servicios.SubscribersService;

@Controller
@RequestMapping("/subscribers")
public class SubscribersController {
  @Autowired
  SubscribersService subscribersService;

}
