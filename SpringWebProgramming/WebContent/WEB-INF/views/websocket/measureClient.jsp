<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>measureClient</title>
        <link href="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="<%=application.getContextPath()%>/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="<%=application.getContextPath()%>/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        	var ws = null;
        	
        	function handleBtnConnect() {
        		ws = new WebSocket("ws://" + window.location.host + "/SpringWebProgramming/websocket/measure");
        		ws.onopen = handleOnOpen;
        		ws.onmessage = handleOnMessage;
        		ws.onclose = handleOnClose;
        	}
        	
        	function handleOnOpen() {
        		display("[연결 성공]<br/>");
        		$("#btnConnect").attr("disabled", true);
        		$("#btnDisConnect").attr("disabled", false);
        	}
        	function handleOnMessage(event) {
        		var strMessage = event.data;
        		display("[측정값] " + strMessage);
        	}
        	function handleOnClose() {
        		display("[연결 종료]<br/>");
        		$("#btnConnect").attr("disabled", false);
        		$("#btnDisConnect").attr("disabled", true);
        	}
        	
        	function handleBtnDisConnect() {
        		if(ws != null){
        			ws.close();
        			ws = null;
        		}
        	}
        	
        	function display(message) {
        		$("#divDisplay").append("<span style='display:block;'>" + message + "</span>");
        		if($("#divDisplay span").length>20) {
        			$("#divDisplay span").first().remove();
        		}
        		$("#divDisplay").scrollTop($("#divDisplay").height());
        	}
        </script>
    </head>
<body>
	<h3>WebSocket-Measure</h3>
	<hr/>
	<div>
		<button id="btnConnect" onclick="handleBtnConnect()" class="btn btn-warning">연결하기</button>
		<button id="btnDisConnect" onclick="handleBtnDisConnect()" class="btn btn-danger">연결끊기</button>
	</div>
	<div>
		<div id="divDisplay" style="width:500px; height:300px; padding:5px; overflow-y:scroll; border:1px solid black; margin-top: 5px;"></div>
	</div>
</body>
</html>