package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @RequestMapping("/") //요청 메세지(/home일경우 ->localhost:8080/WebApplication/home)
    public String home() {
        System.out.println("home");
        return "home";
    }

    @RequestMapping("/html")
    public String html() {
        return "html"; //리턴되는 값-> .jsp와 밀접한 관련
    }

    @RequestMapping("/css/exam01")
    public String cssExam01() {
        return "css/exam01"; //리턴되는 값-> .jsp와 밀접한 관련
    }

    @RequestMapping("/css/exam02")
    public String cssExam02() {
        return "css/exam02"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/css/exam03")
    public String cssExam03() {
        return "css/exam03"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam01")
    public String javascriptExam01() {
        return "javascript/exam01"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam02")
    public String javascriptExam02() {
        return "javascript/exam02"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam03")
    public String javascriptExam03() {
        return "javascript/exam03"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam04")
    public String javascriptExam04() {
        return "javascript/exam04"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/bootstrap/exam01")
    public String bootstrapExam01() {
        return "bootstrap/exam01"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/bootstrap/exam02")
    public String bootstrapExam02() {
        return "bootstrap/exam02"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/bootstrap/exam03")
    public String bootstrapExam03() {
        return "bootstrap/exam03"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam05")
    public String javascriptExam05() {
        return "javascript/exam05"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam06")
    public String javascriptExam06() {
        return "javascript/exam06"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam07")
    public String javascriptExam07() {
        return "javascript/exam07"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam08")
    public String javascriptExam08() {
        return "javascript/exam08"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam09")
    public String javascriptExam09() {
        return "javascript/exam09"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam10")
    public String javascriptExam10() {
        return "javascript/exam10"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam11")
    public String javascriptExam11() {
        return "javascript/exam11"; //리턴값.jsp가 실행된다
    }

    @RequestMapping("/javascript/exam0")
    public String javascriptExam0() {
        return "javascript/exam0"; //리턴값.jsp가 실행된다
    }

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
