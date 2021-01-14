<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

    <style>
        .discusser_content{
            height: 78%;
            overflow: auto;
            -ms-overflow-style: none; /* IE and Edge */
            scrollbar-width: none; /* Firefox */

        }

        .visitor_reply_area{
            /* height: 85% */
            height: 95%;
            overflow: auto;

            -ms-overflow-style: none; /* IE and Edge */
            scrollbar-width: none; /* Firefox */
        }

        @media(max-width: 760px) {
            .chat_container {
                grid-template-columns: 1fr;
            }
            .visitor_content {
                display: none;
            }
        }

    </style>
</head>

<body>
    <section class="chat">
        <div class="chat_container">
            <div class="main_container">
                <div class="result_box">
                    <div class="score_box">
                        <div class="user_left">
                            <div><img src="${pageContext.request.contextPath}/image/profileReplacement.png" alt="" class="profile"></div>
                            <div>user#1</div>
                        </div>
                        <div class="compare">
                            <div class="score">1-2</div>
                            <div class="time">3:32</div>
                        </div>
                        <div class="user_right">
                            <div><img src="${pageContext.request.contextPath}/image/profileReplacement.png" alt="" class="profile"></div>
                            <div>user#1</div>
                        </div>
                    </div>
                    <div class="process_bar"><!--process_left의 width를 변경하여 비율 조절 %로 사용할 것-->
                        <div class="process_left"></div>
                    </div>
                </div>
                <div class="discusser_content">
                    <div class="discusser_area"></div>
                </div>

                <div class="hr_line"></div>

                <div class="discusser_msg_trans">
                    <input type="text" placeholder="Enter Message" id="discusser_msg_input">
                </div>

            </div>
            <div class="visitor_container">
                <div class="visitor_reply_area">
                    <div class="visitor_box">
                        <div class="user">
                            <strong>User name</strong> • 13 minutes ago
                        </div>
                        <div class="reply">
                            <p>오늘도 이 비는 그치지 않아</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        let channel = ${sessionScope.chatId};
        let socket;
        let stompClient;
        let user = "tempTester";
    </script>

    <script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
    <script src="${pageContext.request.contextPath}/js/stomp.js"></script>
    <script src="${pageContext.request.contextPath}/js/chat.js"></script>

<%@ include file="../layout/footer.jsp"%>