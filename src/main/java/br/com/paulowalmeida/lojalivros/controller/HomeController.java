package br.com.paulowalmeida.lojalivros.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping ("/")
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView("home");
        System.out.println("Página Inicial acessada.");
        return modelAndView;
    }
}
