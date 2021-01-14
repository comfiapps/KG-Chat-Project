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
        height: 67.5%;
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

<script>
    $(document).ready(function () {
        console.log($("visitor_msg_input"));

        $("#visitor_msg_input").keyup(function () {
            if (event.key === "Enter") {
                var data = $("#visitor_msg_input").val();
                $("#visitor_msg_input").val("");
                console.log("전송");
            }
        });
    });



</script>

<section class="chat">
    <div class="chat_container">
        <div class="main_container">
            <div class="result_box">
                <div class="score_box">
                    <div class="user_left">
                        <div><img src="img/profile.png" alt="" class="profile"></div>
                        <div>user#1</div>
                    </div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="time">3:32</div>
                    </div>
                    <div class="user_right">
                        <div><img src="img/profile.png" alt="" class="profile"></div>
                        <div>user#1</div>
                    </div>
                </div>
                <div class="process_bar"><!--process_left의 width를 변경하여 비율 조절 %로 사용할 것-->
                    <div class="process_left"></div>
                </div>
            </div>
            <div class="discusser_content">
                <div class="discusser_area">
                    <div class="discusser_box">
                        <div class="discusser_left">
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_left">
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                        </div>
                    </div>

                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_left">
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                        </div>
                    </div>

                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_left">
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                        </div>
                    </div>

                    <div class="discusser_box">
                        <div class="discusser_right">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Auctor elit sed vulputate mi sit.
                                Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Velit scelerisque
                                in dictum non consectetur a erat nam at. A erat nam at lectus urna duis convallis
                                convallis.</p>
                            <div>
                                <img src="img/profile.png" alt="" class="profile">
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="visitor_container">
            <div class="visitor_vote">
                <div class="visitor_vote_title">Vote the Best One</div>
                <div class="visitor_vote_btn">
                    <a class="user_left">
                        <img src="img/profile.png" alt="" class="profile">
                        <div>user#1</div>
                    </a>
                    <a class="user_right">
                        <div>User#2</div>
                        <img src="img/profile.png" alt="" class="profile">
                    </a>
                </div>
            </div>
            <div class="visitor_reply_area">
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
                <div class="visitor_box">
                    <div class="user">
                        <strong>User name</strong> • 13 minutes ago
                    </div>
                    <div class="reply">
                        <p>오늘도 이 비는 그치지 않아
                            모두 어디서 흘러오는 건지
                            창밖으로 출렁이던 헤드라잇 강물도
                            갈 곳을 잃은 채 울먹이고
                            자동응답기의 공허한 시간
                            모두 어디로 흘러가는 건지
                            기다림은 방 한 구석 잊혀진 화초처럼
                            조금씩 시들어 고개 숙여가고
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            모든 흔적 지웠다고 믿었지
                            그건 어리석은 착각이었어
                            이맘때쯤 네가 좋아한 쏟아지는 비까진
                            나의 힘으로도 어쩔 수 없는 걸
                            너를 보고 싶어서
                            내가 울 준 몰랐어
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네
                            그토록 오랜 시간들이 지나도
                            나에게 마르지 않는 눈물을 남겼네</p>
                    </div>
                </div>
            </div>
            <div class="hr_line"></div>
            <div class="visitor_reply_trans">
                <input type="text" placeholder="Enter Message" id="visitor_msg_input">
            </div>
        </div>
    </div>
</section>



<%@ include file="../layout/footer.jsp"%>