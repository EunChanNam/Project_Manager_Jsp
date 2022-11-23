﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InQ Project Manager</title>
    <!-- favicon 선언 -->
    <link rel="icon" href="/images/inq_logo.png">
    <!-- 브라우저 기본 CSS 초기화 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css" integrity="sha512-NmLkDIU1C/C88wi324HBc+S2kLhi08PN5GDeUVVVC/BVt/9Izdsc9SVeVfA1UZbY3sHUlDSyRXhCzHfr6hmPPw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Material icons -->
    <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp|Material+Symbols+Outlined" rel="stylesheet">
    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/project_home.css">
    <!-- JS 파일 연결 -->
    <script defer src="../js/project_home.js"></script>
    <script type="text/javascript">
        $(document).ready( function() {
            $("#headers").load("../common/header.html");  // 원하는 파일 경로를 삽입
        });
        $(document).ready( function() {
            $("#footers").load("../common/footer.html");  // 원하는 파일 경로를 삽입
        });
    </script>
</head>
<body>
<!-- Header -->
<div id="headers"></div>
<!-- <header>
  <div class="header-inner">

    <div onClick="location.href='../home.html'" class="logo">
      <img src="../images/inq_logo.png" alt="InQ" />
    </div>

    <div class="search">
      <span class="icon material-symbols-outlined">search</span>
      <input placeholder="프로젝트명으로 검색하기" type="text" name="search-text" id="search-text">
      <input type="submit" class="bton btn--reverse" value="검색">
    </div>

    <div class="menu">
      <a href="javascript:void(0)" class="bton login_name">인큐님 반갑습니다</a>
    </div>
  </div>
</header> -->
<!-- Searh Bar -->
<section class="search-bar">
    <form action="">
        <div class="search-radio">
            <div class="inner">

                <div class="radio-box">
                    <input type="radio" id="recruitment" name="state" value="recruitment">
                    <label for="recruitment" class="bton underline">모집중</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="progress" name="state" value="progress">
                    <label for="progress" class="bton underline">진행중</label>
                </div>

                <div class="radio-box">
                    <input type="radio" id="complete" name="state" value="complete">
                    <label for="complete" class="bton underline">완료</label>
                </div>

                <div class="search">
                    <span class="icon material-symbols-outlined">search</span>
                    <input placeholder="프로젝트명으로 검색하기" type="text" name="search-text" id="search-text">
                    <input type="submit" class="bton btn--reverse" value="검색">
                </div>

            </div>
        </div>
    </form>

    <a href="#" class="bton btn--reverse posting" onclick="location.href='./project_posting.html'">프로젝트 등록</a>
</section>

<!-- Project Bundle-->
<section class="project-bundle">
    <div class="inner">

        <div class="card-list">

            <a href="#" onclick="location.href='./project_info.html'" class="card">
                <img class="card-img-top" src="../images/inq_logo.png" alt="Card image cap" />
                <div class="card-body">
                    <div class="card-text card-title">[인큐] 프로젝트 관리 매니저</div>
                    <div class="card-text">
                        <div class="card-info">
                            <div class="info-left">
                                <div class="info-date">
                                    모집기간
                                    <span class="recruit-date">22.05.10 - 22.05.20</span>
                                </div>
                            </div>
                            <div class="info-right">
                                <div class="info-member">
                                    <span class="symbol material-icons">person</span>
                                    <span class="member-personnel">
                      2
                      /
                      5
                    </span>
                                </div>
                                <div class="info-progress execution">진행중</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <a href="#" onclick="location.href='./project_info.html'" class="card">
                <img class="card-img-top" src="../images/inq_logo.png" alt="Card image cap" />
                <div class="card-body">
                    <div class="card-text card-title">[인큐] 프로젝트 관리 매니저</div>
                    <div class="card-text">
                        <div class="card-info">
                            <div class="info-left">
                                <div class="info-date">
                                    모집기간
                                    <span class="recruit-date">22.05.10 - 22.05.20</span>
                                </div>
                            </div>
                            <div class="info-right">
                                <div class="info-member">
                                    <span class="symbol material-icons">person</span>
                                    <span class="member-personnel">
                      2
                      /
                      5
                    </span>
                                </div>
                                <div class="info-progress complete">완료</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <a href="#" onclick="location.href='./project_info.html'" class="card">
                <img class="card-img-top" src="../images/inq_logo.png" alt="Card image cap" />
                <div class="card-body">
                    <div class="card-text card-title">[인큐] 프로젝트 관리 매니저</div>
                    <div class="card-text">
                        <div class="card-info">
                            <div class="info-left">
                                <div class="info-date">
                                    모집기간
                                    <span class="recruit-date">22.05.10 - 22.05.20</span>
                                </div>
                            </div>
                            <div class="info-right">
                                <div class="info-member">
                                    <span class="symbol material-icons">person</span>
                                    <span class="member-personnel">
                      2
                      /
                      5
                    </span>
                                </div>
                                <div class="info-progress recruit">모집중</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <a href="#" onclick="location.href='./project_info.html'" class="card">
                <img class="card-img-top" src="../images/inq_logo.png" alt="Card image cap" />
                <div class="card-body">
                    <div class="card-text card-title">[인큐] 프로젝트 관리 매니저</div>
                    <div class="card-text">
                        <div class="card-info">
                            <div class="info-left">
                                <div class="info-date">
                                    모집기간
                                    <span class="recruit-date">22.05.10 - 22.05.20</span>
                                </div>
                            </div>
                            <div class="info-right">
                                <div class="info-member">
                                    <span class="symbol material-icons">person</span>
                                    <span class="member-personnel">
                      2
                      /
                      5
                    </span>
                                </div>
                                <div class="info-progress recruit">모집중</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

            <a href="#" onclick="location.href='./project_info.html'" class="card">
                <img class="card-img-top" src="../images/inq_logo.png" alt="Card image cap" />
                <div class="card-body">
                    <div class="card-text card-title">[인큐] 프로젝트 관리 매니저</div>
                    <div class="card-text">
                        <div class="card-info">
                            <div class="info-left">
                                <div class="info-date">
                                    모집기간
                                    <span class="recruit-date">22.05.10 - 22.05.20</span>
                                </div>
                            </div>
                            <div class="info-right">
                                <div class="info-member">
                                    <span class="symbol material-icons">person</span>
                                    <span class="member-personnel">
                      2
                      /
                      5
                    </span>
                                </div>
                                <div class="info-progress execution">진행중</div>
                            </div>
                        </div>
                    </div>
                </div>
            </a>

        </div>
    </div>
</section>

<!-- Footer -->
<div id="footers"></div>

</body>
</html>
