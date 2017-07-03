package com.mycompany.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/http")
public class Exam08HttpController {

    @RequestMapping(value = "/exam01", method = RequestMethod.GET)
    public String exam01Get() {
        System.out.println("exam01Get()...");
        return "http/exam01";
    }

    @RequestMapping(value = "/exam01", method = RequestMethod.POST)
    public String exam01Post() {
        System.out.println("exam01Post()...");
        return "http/exam01";
    }

    @RequestMapping("/exam02")
    public String exam02(HttpServletRequest request, Model model) {
        String method = request.getMethod();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();
        String type = request.getParameter("type");
        int bno = Integer.parseInt(request.getParameter("bno"));
        String[] hobby = request.getParameterValues("hobby");

        String userAgent = request.getHeader("User-Agent");
        if (userAgent.contains("MSIE") || userAgent.contains("Trident")) {
            userAgent = "IE11 이하 브라우저";
        } else if (userAgent.contains("Edge")) {
            userAgent = "Edge 브라우저";
        } else if (userAgent.contains("Chrome")) {
            userAgent = "Chrome 브라우저";
        }

        model.addAttribute("method", method);
        model.addAttribute("uri", uri);
        model.addAttribute("queryString", queryString);
        model.addAttribute("type", type);
        model.addAttribute("bno", bno);
        model.addAttribute("hobby", hobby);
        model.addAttribute("userAgent", userAgent);

        return "http/exam02";
    }

    @RequestMapping("/exam03")
    public String exam03(
            @RequestParam String type,
            @RequestParam("bno") int boardNo,
            String[] hobby,
            @RequestHeader("User-Agent") String userAgent,
            Model model) { //parameter이름과 RequestParam 변수의 이름이 같으면 자동 대입, 아닐경우 괄호안에 넣어준다(Header는 무조건 붙여야함. 생략하면 param에서 찾는다)
        model.addAttribute("type", type);
        model.addAttribute("bno", boardNo);
        model.addAttribute("hobby", hobby);
        model.addAttribute("userAgent", userAgent);
        return "http/exam02";
    }
}
