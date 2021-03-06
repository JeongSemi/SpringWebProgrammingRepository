<%@page contentType="text/html" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>Home</title>
        <link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script> 
        <script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        $('#myModal').modal('show');
        $('#joinModal').modal('show');
        </script>
    </head>

    <body>
        WebApplication Home
        <hr/>
        <h4>HTML 태그</h4>
        <a href="html/exam01" class="btn btn-warning">exam01</a> <br/>

        <h4>CSS</h4>
        <a href="css/exam01" class="btn btn-success">exam01</a> 
        <a href="css/exam02" class="btn btn-success">exam02</a> 
        <a href="css/exam03" class="btn btn-success">exam03</a> <br/>

        <h4>JavaScript</h4>
        <%for (int i = 1; i <= 11; i++) {
				String exam = "exam";
				if (i < 10) {
					exam += "0" + i;
				} else {
					exam += String.valueOf(i);
				}%>
        <a href="javascript/<%=exam%>" class="btn btn-primary"><%=exam%></a> 
        <%}%>

        <h4>JQuery</h4>
        <%for (int i = 1; i <= 4; i++) {
				String exam = "exam0" + i;
        %>     
        <a href ="jquery/<%=exam%>" class="btn btn-danger"><%=exam%></a>
        <%}%>

        <h4>Bootstrap</h4>
        <%for (int i = 1; i <= 3; i++) {
				String exam = "exam0" + i;
        %>
        <a href="bootstrap/<%=exam%>" class="btn btn-info"><%=exam%></a>
        <%}%>

        <h4>JSP</h4>
        <%for (int i = 1; i <= 5; i++) {
				String exam = "exam0" + i;
        %>
        <a href="jsp/<%=exam%>" class="btn btn-default"><%=exam%></a>
        <%}%>

        <h4>HTTP 요청 방식</h4>
        GET 방식: <a href="http/exam01" class="btn btn-primary">exam01</a>
        POST 방식: 
        <form method="post" action="http/exam01" style="display: inline">
            <input type="submit" value="exam01" class="btn btn-primary"/>
        </form>

        <h4>요청 HTTP 정보 얻기</h4>
        <a href="http/exam02?type=freeboard&bno=5&hobby=baseball&hobby=soccer" class="btn btn-primary">exam02</a>
        <a href="http/exam03?type=freeboard&bno=5&hobby=baseball&hobby=soccer" class="btn btn-primary">exam03</a>

        <h4>폼 제출</h4>
        <a href="form/exam01" class="btn btn-info">회원 가입 양식 요청</a>

        <h4>파일 업로드</h4>
        <a href="form/exam02" class="btn btn-info">회원 가입 양식 요청</a>

        <h4>파일 다운로드</h4>
        <a href="file/exam03" class="btn btn-info">파일로 저장</a>
        <img src="file/exam03" width="100px" height="100px"/>

        <h4>의존성 주입</h4>
        <a href= "di/exam01" class="btn btn-info">회원 가입</a>
        <a href= "di/exam02" class="btn btn-info">로그인</a>
        
        <h4>Redirect(재요청)</h4>
        <a href="redirect/list" class="btn btn-primary">게시물 목록</a>
		<a href="redirect/write" class="btn btn-primary">게시물 쓰기</a>
		
		<h4>상태유지</h4>
		<a href="cookie/exam01" class="btn btn-default">클라이언트 쿠키 저장</a>
		<a href="cookie/exam02" class="btn btn-default">클라이언트 쿠키 읽기</a>
		<a href="cookie/exam03" class="btn btn-default">클라이언트 쿠키 제거</a>
		<a href="session/exam04" class="btn btn-default">서버 세션에 저장</a>
		<a href="session/exam05" class="btn btn-default">서버 세션 읽기</a>
		<a href="session/exam06" class="btn btn-default">서버 세션 제거</a>
		
		
		<h4>JDBC</h4>
		<a href="jdbc/exam01" class="btn btn-default">게시물 쓰기</a>
		<a href="jdbc/exam02" class="btn btn-default">게시물 쓰기</a>
		<a href="jdbc/exam03" class="btn btn-default">회원 가입</a>
		<a href="jdbc/exam04" class="btn btn-default">게시물 목록</a>
		<a href="jdbc/exam05" class="btn btn-default">게시물 페이지 목록</a>
		<a href="jdbc/exam06" class="btn btn-default">회원 목록</a>
		
		<h4>AOP</h4>
		<a href="jdbc/exam05" class="btn btn-default">실행 시간 체크</a>
		<a href="aop/exam01" class="btn btn-default">로그인하기</a>
		<a href="aop/exam02Write" class="btn btn-default">로그인 해야 볼 수 있는 내용1</a>
		<a href="aop/exam02Update" class="btn btn-default">로그인 해야 볼 수 있는 내용2</a>
		
		<h4>Transaction</h4>
		<a href="transaction/exam01" class="btn btn-info">트랜잭션 테스트</a>
		
		<h4>WebSocket</h4>
		<a href="websocket/echoClient" class="btn btn-primary">에코 클라이언트</a>
		<a href="websocket/measureClient" class="btn btn-primary">측정값 얻기</a>
		<a href="websocket/chatClient" class="btn btn-primary">채팅 클라이언트</a>
		
		<h4>Modal/Login</h4>
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">모달창 띄우기</button>
		<!-- 모달창 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
		       Modal body
		       </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
		 
		<button type="button" class="btn btn-info" data-toggle="modal" data-target="#joinModal">로그인 모달</button>
		<!-- 모달창 -->
		<div class="modal fade" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">로그인</h4>
		      </div>
		      <div class="modal-body">
		       <form>
		        <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  <div class="form-group">
				    <label for="exampleInputFile">File input</label>
				    <input type="file" id="exampleInputFile">
				    <p class="help-block">Example block-level help text here.</p>
				  </div>
				  <div class="checkbox">
				    <label>
				      <input type="checkbox"> Check me out
				    </label>
				  </div>
				  </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary">로그인</button>
		      </div>
		    </div>
		  </div>
		</div>
    </body>
</html>