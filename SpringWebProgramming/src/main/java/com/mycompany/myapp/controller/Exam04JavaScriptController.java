package com.mycompany.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/javascript")
@Controller
public class Exam04JavaScriptController {

    @RequestMapping("/exam01")
    public String javascriptExam01() {
        return "javascript/exam01"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam02")
    public String javascriptExam02() {
        return "javascript/exam02"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam03")
    public String javascriptExam03() {
        return "javascript/exam03"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam04")
    public String javascriptExam04() {
        return "javascript/exam04"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam05")
    public String javascriptExam05() {
        return "javascript/exam05"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam06")
    public String javascriptExam06() {
        return "javascript/exam06"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam07")
    public String javascriptExam07() {
        return "javascript/exam07"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam08")
    public String javascriptExam08() {
        return "javascript/exam08"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam09")
    public String javascriptExam09() {
        return "javascript/exam09"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam10")
    public String javascriptExam10() {
        return "javascript/exam10"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/exam11")
    public String javascriptExam11() {
        return "javascript/exam11"; //리턴값.jsp가 실행된다
    }

}
