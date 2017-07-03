package com.mycompany.myapp.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Exam01HomeController {

    @RequestMapping("/") //요청 메세지(/home일경우 ->localhost:8080/WebApplication/home)
    public String home() {
        System.out.println("home");
        return "home";
    }

}
