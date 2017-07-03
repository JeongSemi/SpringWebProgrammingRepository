<%--
[지시자]
1. 작성: <%@ ... %>
2. 종류
<%@page ... %> : JSP가 무엇을 만들어내는가
<%@include ... %> 
<%@taglib ... %>
--%>
<%--contentType의 charset-> 웹 브라우저(클라이언트)로 보낼 때의 charset 
/ 페이지인코딩->파일 저장할 때의 charset -> 생략되어있을 경우 contentType의 charset을 따라간다--%>
<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*, java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>JSP Page</title>
        <link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <h1>다른 패키지 클래스 사용</h1>
        <%
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) + 1;
			int date = now.get(Calendar.DAY_OF_MONTH);
        %>
        <%=year%>년<%=month%>월<%=date%>일
    </body>
</html>
