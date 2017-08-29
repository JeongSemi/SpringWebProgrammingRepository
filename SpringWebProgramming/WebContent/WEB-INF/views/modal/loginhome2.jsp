<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>RC RoBo</title>

		<!-- jQuery, Bootstrap -->
        <script src="<%=application.getContextPath()%>/resources/assets/lib/jquery/dist/jquery.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>

		<!-- initHome -->
        <script src="<%=application.getContextPath()%>/resources/js/home.js"></script>
		<!-- KeyEvent -->
        <script src="<%=application.getContextPath()%>/resources/js/keyevent/keyevent.js"></script>
		
		<!-- Modal -->
		<script src="<%=application.getContextPath()%>/resources/js/modal/login.js"></script>
      
        <!-- Portfolio -->
		<script src="<%=application.getContextPath()%>/resources/js/portfolio/changeimg.js"></script>
		
		<!-- GPS -->
		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDh6T2nhIvAlZgmONXgGouIScKzj9UGN2w&callback=initMap"></script>
		<script src="<%=application.getContextPath()%>/resources/js/gps/gps.js"></script>
		
		
		
<!--
    Favicons
    =============================================
    -->
        <link rel="apple-touch-icon" sizes="57x57" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-57x57.png">
        <link rel="apple-touch-icon" sizes="60x60" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-60x60.png">
        <link rel="apple-touch-icon" sizes="72x72" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-72x72.png">
        <link rel="apple-touch-icon" sizes="76x76" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-76x76.png">
        <link rel="apple-touch-icon" sizes="114x114" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-114x114.png">
        <link rel="apple-touch-icon" sizes="120x120" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-120x120.png">
        <link rel="apple-touch-icon" sizes="144x144" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-144x144.png">
        <link rel="apple-touch-icon" sizes="152x152" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-152x152.png">
        <link rel="apple-touch-icon" sizes="180x180" href="<%=application.getContextPath()%>/resources/assets/images/favicons/apple-icon-180x180.png">
        <link rel="icon" type="image/png" sizes="192x192" href="<%=application.getContextPath()%>/resources/assets/images/favicons/android-icon-192x192.png">
        <link rel="icon" type="image/png" sizes="32x32" href="<%=application.getContextPath()%>/resources/assets/images/favicons/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="96x96" href="<%=application.getContextPath()%>/resources/assets/images/favicons/favicon-96x96.png">
        <link rel="icon" type="image/png" sizes="16x16" href="<%=application.getContextPath()%>/resources/assets/images/favicons/favicon-16x16.png">
        <link rel="manifest" href="/manifest.json">
        <meta name="msapplication-TileColor" content="#ffffff">
        <meta name="msapplication-TileImage" content="<%=application.getContextPath()%>/resources/assets/images/favicons/ms-icon-144x144.png">
        <meta name="theme-color" content="#ffffff">
        <!--
    Stylesheets
    =============================================
    -->
        <!-- Default stylesheets-->
        <link href="<%=application.getContextPath()%>/resources/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Template specific stylesheets-->
        <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/animate.css/animate.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/flexslider/flexslider.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
        <link href="<%=application.getContextPath()%>/resources/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
        <!-- Main stylesheet and color file-->
        <link href="<%=application.getContextPath()%>/resources/assets/css/style.css" rel="stylesheet">
        <link id="color-scheme" href="<%=application.getContextPath()%>/resources/assets/css/colors/default.css" rel="stylesheet">

        <style>
			table {
		    border-collapse: collapse;
		    width: 100%;
			}
			
			th, td {
			    padding: 8px;
			    text-align: left;
			    border-bottom: 1px solid #ddd;
			}
		</style>
		
		 <script type="text/javascript">
        var temperature = ${temperature};
		var pressure = ${pressure};
		var humiture = ${humiture};
		var photoresistor = ${photoresistor};
		var raindrop = ${raindrop};
		var gas = ${gas};
		var mercury = ${mercury};
		var flultrasonic = ${frontLeftUltrasonic};
		var frultrasonic = ${frontRightUltrasonic};
		var slultrasonic = ${sideLeftUltrasonic};
		var srultrasonic = ${sideRightUltrasonic};
		var backultrasonic = ${backUltrasonic};
		
		function checkSetting(){
			if(document.getElementById("temperature").value == "")
				document.getElementById("temperature").defaultValue = "99999";
			if(document.getElementById("pressure").value == "")
				document.getElementById("pressure").defaultValue = "99999";
			if(document.getElementById("humiture").value == "")
				document.getElementById("humiture").defaultValue = "99999";
			if(document.getElementById("photoresistor").value == "")
				document.getElementById("photoresistor").defaultValue = "99999";
			if(document.getElementById("raindrop").value == "")
				document.getElementById("raindrop").defaultValue = "99999";
			if(document.getElementById("gas").value == "")
				document.getElementById("gas").defaultValue = "99999";
			if(document.getElementById("flultrasonic").value == "")
				document.getElementById("flultrasonic").defaultValue = "-1";
			if(document.getElementById("frultrasonic").value == "")
				document.getElementById("frultrasonic").defaultValue = "-1";
			if(document.getElementById("slultrasonic").value == "")
				document.getElementById("slultrasonic").defaultValue = "-1";
			if(document.getElementById("srultrasonic").value == "")
				document.getElementById("srultrasonic").defaultValue = "-1";
			if(document.getElementById("backultrasonic").value == "")
				document.getElementById("backultrasonic").defaultValue = "-1";
		 }
		
		</script>

    </head>

    <body id="mainBody" data-spy="scroll" data-target=".onpage-navigation" data-offset="60" onkeydown="onKeyDown_Event(event)" onkeyup="onKeyUp_Event(event)">
        <main>
            <div class="page-loader">
                <div class="loader">Loading...</div>
            </div>
            <nav class="navbar navbar-custom navbar-transparent navbar-fixed-top one-page" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#custom-collapse"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button><a class="navbar-brand" href="index.html">RC RoBo</a>
                    </div>
                    <div class="collapse navbar-collapse" id="custom-collapse">
                        <ul class="nav navbar-nav navbar-right">
                        <li><a>${mname }님</a></li>
                            <li><a href="#totop">Home</a></li>
                            <li><a class="section-scroll" href="#intro">Intro</a></li>
                            <li><a class="section-scroll" href="#charts">Charts</a></li>
                            <li><a class="section-scroll" href="#database">Database</a></li>
                            <li><a class="section-scroll" href="#actuators">Actuators</a></li>
                            <li><a class="section-scroll" href="#gps">GPS</a></li>
                            <li><a class="section-scroll" href="#team">Team</a></li>

                            <li><a class="section-scroll" href="#portfolio">Portfolio</a></li>
                            <li><a class="section-scroll" href="#document">Document</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            <section class="home-section home-full-height bg-dark bg-gradient" id="home" data-background="<%=application.getContextPath()%>/resources/images/rcmain_transparent.jpg">
                <div class="titan-caption">
                    <div class="caption-content">
                        <div class="font-alt mb-30 titan-title-size-1">IoT &amp; Team3</div>
                        <div class="font-alt mb-40 titan-title-size-4">RC Robo</div>
                        <button type="button" class="btn btn-border-w btn-round" data-toggle="modal" data-target="#loginModal">Login</button>
                        <button type="button" class="btn btn-border-w btn-round" data-toggle="modal" data-target="#joinModal">Join</button>
                    </div>
                </div>
            </section>
           <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow: auto;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" id="registerModalContent">
                        <div class="modal-header">
						    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						    <h4 class="modal-title" id="myModalLabel">Setting</h4>
						</div>
						<div class="modal-body">
							<div><h4>센서 등록</h4></div>
							<form method="post" action="setting" onsubmit="return checkSetting();">
						    	<div>
							        <table id="sensorTable">
							            <tr>
							                <th>센서(데이터) 식별명</th>
							                <th>이벤트발생 기준값</th>
							            </tr>
								        <tr>
										    <td>온도(Temperature)</td>
										    <td>
										    	<c:set var="temperature" value="${temperature }"/>
										    	<c:choose>
									    			<c:when test="${temperature eq 99999 }">
										    			<input type="number" id="temperature" name="temperature" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="temperature" name="temperature" placeholder="${temperature }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>기압(Pressure)</td>
										    <td>
										    	<c:set var="pressure" value="${pressure }"/>
										    	<c:choose>
									    			<c:when test="${pressure eq 99999 }">
										    			<input type="number" id="pressure" name="pressure" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="pressure" name="pressure" placeholder="${pressure }">
										    		</c:otherwise>
										    	</c:choose>
											</td>
										</tr>
										<tr>
										    <td>습도(Humiture)</td>
										    <td>
										    	<c:set var="humiture" value="${humiture }"/>
										    	<c:choose>
									    			<c:when test="${humiture eq 99999 }">
										    			<input type="number" id="humiture" name="humiture" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="humiture" name="humiture" placeholder="${humiture }">
										    		</c:otherwise>
										    	</c:choose>
									    	</td>
										</tr>
										<tr>
										    <td>조도(Photoresistor)</td>
										    <td>
										    	<c:set var="photoresistor" value="${photoresistor }"/>
										    	<c:choose>
									    			<c:when test="${photoresistor eq 99999 }">
										    			<input type="number" id="photoresistor" name="photoresistor" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="photoresistor" name="photoresistor" placeholder="${photoresistor }">
										    		</c:otherwise>
										    	</c:choose>
											</td>
										</tr>
										<tr>
										    <td>빗물(Raindrop)</td>
										    <td>
										    	<c:set var="raindrop" value="${raindrop }"/>
										    	<c:choose>
									    			<c:when test="${raindrop eq 99999 }">
										    			<input type="number" id="raindrop" name="raindrop" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="raindrop" name="raindrop" placeholder="${raindrop }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>가스(gas)</td>
										    <td>
										    	<c:set var="gas" value="${gas }"/>
										    	<c:choose>
									    			<c:when test="${gas eq 99999 }">
										    			<input type="number" id="gas" name="gas" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="gas" name="gas" placeholder="${gas }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>기울기(Mercury)</td>
										    <td> <c:set var="mercury" value="${mercury }" />
										    	<c:choose>
										    		<c:when test="${mercury eq 2 }">
										    			<input type="radio" name="mercury" value="2" style="display:none;" checked>
										    			<input type="radio" name="mercury" value="1"> HIGH &nbsp;
										    			<input type="radio" name="mercury" value="0"> LOW
										    		</c:when>
										    		<c:when test="${mercury eq 1 }">
										    			<input type="radio" name="mercury" value="1" checked> HIGH &nbsp;
										    			<input type="radio" name="mercury" value="0"> LOW
										    		</c:when>
										    		<c:when test="${mercury eq 0 }">
										    			<input type="radio" name="mercury" value="1"> HIGH &nbsp;
										    			<input type="radio" name="mercury" value="0" checked> LOW
										    		</c:when>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>초음파(Ultrasonic)-왼쪽/전방 (단위:cm/이하)</td>
										    <td>
										    	<c:set var="flultrasonic" value="${frontLeftUltrasonic }"/>
										    	<c:choose>
									    			<c:when test="${flultrasonic eq -1 }">
										    			<input type="number" id="flultrasonic" name="flultrasonic" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="flultrasonic" name="flultrasonic" placeholder="${frontLeftUltrasonic }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>초음파(Ultrasonic)-오른쪽/전방 (단위:cm/이하)</td>
										    <td>
										    	<c:set var="frultrasonic" value="${frontRightUltrasonic }"/>
										    	<c:choose>
									    			<c:when test="${frultrasonic eq -1 }">
										    			<input type="number" id="frultrasonic" name="frultrasonic" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="frultrasonic" name="frultrasonic" placeholder="${frontRightUltrasonic }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>초음파(Ultrasonic)-왼쪽/측면 (단위:cm/이하)</td>
										    <td>
										    	<c:set var="slultrasonic" value="${sideLeftUltrasonic }"/>
										    	<c:choose>
									    			<c:when test="${slultrasonic eq -1 }">
										    			<input type="number" id="slultrasonic" name="slultrasonic" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="slultrasonic" name="slultrasonic" placeholder="${sideLeftUltrasonic }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>초음파(Ultrasonic)-오른쪽/측면 (단위:cm/이하)</td>
										    <td>
										    	<c:set var="srultrasonic" value="${sideRightUltrasonic }"/>
										    	<c:choose>
									    			<c:when test="${srultrasonic eq -1 }">
										    			<input type="number" id="srultrasonic" name="srultrasonic" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="srultrasonic" name="srultrasonic" placeholder="${sideRightUltrasonic }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
										<tr>
										    <td>초음파(Ultrasonic)-후방 (단위:cm/이하)</td>
										    <td>
										    	<c:set var="backultrasonic" value="${backUltrasonic }"/>
										    	<c:choose>
									    			<c:when test="${backultrasonic eq -1 }">
										    			<input type="number" id="backultrasonic" name="backultrasonic" value="">
										    		</c:when>
										    		<c:otherwise>
										    			<input type="number" id="backultrasonic" name="backultrasonic" placeholder="${backUltrasonic }">
										    		</c:otherwise>
										    	</c:choose>
										    </td>
										</tr>
							        </table>
						    
						    	</div>
						    	<div style="margin-top: 20px" align="right">
						        	 <button type="submit" class="btn btn-success" >설정</button>
						     		 <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						   		</div>
					   		</form>
						</div>
                    </div>
                </div>
            </div>
            <!-- 로그아웃 모달 -->
            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
						    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						    <h4 class="modal-title" id="myModalLabel">Logout</h4>
						</div>
						<div class="modal-body">
					        <div>로그아웃 하시겠습니까?</div>
					        <div align="right">
					         <a type="button" class="btn btn-danger" href="logout">로그아웃</a>
					      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					        </div>
						</div>
                    </div>
                </div>
            </div>
            
            <div class="main">

                <section class="module" id="intro">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Final Project</h2>
                                <div class="module-subtitle font-serif">LTE망을 통한 RC카 제어 공용 라이브러리 제작<br/>▷주행제어 &nbsp;&nbsp;&nbsp;▷센서값측정 &nbsp;&nbsp;&nbsp;▷Actuator구동 &nbsp;&nbsp;&nbsp;▷자율주행</div>
                            </div>
                        </div>
                        <div class="row multi-columns-row">
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="features-item">
                                    <img src="<%=application.getContextPath()%>/resources/images/intro/control.png" width="80px" height="80px" style="position:absoulte" />
                                    <h3 class="features-title font-alt">Driving Remote Control</h3>
                                    <p>LTE망을 통해서 RC카의 주행을 조종한다. 카메라를 통해 주행화면을 보면서 RC카의 모터부분을 제어하여 속도와 방향을 조종한다.</p>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="features-item">
                                    <img src="<%=application.getContextPath()%>/resources/images/intro/sensor.png" width="80px" height="80px" style="position:absoulte" />
                                    <h3 class="features-title font-alt">Sensors</h3>
                                    <p>RC카에 부착된 센서들로 부터 실시간으로 데이터를 받아온다. 받아온 데이터들을 웹을 통해 실시간으로 보여주고 다양한 통계값들을 제공한다.</p>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="features-item">
                                    <img src="<%=application.getContextPath()%>/resources/images/intro/actuator.png" width="80px" height="80px" style="position:absoulte" />
                                    <h3 class="features-title font-alt">Actuators</h3>
                                    <p>RC카에 부착된 Actuator들을 제어한다. 웹을 통해 실시간으로 제어하고 특정한 조건 내에서는 자동으로 동작하도록 설정해준다.</p>
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-6 col-xs-12">
                                <div class="features-item">
                                    <img src="<%=application.getContextPath()%>/resources/images/intro/car.png" width="80px" height="80px" style="position:absoulte" />
                                    <h3 class="features-title font-alt">Self-Driving Car </h3>
                                    <p>LTE망과 GPS를 이용해서 RC카의 현재위치와 목표위치를 설정해준다. 장애물 회피 등 자율주행 기능을 프로그래밍하여 목표위치까지 자율주행하도록 한다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="module bg-dark-60" data-background="<%=application.getContextPath()%>/resources/images/rcmain_transparent.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="video-box">
                                    <div class="video-box-icon"><a class="video-pop-up" href="https://www.youtube.com/watch?v=TTxZj3DZiIM"><span class="icon-video"></span></a></div>
                                    <div class="video-title font-alt">Presentation</div>
                                    <div class="video-subtitle font-alt">Watch the video about our new products</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <section class="module pb-0" id="charts">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Sensor &amp; Chart</h2>
                                <div class="module-subtitle font-serif"></div>
                            </div>
                        </div>
                    </div>
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <ul class="filter font-alt" id="filters">
                                    <li><a class="current wow fadeInUp" href="#" data-filter="*">All</a></li>
                                    <li><a id="initChart" class="wow fadeInUp" href="#" data-filter=".weather" data-wow-delay="0.2s">Weather</a></li>
                                    <li><a class="wow fadeInUp" href="#" data-filter=".environment" data-wow-delay="0.2s">Environment</a></li>
                                    <li><a class="wow fadeInUp" href="#" data-filter=".driving" data-wow-delay="0.4s">Driving</a></li>
                                    <li><a class="wow fadeInUp" href="#" data-filter=".ultrasonic" data-wow-delay="0.6s">Ultrasonic</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <ul class="works-grid works-grid-gut works-grid-3 works-hover-w" id="works-grid">
                        <li class="work-item weather photography">
                            <a href="#barometerModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="temperatureChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Temperature</h3>
                                    <div class="work-descr">온도 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item environment photography">
                            <a href="#barometerModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="pressureChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Pressure</h3>
                                    <div class="work-descr">기압 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item weather photography">
                            <a href="#humitureModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="humitureChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Humiture</h3>
                                    <div class="work-descr">습도 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item weather webdesign">
                            <a href="#raindropModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="raindropChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Raindrop</h3>
                                    <div class="work-descr">물방울 감지 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item environment webdesign">
                            <a href="#gasModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="gasChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Gas</h3>
                                    <div class="work-descr">가스 감지 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item environment webdesign">
                            <a href="#photoresistorModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="photoresistorChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Photoresistor</h3>
                                    <div class="work-descr">조도 감지 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item driving webdesign">
                            <a href="#mercuryModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="mercuryChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Mercury</h3>
                                    <div class="work-descr">기울기 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item driving webdesign">
                            <a href="#lightModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="lightChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Light</h3>
                                    <div class="work-descr">RC카 조명</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item ultrasonic webdesign">
                            <a href="#ultrasonicModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="frontUltrasonicChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Front Ultrasonics</h3>
                                    <div class="work-descr">거리 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item ultrasonic photography">
                            <a href="#ultrasonicModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="sideUltrasonicChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Side Ultrasonics</h3>
                                    <div class="work-descr">거리 측정 센서</div>
                                </div>
                            </a>
                        </li>
                        <li class="work-item ultrasonic photography">
                            <a href="#ultrasonicModal" data-toggle="modal">
                                <div class="col-md-12">
                                    <div id="backUltrasonicChartContainer"></div>
                                </div>
                                <div class="work-caption font-alt">
                                    <h3 class="work-title">Back Ultrasonic</h3>
                                    <div class="work-descr">거리 측정 센서</div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </section>

					
<!--                 <section class="module-small bg-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-md-8 col-lg-6 col-lg-offset-2">
                                <div class="callout-text font-alt">
                                    <h3 class="callout-title">Want to see more works?</h3>
                                    <p>We are always open to interesting projects.</p>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-2">
                                <div class="callout-btn-box"><a class="btn btn-w btn-round" href="#portfolio">Lets view portfolio</a></div>
                            </div>
                        </div>
                    </div>
                </section> -->
                <div style="background-color: black; width: 90%; height: 2px; margin: auto; margin-top: 50px;"></div>

                <section class="module" id="database">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Database</h2>
                                <div class="module-subtitle font-serif">사용자가 설정한 값을 기준으로 발생한 이벤트들을 수집</div>
                            </div>
                        </div>
                        <div class="row multi-columns-row">
                            <div class="col-sm-4 col-md-4">
                                <div class="price-table font-alt">
                                    <h4>Event</h4>
                                    <img src="<%=application.getContextPath()%>/resources/images/database/calendar.png" width="60px" height="60px" style="position:absoulte" />
                                    <div class="borderline"></div>
                                    <p class="price">${eventcount }</p>
                                    <ul class="price-details">
                                        <li>발생 이벤트 개수</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-8 col-md-8" >
                                <div class="price-table font-alt">
									<table id="eventTable" style="width:500; border:1; cellspacing:5; cellpadding:3; bordercolor:#999999;">
										<tr>
											<th>발생 일시</th>
											<th>센서명</th>
											<th>발생 값</th>
										</tr>
										<c:forEach var="e" items="${eventlist}"> 
						                <tr>
						                    <td><fmt:formatDate value="${e.edate}" pattern="yyyy/MM/dd HH:mm:ss"></fmt:formatDate></td>
						                    <td>${e.sname}</td>
						                    <td>${e.evalue}</td>
						                </tr>
						        	    </c:forEach>
									</table>										
                                </div>
                            </div>
                            
                        <div class="row mt-40">
                            <div class="col-sm-6 col-sm-offset-3 align-center">
                                <p>Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.</p>
                            </div>
                        </div>
                    </div>
                </section>
                
                <div style="background-color: black; width: 90%; height: 2px; margin: auto;"></div>


                <section class="module" id="actuators">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Driving Control &amp; Actuators</h2>
                                <div class="module-subtitle font-serif">▷카메라 각도 제어 &nbsp;&nbsp;&nbsp;▷RC카 주행 제어 &nbsp;&nbsp;&nbsp;▷Actuators 제어</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 col-md-3 col-lg-3">

                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img id="currDrivingControlImage" src="<%=application.getContextPath()%>/resources/images/actuators/drivingcontrol.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">Driving Control</h3>작동방법 : F4 (파란색 : ON)</br>Numpad8 : 전진&nbsp;&nbsp;/&nbsp;&nbsp;Numpad2 : 후진</br>Numpad4 : 왼쪽&nbsp;&nbsp;/&nbsp;&nbsp;Numpad6 : 오른쪽</br>Numpad9 : 급정차&nbsp;&nbsp;/&nbsp;&nbsp;Numpad5 : 정면</br>
                                </div>

                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img id="currLaserImage" src="<%=application.getContextPath()%>/resources/images/actuators/laser.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">Laser</h3>Laser ON-OFF 제어<br/><br/>
                                    <button type="button" class="btn btn-default" onclick="laseremitter('laseremitter', 'on')">ON</button>
                                    <button type="button" class="btn btn-default" onclick="laseremitter('laseremitter', 'off')">OFF</button>
                                </div>


                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img id="currBuzzerImage" src="<%=application.getContextPath()%>/resources/images/actuators/buzzer.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">Buzzer</h3>Buzzer ON-OFF 제어<br/><br/>
                                    <button type="button" class="btn btn-default" onclick="buzzer('buzzer', 'on')">ON</button>
                                    <button type="button" class="btn btn-default" onclick="buzzer('buzzer', 'off')">OFF</button>
                                </div>


                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img id="currLightImage" src="<%=application.getContextPath()%>/resources/images/actuators/light.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">LED Light</h3>LED Light on-off 제어<br/><br/>
                                    <button type="button" class="btn btn-default" onclick="light('light', 'on')">ON</button>
                                    <button type="button" class="btn btn-default" onclick="light('light', 'off')">OFF</button>
                                </div>

                            </div>
                            <div class="col-md-6 col-lg-6 hidden-xs hidden-sm">
                                <div class="alt-services-image align-center">
                                <img id="cameraView" style="height: 500px; margin-top: 100px;" alt="Feature Image">
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-3 col-lg-3">


                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img id="currCameraImage" src="<%=application.getContextPath()%>/resources/images/actuators/camera.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">Camera</h3>작동방법 : F4 (파란색 : ON)</br>W : Up&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;X : Down</br>A : Left&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;D : Right</br>S : Center</br>
                                </div>

                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img src="<%=application.getContextPath()%>/resources/images/actuators/rgbLed.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">RGB LED</h3>현재 색상 : <button type="button" class="btn btn-primary" id="rgbledStatus" style="background-color:rgb(${rgbRed}, ${rgbGreen}, ${rgbBlue})"></button><br/><br/> RGB색상 선택 <br/><button type="button" class="btn btn-primary" onclick="rgbled('rgbled','0','0','0')" style="background-color:#000000"></button><button type="button" class="btn btn-primary" onclick="rgbled('rgbled','255','0','0')" style="background-color:#FF0000"></button>
                                    <button type="button" class="btn btn-primary" onclick="rgbled('rgbled','0','255','0')" style="background-color:#00FF00"></button><button type="button" class="btn btn-primary" onclick="rgbled('rgbled','0','0','255')" style="background-color:#0000FF"></button>
                                    <button type="button" class="btn btn-primary" onclick="rgbled('rgbled','255','255','0')" style="background-color:#FFFF00"></button><button type="button" class="btn btn-primary" onclick="rgbled('rgbled','255','0','255')" style="background-color:#FF00FF"></button>
                                    <button type="button" class="btn btn-primary" onclick="rgbled('rgbled','0','255','255')" style="background-color:#00FFFF"></button><button type="button" class="btn btn-primary" onclick="rgbled('rgbled','255','255','255')" style="background-color:#FFFFFF"></button>
                                </div>

                                <div class="alt-features-item">
                                    <div class="alt-features-icon"><img src="<%=application.getContextPath()%>/resources/images/actuators/lcd.png" width="60px" height="60px" style="position:absoulte" /></div>
                                    <h3 class="alt-features-title font-alt">LCD Display</h3>LCD Display line0, line1 설정<br/><br/>
                                    <input type="text" id="line0" size=20 maxlength=10 value="line0" />
                                    <input type="text" id="line1" size=20 maxlength=10 value="line1" />
                                    <button type="button" class="btn btn-default btn-sm" onclick="lcd('refresh')"> <img src="<%=application.getContextPath()%>/resources/images/actuators/refresh.png" width="15px" height="15px" /></button>
                                    <p></p><button type="button" class="btn btn-default" onclick="lcd('lcd')">전송</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </section>
                
	            <div style="background-color: black; width: 90%; height: 2px; margin: auto;"></div>

				<section class="module" id="gps">
					<h2 class="module-title font-alt">GPS</h2>
					<div class="module-subtitle font-serif">GPS module을 이용한 RC카의 위치정보</div>
					<div id="map" style="height: 550px; width: 70%; margin: auto;"></div>
					
				</section>

		<div style="background-color: black; width: 90%; height: 2px; margin: auto;"></div>

                <section class="module" id="team" style="padding: 110px 0 150px 0;">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">IoT Team3 Member</h2>
                                <div class="module-subtitle font-serif">한국소프트웨어산업협회 주관 IoT엔지니어 양성 과정 3조</div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="mb-sm-20 wow fadeInUp col-sm-4 col-md-2 col-md-offset-1" onclick="wow fadeInUp">
                                <div class="team-item">
                                    <div class="team-image"><img src="<%=application.getContextPath()%>/resources/images/team/jsg.jpg" alt="Member Photo" />
                                        <div class="team-detail">
                                            <p class="font-serif">
                                                남 (Male)<br/> 동국대학교 컴퓨터공학과<br/> 010–4234–1067
                                                <br/> busk0821@gmail.com
                                            </p>
                                            <div class="team-social"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="team-descr font-alt">
                                        <div class="team-name">장성근</div>
                                        <div class="team-role">Jang Sung Geun</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-sm-20 wow fadeInUp col-sm-4 col-md-2" onclick="wow fadeInUp">
                                <div class="team-item">
                                    <div class="team-image"><img src="<%=application.getContextPath()%>/resources/images/team/ych.jpg" alt="Member Photo" />
                                        <div class="team-detail">
                                            <p class="font-serif">
                                                남 (Male)<br/> 동국대학교 컴퓨터공학과<br/> 010–9165–9080
                                                <br/> ych8989@gmail.com
                                            </p>
                                            <div class="team-social"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="team-descr font-alt">
                                        <div class="team-name">유창현</div>
                                        <div class="team-role">Yoo Chang Hyun</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-sm-20 wow fadeInUp col-sm-4 col-md-2" onclick="wow fadeInUp">
                                <div class="team-item">
                                    <div class="team-image"><img src="<%=application.getContextPath()%>/resources/images/team/kym.jpg" alt="Member Photo" />
                                        <div class="team-detail">
                                            <p class="font-serif">
                                                남 (Male)<br/> 서강대학교 컴퓨터공학과<br/> 010–5048–2438
                                                <br/> happistar09@naver.com
                                            </p>
                                            <div class="team-social"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="team-descr font-alt">
                                        <div class="team-name">김영민</div>
                                        <div class="team-role">Kim Young Min</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-sm-20 wow fadeInUp col-sm-4 col-md-2" onclick="wow fadeInUp">
                                <div class="team-item">
                                    <div class="team-image"><img src="<%=application.getContextPath()%>/resources/images/team/jsy.jpg" alt="Member Photo" />
                                        <div class="team-detail">
                                            <p class="font-serif">
                                                여 (Female)<br/> 동국대학교 컴퓨터공학과<br/> 010–5333–2105
                                                <br/> huntsu1234@gmail.com
                                            </p>
                                            <div class="team-social"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="team-descr font-alt">
                                        <div class="team-name">정수양</div>
                                        <div class="team-role">Jung Su Yang</div>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-sm-20 wow fadeInUp col-sm-4 col-md-2" onclick="wow fadeInUp">
                                <div class="team-item">
                                    <div class="team-image"><img src="<%=application.getContextPath()%>/resources/images/team/jsm.jpg" alt="Member Photo" />
                                        <div class="team-detail">
                                            <p class="font-serif">
                                                여 (Female)<br/> 서강대학교 컴퓨터공학과<br/> 010–9981–4763
                                                <br/> wjdtpa2@gmail.com
                                            </p>
                                            <div class="team-social"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a></div>
                                        </div>
                                    </div>
                                    <div class="team-descr font-alt">
                                        <div class="team-name">정세미</div>
                                        <div class="team-role">Jeong Se Mi</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>




				<div style="background-color: black; width: 90%; height: 2px; margin: auto;"></div>
<%--                 <section class="module bg-dark-60 pt-0 pb-0 parallax-bg testimonial" data-background="<%=application.getContextPath()%>/resources/assets/images/testimonial_bg.jpg">
                    <div class="testimonials-slider pt-140 pb-140">
                        <ul class="slides">
                            <li>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="module-icon"><span class="icon-quote"></span></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-8 col-sm-offset-2">
                                            <blockquote class="testimonial-text font-alt">I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.</blockquote>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 col-sm-offset-4">
                                            <div class="testimonial-author">
                                                <div class="testimonial-caption font-alt">
                                                    <div class="testimonial-title">Jack Woods</div>
                                                    <div class="testimonial-descr">SomeCompany INC, CEO</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="module-icon"><span class="icon-quote"></span></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-8 col-sm-offset-2">
                                            <blockquote class="testimonial-text font-alt">I should be incapable of drawing a single stroke at the present moment; and yet I feel that I never was a greater artist than now.</blockquote>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 col-sm-offset-4">
                                            <div class="testimonial-author">
                                                <div class="testimonial-caption font-alt">
                                                    <div class="testimonial-title">Jim Stone</div>
                                                    <div class="testimonial-descr">SomeCompany INC, CEO</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="module-icon"><span class="icon-quote"></span></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-8 col-sm-offset-2">
                                            <blockquote class="testimonial-text font-alt">I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence, that I neglect my talents.</blockquote>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4 col-sm-offset-4">
                                            <div class="testimonial-author">
                                                <div class="testimonial-caption font-alt">
                                                    <div class="testimonial-title">Adele Snow</div>
                                                    <div class="testimonial-descr">SomeCompany INC, CEO</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </section> --%>
                
                
                <section class="module" id="portfolio" style="padding: 50px 0 70px 0;">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3">
                                <h2 class="module-title font-alt">Latest Project Posts</h2>
                                <div class="module-subtitle font-serif">IoT 3Team's projects &amp; portfolio</div>
                            </div>
                        </div>
                        <div class="row multi-columns-row post-columns">
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <div class="post mb-20">
                                    <div class="post-thumbnail" ><img src="<%=application.getContextPath()%>/resources/images/project/project1-1.jpg" alt="Blog-post Thumbnail" id="img1" onclick="changeimg(1)" /></div>
                                    <div class="post-header font-alt">
                                        <h2 class="post-title">Smart Home Panel</h2>
                                        <div class="post-meta">By&nbsp;<a href="#team">Iot 3Team</a>&nbsp;
                                        </div>
                                    </div>
                                    <div class="post-entry">
                                        <p>- JavaFX를 이용해 UI를 구축하고 Java를 이용해 내부적인 기능을 제작, 실제 가정에서 사용하는 홈 패널을 구성<br/><br/>
                                        	 - 라즈베리 파이를 활용해 디스플레이 패널에 직접적으로 프로젝트를 구현함으로써 사실성 강조 </p>
                                    </div>
                                    <div class="post-more"><a class="more-link" href="file/portfolio?filename=project1.pptx">Portfolio</a></div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <div class="post mb-20">
                                    <div class="post-thumbnail"><img src="<%=application.getContextPath()%>/resources/images/project/project2-1.jpg" alt="Blog-post Thumbnail" id="img2" onclick="changeimg(2)"/></div>
                                    <div class="post-header font-alt">
                                        <h2 class="post-title">SensingCar Control(Web)</h2>
                                        <div class="post-meta">By&nbsp;<a href="#team">Iot 3Team</a>&nbsp;
                                        </div>
                                    </div>
                                    <div class="post-entry">
                                        <p>- 센싱카에 부착되어 있는 액츄에이터들과 모터들을 웹과 임베디드 환경에서 제어<br/><br/>
                                        	 - 센서들의 데이터를 실시간으로 받아와 한눈에 확인 가능한 UI환경을 구축</p>
                                    </div>
                                    <div class="post-more"><a class="more-link" href="file/portfolio?filename=project2.pptx">Portfolio</a></div>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <div class="post mb-20">
                                    <div class="post-thumbnail"><img src="<%=application.getContextPath()%>/resources/images/project/project3-1.jpg" alt="Blog-post Thumbnail" id="img3" onclick="changeimg(3)"/></div>
                                    <div class="post-header font-alt">
                                        <h2 class="post-title">SensingCar Control(Embedded)</h2>
                                        <div class="post-meta">By&nbsp;<a href="#team">Iot 3Team</a>&nbsp;
                                        </div>
                                    </div>
                                    <div class="post-entry">
                                        <p> </p>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                
                <section class="module-small bg-dark" id="document">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-md-8 col-lg-6 col-lg-offset-2">
                                <div class="callout-text font-alt">
                                    <h3 class="callout-title">Want to use our platform?</h3>
                                    <p>Our platform is always open to everyone. </p>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-4 col-lg-2">
                                <div class="callout-btn-box"><a class="btn btn-border-w btn-round" href="#documentModal" data-toggle="modal">View Documents</a></div>
                            </div>
                        </div>
                    </div>
                </section>
<!--                 <div id="contact" class="module-small bg-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6 col-md-6 col-lg-4 col-lg-offset-2">
                                <div class="callout-text font-alt">
                                    <h3 class="callout-title">Subscribe now</h3>
                                    <p>We will not spam your email.</p>
                                </div>
                            </div>
                            <div class="col-sm-6 col-md-6 col-lg-4">
                                <div class="callout-btn-box">
                                    <form id="subscription-form" role="form" method="post" action="php/subscribe.php">
                                        <div class="input-group">
                                            <input class="form-control" type="email" id="semail" name="semail" placeholder="Your Email" data-validation-required-message="Please enter your email address." required="required" /><span class="input-group-btn">
                        <button class="btn btn-g btn-round" id="subscription-form-submit" type="submit">Submit</button></span>
                                        </div>
                                    </form>
                                    <div class="text-center" id="subscription-response"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> -->
                <!-- <section id="map-section"><div id="map"></div></section> -->
                
                

<%--                Footer 사용 안하는 부분 
					<div class="module-small bg-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="widget">
                                    <h5 class="widget-title font-alt">About Titan</h5>
                                    <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                                    <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                                    <p>Email:<a href="#">somecompany@example.com</a></p>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="widget">
                                    <h5 class="widget-title font-alt">Recent Comments</h5>
                                    <ul class="icon-list">
                                        <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                                        <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                                        <li>Andy on <a href="#">Eco bag Mockup</a></li>
                                        <li>Jack on <a href="#">Bottle Mockup</a></li>
                                        <li>Mark on <a href="#">Our trip to the Alps</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="widget">
                                    <h5 class="widget-title font-alt">Blog Categories</h5>
                                    <ul class="icon-list">
                                        <li><a href="#">Photography - 7</a></li>
                                        <li><a href="#">Web Design - 3</a></li>
                                        <li><a href="#">Illustration - 12</a></li>
                                        <li><a href="#">Marketing - 1</a></li>
                                        <li><a href="#">Wordpress - 16</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="widget">
                                    <h5 class="widget-title font-alt">Popular Posts</h5>
                                    <ul class="widget-posts">
                                        <li class="clearfix">
                                            <div class="widget-posts-image"><a href="#"><img src="<%=application.getContextPath()%>/resources/assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                                            <div class="widget-posts-body">
                                                <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                                                <div class="widget-posts-meta">23 january</div>
                                            </div>
                                        </li>
                                        <li class="clearfix">
                                            <div class="widget-posts-image"><a href="#"><img src="<%=application.getContextPath()%>/resources/assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                                            <div class="widget-posts-body">
                                                <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                                                <div class="widget-posts-meta">15 February</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> --%>
                
                
                <hr class="divider-d">
                <footer class="footer bg-dark">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-6">
                                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">IoT Team3</a>, All Rights Reserved</p>
                            </div>
                            <div class="col-sm-6">
                                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

            <!-- Chart Modal -->
             <div class="modal fade" id="barometerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Barometer Sensor(온도, 기압)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/barometer1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/barometer2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="humitureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Humiture Sensor(습도)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/humiture1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/humiture2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="raindropModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Raindrop Sensor(빗방울 감지))</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/raindrop1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/raindrop2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="gasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Gas Sensor(가스)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/gas1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/gas2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

              <div class="modal fade" id="photoresistorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Photoresistor Sensor(조도)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/photoresistor1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/photoresistor2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="mercuryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Mercury Sensor(기울기)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/mercury1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/mercury2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="lightModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Light Sensor(조명)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/light1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/light2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>

             <div class="modal fade" id="ultrasonicModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Ultrasonic Sensor(거리)</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/ultrasonic1.png" width="100px" height="100px" />
                         	<img src="<%=application.getContextPath()%>/resources/images/charts/ultrasonic2.png" width="200px" height="200px" style="position:absoulte;width:80%;height:80%;" />
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>
             
             <div class="modal fade" id="documentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-header">
                             <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                             <h4 class="modal-title" id="myModalLabel">Documents</h4>
                         </div>
                         <div class="modal-body" style="position:absoulte;width:100%;height:100%;">
                         	<a href="file/portfolio?filename=example.docx"><img src="<%=application.getContextPath()%>/resources/images/document/doc.png" width="50px" height="50px"/></a> 
                         	<input type="text" size=30  value="*document 설명*" disabled/> 
                         	<a href="file/portfolio?filename=example.docx"><img src="<%=application.getContextPath()%>/resources/images/document/doc.png" width="50px" height="50px" style="margin-left:20px"/></a> 
                         	<input type="text" size=30  value="*document2 설명*" disabled/>  <p></p>
                         	<a href="file/portfolio?filename=example.docx"><img src="<%=application.getContextPath()%>/resources/images/document/doc.png" width="50px" height="50px" /></a>
                         	<input type="text" size=30  style="margin-top:20px" value="*document3 설명*" disabled/>
                         	<a href="file/portfolio?filename=example.docx"><img src="<%=application.getContextPath()%>/resources/images/document/doc.png" width="50px" height="50px" style="margin-left:20px" /></a> 
                         	<input type="text" size=30  style="margin-top:20px" value="*document4 설명*" disabled/>                      	                        	
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                         </div>
                     </div>
                 </div>
             </div>
             
<!--              Database Modal -->
<!--                <div class="modal fade" id="dbTemperatureModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--                  <div class="modal-dialog" role="document"> -->
<!--                      <div class="modal-content"> -->
<!--                          <div class="modal-header" style="position:absoulte;width:100%;height:50%;background-color: silver"> -->
<!--                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                        		 <h4 class="modal-title" align="center" id="myModalLabel"><span style="color:white;"><span style="color:white;">Temperature 정보 상세보기</span></span></h4> -->
<!--                          </div> -->
<!--                          <div class="modal-body" style="position:absoulte;width:100%;height:100%;background-color: salmon"> -->
<!--                          	<div class="price-table font-alt col-sm-6" style="border-right: 1px solid black;"> -->
<!--                           	  <br/> -->
<!--                           	  <h4>Normal</h4> -->
<!--                           	  <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/temperature.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price">9</p> -->
<!--                           	</div> -->
                          
<!--                           <div class="price-table font-alt col-sm-6" style="background-color: lavenderblush"> -->
<!--                           	  <br/> -->
<!--                               <h4>Event</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/temperature_red.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price" id="TemperatureEvent" style="color:red">39</p> -->
<!--                           </div> -->
<!--                              <br/> -->
<!--                              <br/> -->
<!--                             <div align="center"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>  -->
<!--                          </div>	 -->
<!--                        </div> -->
<!--                      </div> -->
<!--              	</div> -->
   
<!--               <div class="modal fade" id="dbHumidityModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--                 <div class="modal-dialog" role="document"> -->
<!--                      <div class="modal-content"> -->
<!--                          <div class="modal-header" style="position:absoulte;width:100%;height:50%;background-color: silver"> -->
<!--                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                        		 <h4 class="modal-title" align="center" id="myModalLabel"><span style="color:white;"><span style="color:white;">Humidity 정보 상세보기</span></span></h4> -->
<!--                          </div> -->
<!--                          <div class="modal-body" style="position:absoulte;width:100%;height:100%;background-color: skyblue"> -->
<!--                           	<div class="price-table font-alt col-sm-6" style="border-right: 1px solid black;"> -->
<!--                           	  <br/> -->
<!--                               <h4>Normal</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/humidity.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price">9</p> -->
<!--                           	</div> -->
<!--                           	<div class="price-table font-alt col-sm-6" style="background-color: lightcyan"> -->
<!--                           	  <br/> -->
<!--                               <h4>Event</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/humidity_blue.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price" id="HumidityEvent" style="color:blue">12</p> -->
<!--                           	</div> -->
<!--                              <br/> -->
<!--                              <br/> -->
<!--                            <div align="center"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>  -->
<!--                          </div> -->
<!--                       </div> -->
<!--                      </div> -->
<!--              	</div> -->
<!--               <div class="modal fade" id="dbGasModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--                   <div class="modal-dialog" role="document"> -->
<!--                      <div class="modal-content"> -->
<!--                          <div class="modal-header" style="position:absoulte;width:100%;height:50%;background-color: silver"> -->
<!--                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                        		 <h4 class="modal-title" align="center" id="myModalLabel"><span style="color:white;"><span style="color:white;">Gas 정보 상세보기</span></span></h4> -->
<!--                          </div> -->
<!--                          <div class="modal-body" style="position:absoulte;width:100%;height:100%;background-color: lightcoral"> -->
<!--                           <div class="price-table font-alt col-sm-6" style="border-right: 1px solid black;"> -->
<!--                           	  <br/> -->
<!--                               <h4>Normal</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/gas.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price">9</p> -->
<!--                           </div> -->
<!--                           <div class="price-table font-alt col-sm-6" style="background-color: lavenderblush"> -->
<!--                           	  <br/> -->
<!--                               <h4>Event</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/gas_red.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price" id="GasEvent" style="color:red">300</p> -->
<!--                           </div> -->
<!--                              <br/> -->
<!--                              <br/> -->
<!--                             <div align="center"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>  -->
<!--                          </div> -->
<!--                       </div> -->
<!--                      </div> -->
<!--              	</div> -->
<!--               <div class="modal fade" id="dbRainfallModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"> -->
<!--                  <div class="modal-dialog" role="document"> -->
<!--                      <div class="modal-content"> -->
<!--                          <div class="modal-header" style="position:absoulte;width:100%;height:50%;background-color: silver"> -->
<!--                              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
<!--                        		 <h4 class="modal-title" align="center" id="myModalLabel"><span style="color:white;"><span style="color:white;">Rainfall 정보 상세보기</span></span></h4> -->
<!--                          </div> -->
<!--                          <div class="modal-body" style="position:absoulte;width:100%;height:100%;background-color: lemonchiffon"> -->
<!--                           	<div class="price-table font-alt col-sm-6" style="border-right: 1px solid black;"> -->
<!--                           	  <br/> -->
<!--                               <h4>Normal</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/rainfall.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price">9</p> -->
<!--                           	</div> -->
                          
<!--                           <div class="price-table font-alt col-sm-6" style="background-color: lightcyan"> -->
<!--                           	  <br/> -->
<!--                               <h4>Event</h4> -->
<!--                               <br/>  -->
<%--                               <img src="<%=application.getContextPath()%>/resources/images/database/rainfall_yellow.png" width="60px" height="60px" style="position:absoulte" /> --%>
<!--                               <br/>     -->
<!--                               <p class="price" id="RainfallEvent" style="color:green">100</p> -->
<!--                           </div> -->
<!--                              <br/> -->
<!--                              <br/> -->
<!--                             <div align="center"><button type="button" class="btn btn-default" data-dismiss="modal">Close</button></div>  -->
<!--                          </div> -->
<!--                      </div> -->
<!--              	</div> -->
<!--              </div> -->


            <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
            <!-- <script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWOUFiNJDcJz52bH_O6Ps2S1YvVYQ0Zmo"></script> -->
        </main>

        <!--
    JavaScripts
    =============================================
    -->
        <script src="<%=application.getContextPath()%>/resources/assets/lib/wow/dist/wow.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/isotope/dist/isotope.pkgd.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/flexslider/jquery.flexslider.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/smoothscroll.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
        <!-- <script async="" defer="" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDWOUFiNJDcJz52bH_O6Ps2S1YvVYQ0Zmo"></script> -->
        <script src="<%=application.getContextPath()%>/resources/assets/js/plugins.js"></script>
        <script src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
        <script src="<%=application.getContextPath()%>/resources/highcharts/code/highcharts.js"></script>
        <script src="<%=application.getContextPath()%>/resources/highcharts/code/themes/grid-light.js"></script>

		<!-- HighCharts Reference -->
        <script src="<%=application.getContextPath()%>/resources/js/chart/photoresistorchart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/gaschart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/temperaturechart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/pressurechart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/humiturechart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/raindropchart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/mercurychart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/lightchart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/frontultrasonicchart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/sideultrasonicchart.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/chart/backultrasonicchart.js"></script>

		<!-- Actuator Reference -->
        <script src="<%=application.getContextPath()%>/resources/js/actuator/buzzer.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/actuator/laseremitter.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/actuator/lcd.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/actuator/rgbled.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/actuator/light.js"></script>
        <script src="<%=application.getContextPath()%>/resources/js/actuator/camerastream.js"></script>
         
        
		
    </body>

    </html>
