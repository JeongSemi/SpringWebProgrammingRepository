package com.mycompany.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Exam06JQeuryController {

    @RequestMapping("/jquery/exam01")
    public String jqueryExam01() {
        return "jquery/exam01"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/jquery/exam02")
    public String jqueryExam02() {
        return "jquery/exam02"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/jquery/exam03")
    public String jqueryExam03() {
        return "jquery/exam03"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/jquery/exam04")
    public String jqueryExam04() {
        return "jquery/exam04"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/jquery/exam04_html_fragment")
    public String jqueryExam04HtmlFragment() {
        return "jquery/exam04_html_fragment"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/jquery/exam04_json")
    public String jqueryExam04Json() {
        return "jquery/exam04_json"; //리턴값.jsp가 실행된다
    }

}
