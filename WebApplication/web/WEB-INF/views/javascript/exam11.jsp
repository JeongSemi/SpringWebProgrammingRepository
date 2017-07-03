<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
        <title>JSP Page</title>
        <link href="/WebApplication/resources/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="/WebApplication/resources/jquery/jquery-3.2.1.min.js" type="text/javascript"></script>
        <script src="/WebApplication/resources/bootstrap-3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            function handleBtn1() {
//                var img = document.querySelector("img"); //제일 첫번째 이미지 객체의 번지를 리턴
//                img.src = "/WebApplication/resources/image/photo02.jpg";

                var imgArray = document.querySelectorAll("img"); //이미지를 모두 찾아서 배열로 리턴
                for (var i = 0; i < imgArray.length; i++) {
                    imgArray[i].src = "/WebApplication/resources/image/photo02.jpg";
                }
            }

            function handleBtn2() {
                var img1 = document.querySelector("#img1");
                img1.src = "/WebApplication/resources/image/photo03.jpg";
            }
            function handleBtn3() {
                var class1 = document.querySelectorAll(".class1");
                for (var i = 0; i < class1.length; i++) {
                    class1[i].src = "/WebApplication/resources/image/photo04.jpg";
                }
            }
        </script>
    </head>
    <body>
        <h1>DOM 사용하기</h1>
        <div>
            <button class="btn btn-warning" onclick="handleBtn1()">이미지 변경</button><br/>
            <img src="/WebApplication/resources/image/photo01.jpg" width="100px" height="100px"/>
            <img src="/WebApplication/resources/image/photo02.jpg" width="100px" height="100px"/>
        </div>

        <div>
            <button class="btn btn-success" onclick="handleBtn2()" >img1의 이미지 변경</button>
            <button class="btn btn-success" onclick="handleBtn3()">class1의 이미지 변경</button><br/>
            <img id="img1" src="/WebApplication/resources/image/photo01.jpg" width="100px" height="100px"/>
            <img class="class1" src="/WebApplication/resources/image/photo02.jpg" width="100px" height="100px"/>
            <img class="class1" src="/WebApplication/resources/image/photo02.jpg" width="100px" height="100px"/>
        </div>
    </body>
</html>
