<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<h6>${principal.user.id}</h6>

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">

    <title>사용자 페이지</title>

    <style>
        .sz-navbar {
            width: 100%;

            /* OVERRIDE WITH YOUR OWN HEIGHT */
            background-color: #fff;
            /* OVERRIDE WITH YOUR OWN BG COLOR */
            position: fixed;
            top: 0;
            left: 0;
            z-index: 5;
        }

        .sz-navbar-inner {
            width: 100%;
            height: 100%;
            display: -webkit-inline-box;
            display: -ms-inline-flexbox;
            display: inline-flex;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        #sz-navbar-check {
            display: none;
        }

        @media (min-width: 600px) {
            .sz-navbar-inner {
                max-width: 1200px;
                position: relative;
                left: 50%;
                -webkit-transform: translateX(-50%);
                transform: translateX(-50%);
            }
            .sz-navbar-hamburger {
                display: none;
            }
            .sz-navbar-right .sz-navbar-items {
                margin-left: auto;
            }
            .sz-navbar-right .sz-navbar-items .sz-navbar-item {
                margin-left: 8px;
            }
            .sz-navbar-left .sz-navbar-item {
                margin-right: 8px;
            }
        }

        @media (max-width: 600px) {
            .sz-navbar-inner {
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
            }
            .sz-navbar-items {
                position: fixed;
                top: 0;
                bottom: 0;
                width: 100%;
                background-color: #eee;
                /* OVERRIDE WITH YOUR OWN MENU BG COLOR */
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-flow: column nowrap;
                flex-flow: column nowrap;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
            }
            .sz-navbar-hamburger {
                position: absolute;
                z-index: 6;
                top: 50%;
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
            }
            .sz-navbar-left .sz-navbar-items {
                left: 0;
                margin-left: -100%;
                -webkit-transition: margin-left 0.2s ease;
                transition: margin-left 0.2s ease;
            }
            .sz-navbar-left #sz-navbar-check:checked ~ .sz-navbar-items {
                margin-left: 0;
            }
            .sz-navbar-left .sz-navbar-hamburger {
                left: 24px;
                /* OVERRIDE WITH YOUR OWN HAMBURGER BUTTON MARGIN */
            }
            .sz-navbar-right .sz-navbar-items {
                right: 0;
                margin-right: -100%;
                -webkit-transition: margin-right 0.2s ease;
                transition: margin-right 0.2s ease;
            }
            .sz-navbar-right #sz-navbar-check:checked ~ .sz-navbar-items {
                margin-right: 0;
            }
            .sz-navbar-right .sz-navbar-hamburger {
                right: 24px;
                /* OVERRIDE WITH YOUR OWN HAMBURGER BUTTON MARGIN */
            }
            div.sz-navbar-item:not(:last-of-type) {
                margin-bottom: 8px;
            }
        }

        .img{
            top: 217px;
            left: 408px;
            width: 62px;
            height: 62px;
            background: transparent url('static/image/profile.png') 0% 0% no-repeat padding-box;
            opacity: 1;
        }

        .content_box{
            width: 279px;
            height: 172px;
            align-items: right;
            background: #ebebeb 0% 0% no-repeat padding-box;
            color: #6B6868;
            display: grid;
            grid-template-rows: 20% 60% 20%;
            padding: 10px;
            margin: 0px;
        }

        .content_box .content_title{
            text-align: left;
            font: normal normal normal 14px/19px Segoe UI;
            font-weight: 700;
            color: #2D2D2D;
        }

        .hashTag{
            font: normal normal normal 8px/19px Segoe UI;
            font-weight: 100;
        }

        .content_box .content_detail{
            display: grid;
            grid-template-columns: 30% 40% 30%;
            justify-items: center;
            align-items: center;
            text-align: center;
        }

        .content_box .content_footer{
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
        }

        .content_box .content_footer div:nth-child(1){
            text-align: left;
            font: normal normal normal 10px/14px Segoe UI;
        }

        .content_box .content_footer div:nth-child(2){
            text-align: right;
            font: normal normal normal 9px/12px Segoe UI;
        }

        .content_footer_left{
            display: grid;
            width: 50%;
            grid-template-columns: 30% 70%;
            justify-items: center;
        }

        .compare{
            width: 100%;
        }

        .profile{
            border-radius: 100%;
        }

        .time{
            text-align: center;
            font: normal normal normal 12px/16px Segoe UI;
            letter-spacing: 0px;
        }

        .process_bar{
            background: #7EA5FF 0% 0% no-repeat padding-box;
            margin: 5px auto;
            width: 80%;
            height: 5px;
        }

        .process_left{
            width: 50%;
            height: 100%;
            background: #FF7E7E 0% 0% no-repeat padding-box;

            border: 0;
        }

        .text_center{
            display: flex;
            align-self: center;
        }

        .test progress{
            background: #7EA5FF 0% 0% no-repeat padding-box;
        }

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box; /* 박스에 border-box설정 */
        }

        body, html {
            font-family: 'Noto Sans KR', sans-serif;
            width: 120%;
            min-width: 320px; /* body영역의 최소사이즈 */
        }

        img {
            max-width: 100%; /* 사이즈가 변해도 넓이는 유지 */
            height: auto; /* 사이즈가 변하면 높이는 넓이에 따라서 유지 */
        }

        input, textarea, button, select {
            /*
            고유하게 적용되어 있는 form관련 요소들을 제거해서
            여러 브라우저에서 동일한 form관련태그 디자인이 보이도록 처리.
            */
            -webkit-appearance: none;
            -moz-appearance: none;
            -ms-appearance: none;
            -o-appearance: none;
            appearance: none;
        }


        ul, li, ol, dl {
            list-style: none;
        }

        .title-box {
            width:250px;
            margin: 60px auto; /* 박스정렬 */
            text-align: center; /* 글씨정렬 */
            padding: 20px 40px;
            border-bottom: 1px solid #E1E1E1;
            border-top: 1px solid #E1E1E1;
        }

        .join-form {

            margin: 0 auto;
            float: none;

        }
        .join-form form {

            border-radius: 12px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.335);
            padding: 50px;
        }
        @media (max-width: 767px) {
            .join-form form {
                padding: 50px 10px;
            }
        }

        #carbonads a{color:#fff;text-decoration:none}#carbonads a:hover{color:#fafafa}
    </style>

    <link href="https://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">

    <meta http-equiv="origin-trial"
          content="A2shzsdPO+RKe83bUqT9oVkYwGZN6j9O7nrcOASNFPuQz8HefgVYb9qAqn6coNCSDIRtXoi6ybCrjEsYh3caFgIAAAB7eyJvcmlnaW4iOiJodHRwczovL2RvdWJsZWNsaWNrLm5ldDo0NDMiLCJmZWF0dXJlIjoiVHJ1c3RUb2tlbnMiLCJleHBpcnkiOjE2MTM0OTU4NjgsImlzU3ViZG9tYWluIjp0cnVlLCJpc1RoaXJkUGFydHkiOnRydWV9">
    <link rel="preload" href="https://adservice.google.co.kr/adsid/integrator.js?domain=www.cssscript.com" as="script">
    <link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=www.cssscript.com" as="script">
    <script src="https://pagead2.googlesyndication.com/pagead/js/r20210107/r20190131/reactive_library_fy2019.js"></script>
    <script src="https://www.googletagservices.com/activeview/js/current/osd.js?cb=%2Fr20100101"></script>
    <script type="text/javascript" src="https://adservice.google.co.kr/adsid/integrator.js?domain=www.cssscript.com"></script>
    <script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=www.cssscript.com"></script>

</head>


<body aria-hidden="false">
    <div class="sz-navbar">
        <div class="sz-navbar-inner sz-navbar-right">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-9 col-md-6 " >

                        <div class="title-box">
                            MYPAGE
                        </div>

                        <div class="form-group">
                            <label>프로필사진</label>
                            <img src="img/img_01.jpg" class="img">
                        </div>

                        <div class="form-group">
                            <label>닉네임</label>
                            <input type="text" class="form-control" >
                        </div>

                        <div class="form-group">
                            <label>나이</label>
                            <input type="text" class="form-control" >
                        </div>

                        <div class="form-group">
                            <label>성별</label>
                            <div class="input-group">
                                <div class="form-group">

                                    <button type="button" class="btn btn-info">남</button>

                                    <button type="button" class="btn btn-light">여</button>
                                </div>

                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" class="btn btn-primary btn-block">수정</button> <!-- 부트스트랩 버튼 클래스 -->
                            <button type="button" class="btn btn-default btn-block">취소</button>
                        </div>
                    </div>
                </div>
            </div>

            <input type="checkbox" id="sz-navbar-check">
            <label for="sz-navbar-check" class="sz-navbar-hamburger">☰전적보기</label>
            <div class="sz-navbar-items">
                <p>참여한 토론</p>
                <div class="content_box">
                    <div class="content_title">
                        <div class="hashTag">
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                        </div>
                        <div>당신의 과거는 안녕하십니까?</div>
                    </div>
                    <div class="content_detail">
                        <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                        <div class="compare">
                            <div class="score">1-2</div>
                            <div class="process_bar">
                                <div class="process_left"></div>
                            </div>
                            <div class="time">
                                31:40
                            </div>
                        </div>
                        <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                    </div>
                    <div class="content_footer">
                        <div class="content_footer_left">
                            <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                            <div class="text_center">User #1</div>
                        </div>
                        <div>시청자 50명</div>
                    </div>
                </div>
                <div class="content_box">
                    <div class="content_title">
                        <div class="hashTag">
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                        </div>
                        <div>당신의 과거는 안녕하십니까?</div>
                    </div>
                    <div class="content_detail">
                        <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                        <div class="compare">
                            <div class="score">1-2</div>
                            <div class="process_bar">
                                <div class="process_left"></div>
                            </div>
                            <div class="time">
                                31:40
                            </div>
                        </div>
                        <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                    </div>
                    <div class="content_footer">
                        <div class="content_footer_left">
                            <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                            <div class="text_center">User #1</div>
                        </div>
                        <div>시청자 50명</div>
                    </div>
                </div>
                <div class="content_box">
                    <div class="content_title">
                        <div class="hashTag">
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                        </div>
                        <div>당신의 과거는 안녕하십니까?</div>
                    </div>
                    <div class="content_detail">
                        <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                        <div class="compare">
                            <div class="score">1-2</div>
                            <div class="process_bar">
                                <div class="process_left"></div>
                            </div>
                            <div class="time">
                                31:40
                            </div>
                        </div>
                        <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                    </div>
                    <div class="content_footer">
                        <div class="content_footer_left">
                            <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                            <div class="text_center">User #1</div>
                        </div>
                        <div>시청자 50명</div>
                    </div>
                </div>
                <div class="content_box">
                    <div class="content_title">
                        <div class="hashTag">
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                            <a href="#">#성평등</a>
                        </div>
                        <div>당신의 과거는 안녕하십니까?</div>
                    </div>
                    <div class="content_detail">
                        <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                        <div class="compare">
                            <div class="score">1-2</div>
                            <div class="process_bar">
                                <div class="process_left"></div>
                            </div>
                            <div class="time">
                                31:40
                            </div>
                        </div>
                        <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                    </div>
                    <div class="content_footer">
                        <div class="content_footer_left">
                            <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                            <div class="text_center">User #1</div>
                        </div>
                        <div>시청자 50명</div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script src="https://partner.googleadservices.com/gampad/cookie.js?domain=www.cssscript.com&amp;callback=_gfp_s_&amp;client=ca-pub-2783044520727903&amp;cookie=ID%3Dc9beed36aa7665e0-226a05a8a9c50002%3AT%3D1610474566%3ART%3D1610474566%3AS%3DALNI_MaPskzCHjGtRokYBi0oTcHz7gtMiQ"></script><script src="https://pagead2.googlesyndication.com/pagead/js/r20210107/r20190131/show_ads_impl_fy2019.js" id="google_shimpl"></script><script async="" src="//www.google-analytics.com/analytics.js"></script><script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>

    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>

    <script>
        try {
            fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
                return true;
            }).catch(function(e) {
                var carbonScript = document.createElement("script");
                carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CE7DC2JW&placement=wwwcssscriptcom";
                carbonScript.id = "_carbonads_js";
                document.getElementById("carbon-block").appendChild(carbonScript);
            });
        } catch (error) {
            console.log(error);
        }
    </script>

    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-46156385-1', 'cssscript.com');
        ga('send', 'pageview');
    </script>

<%@ include file="../layout/footer.jsp"%>