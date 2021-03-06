<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            /*태그 선택자(selector)*/
            div {background-color: yellow; border: 1px solid black; height: 50px}
            /*Class 선택자*/
            .skyblue {background-color: skyblue;}
            .btn {border: 1px solid black; height: 70px; padding: 5px;}
            .success {background-color: forestgreen; color: white;}
            .warning {background-color: red; color: white;}
            /*ID 선택자*/
            #goldDiv1 {background-color: gold;} /*id는 유일한 식별자로만 쓰여야한다.*/
            #goldDiv2 {background-color: goldenrod; }
        </style>
    </head>
    <body>
        <div>div 태그</div> 
        <div>div 태그</div> 
        <div>div 태그</div> 
        
        <div class="skyblue">div 태그</div> 
        <div class="skyblue">div 태그</div> 
        
        <div id="goldDiv1" class="skyblue">div 태그</div>  
        <div id="goldDiv2" class="skyblue">div 태그</div>
        
        <a class="btn success">확인</a>
        <a class="btn warning">경고</a>
        
    </body>
</html>
