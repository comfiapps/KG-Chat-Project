<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<h6>${principal.user.id}</h6>

    <link href="https://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.3.1/materia/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">

    <title>사용자 페이지</title>

<style>
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



    .drawer {
        display: none;
    }
    .drawer__overlay {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        z-index: 200;
        opacity: 0;

        transition: opacity 0.3s;
        will-change: opacity;
        background-color: #000;

        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
    }

    .drawer__header {
        /* Optional */
        padding: 1.5rem;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ddd;
    }

    .drawer__close {
        /* Optional */
        margin: 0;
        padding: 0;
        border: none;
        background-color: transparent;
        cursor: pointer;
        background-image: url("data:image/svg+xml,%0A%3Csvg width='15px' height='16px' viewBox='0 0 15 16' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'%3E%3Cg id='Page-1' stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'%3E%3Cg id='2.-Menu' transform='translate(-15.000000, -13.000000)' stroke='%23000000'%3E%3Cg id='Group' transform='translate(15.000000, 13.521000)'%3E%3Cpath d='M0,0.479000129 L15,14.2971819' id='Path-3'%3E%3C/path%3E%3Cpath d='M0,14.7761821 L15,-1.24344979e-14' id='Path-3'%3E%3C/path%3E%3C/g%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        width: 15px;
        height: 15px;
    }

    .drawer__wrapper {
        position: fixed;

        top: 0;
        right: 0;
        bottom: 0;
        height: 100%;

        max-width: 500px;
        z-index: 9999;
        overflow: auto;

        transition: transform 0.3s;
        will-change: transform;
        background-color: #fafafa;

        display: flex;
        flex-direction: column;

        -webkit-transform: translateX(103%);
        transform: translateX(103%);

        -webkit-overflow-scrolling: touch;


        box-shadow: 0 2px 6px #777;
    }

    .drawer__content {
        position: relative;
        overflow-x: hidden;
        overflow-y: auto;
        height: 100%;
        flex-grow: 1;

        padding: 1.5rem;
    }

    .drawer--left .drawer__wrapper {
        left: 0;
        right: auto;
        -webkit-transform: translate3d(-100%, 0, 0);
        transform: translate3d(-100%, 0, 0);
    }

    .drawer.is-active {
        display: block;
    }

    .drawer.is-visible .drawer__wrapper {
        -webkit-transform: translateX(0);
        transform: translateX(0);
    }

    .drawer.is-visible .drawer__overlay {
        opacity: 0.5;
    }
    .img{
        top: 217px;
        left: 408px;
        width: 62px;
        height: 62px;
        background: transparent url('img/img_01.png') 0% 0% no-repeat padding-box;
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

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-9 col-md-6 " >

            <div class="title-box">
                MYPAGE

            </div>



            <div class="form-group">
                <label>프로필사진</label>


                <img src="img/img_01.jpg" class="img">

                <a href="#" data-drawer-trigger="" aria-controls="drawer-name" aria-expanded="false" class="btn btn-primary" style="float: right;">참여한 토론</a>


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

<section class="drawer is-active is-visible" id="drawer-name" data-drawer-target="">
    <div class="drawer__overlay" data-drawer-close="" tabindex="-1"></div>
    <div class="drawer__wrapper">
        <div class="drawer__header">
            <div class="drawer__title">
                참여한 토론
            </div>
            <button class="drawer__close" data-drawer-close="" aria-label="Close Drawer"></button>
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
</section>
<script>



    var drawer = function () {


        if (!Element.prototype.closest) {
            if (!Element.prototype.matches) {
                Element.prototype.matches = Element.prototype.msMatchesSelector || Element.prototype.webkitMatchesSelector;
            }
            Element.prototype.closest = function (s) {
                var el = this;
                var ancestor = this;
                if (!document.documentElement.contains(el)) return null;
                do {
                    if (ancestor.matches(s)) return ancestor;
                    ancestor = ancestor.parentElement;
                } while (ancestor !== null);
                return null;
            };
        }



        var settings = {
            speedOpen: 50,
            speedClose: 350,
            activeClass: 'is-active',
            visibleClass: 'is-visible',
            selectorTarget: '[data-drawer-target]',
            selectorTrigger: '[data-drawer-trigger]',
            selectorClose: '[data-drawer-close]',

        };



        var toggleccessibility = function (event) {
            if (event.getAttribute('aria-expanded') === 'true') {
                event.setAttribute('aria-expanded', false);
            } else {
                event.setAttribute('aria-expanded', true);
            }
        };

        // Open Drawer
        var openDrawer = function (trigger) {

            // Find target
            var target = document.getElementById(trigger.getAttribute('aria-controls'));

            // Make it active
            target.classList.add(settings.activeClass);

            // Make body overflow hidden so it's not scrollable
            document.documentElement.style.overflow = 'hidden';

            // Toggle accessibility
            toggleccessibility(trigger);

            // Make it visible
            setTimeout(function () {
                target.classList.add(settings.visibleClass);
            }, settings.speedOpen);

        };

        // Close Drawer
        var closeDrawer = function (event) {

            // Find target
            var closestParent = event.closest(settings.selectorTarget),
                childrenTrigger = document.querySelector('[aria-controls="' + closestParent.id + '"');

            // Make it not visible
            closestParent.classList.remove(settings.visibleClass);

            // Remove body overflow hidden
            document.documentElement.style.overflow = '';

            // Toggle accessibility
            toggleccessibility(childrenTrigger);

            // Make it not active
            setTimeout(function () {
                closestParent.classList.remove(settings.activeClass);
            }, settings.speedClose);

        };

        // Click Handler
        var clickHandler = function (event) {

            // Find elements
            var toggle = event.target,
                open = toggle.closest(settings.selectorTrigger),
                close = toggle.closest(settings.selectorClose);

            // Open drawer when the open button is clicked
            if (open) {
                openDrawer(open);
            }

            // Close drawer when the close button (or overlay area) is clicked
            if (close) {
                closeDrawer(close);
            }

            // Prevent default link behavior
            if (open || close) {
                event.preventDefault();
            }

        };

        // Keydown Handler, handle Escape button
        var keydownHandler = function (event) {

            if (event.key === 'Escape' || event.keyCode === 27) {

                // Find all possible drawers
                var drawers = document.querySelectorAll(settings.selectorTarget),
                    i;

                // Find active drawers and close them when escape is clicked
                for (i = 0; i < drawers.length; ++i) {
                    if (drawers[i].classList.contains(settings.activeClass)) {
                        closeDrawer(drawers[i]);
                    }
                }

            }

        };


        //
        // Inits & Event Listeners
        //
        document.addEventListener('click', clickHandler, false);
        document.addEventListener('keydown', keydownHandler, false);


    };

    drawer();


</script>







</body>

<%@ include file="../layout/footer.jsp"%>