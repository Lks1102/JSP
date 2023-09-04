<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css"/>
    <link rel="stylesheet" href="/farmstory2/css/style.css"/>
    <link rel="stylesheet" href="/farmstory2/user/css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>    
    <script>
        $(function(){
            $('.slider > ul').bxSlider({
                slideWidth: 980,
                pager: false,
                controls: false,
                auto: true
            });

            $('#tabs').tabs();
        });
    </script>

</head>
<body>
    <div id="container">
        <header>
            <a href="/farmstory2/index.jsp" class="logo"><img src="/farmstory2/images/logo.png" alt="로고"/></a>
            <p>
                <a href="/farmstory2/index.jsp">HOME |</a>
                <a href="/farmstory2/user/login.do">로그인 |</a>
                <a href="/farmstory2/user/register.do">회원가입 |</a>
                <a href="/farmstory2/admin/">관리자 |</a>
                <a href="#">고객센터</a>
            </p>
            <img src="/farmstory2/images/head_txt_img.png" alt="3만원 이상 무료배송"/>
            
            <ul class="gnb">
                <li><a href="/farmstory2/introduction/hello.do">팜스토리소개</a></li>
                <li><a href="/farmstory2/market/list.do"><img src="/farmstory2/images/head_menu_badge.png" alt="30%"/>장보기</a></li>
                <li><a href="/farmstory2/croptalk/story.do">농작물이야기</a></li>
                <li><a href="/farmstory2/event/event.do">이벤트</a></li>
                <li><a href="/farmstory2/community/notice.do">커뮤니티</a></li>
            </ul>
        </header>