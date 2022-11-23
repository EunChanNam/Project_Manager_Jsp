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
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <!-- Material icons -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp|Material+Symbols+Outlined" rel="stylesheet">
  <!-- CSS 파일 연결 -->
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/project_info.css">
  <!-- 공통 header 연결 -->
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

<!-- Project Information -->
<section class="project-info">
  <div class="inner">

    <div class="text-title">
      <span class="title">프로젝트 타이틀</span>
    </div>

    <div class="text-body">
      <!-- Body Left -->
      <div class="body-left">

        <div class="recruit-box row box">
          <div class="title">
            <span class="icon material-symbols-outlined">group_add</span>
            <span class="text">모집중인 역할</span>
          </div>
          <div class="content">
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">frontend</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">frontend</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">backend</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">backend</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">backend</span>
            </div>
          </div>
        </div>

        <div class="recruit-box row box">
          <div class="title">
            <span class="icon material-symbols-outlined">group</span>
            <span class="text">참여중인 멤버</span>
          </div>
          <div class="content">
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">김인큐</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role">안 산드라</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role recruit-role">None</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role recruit-role">None</span>
            </div>
            <div class="role-body">
              <span class="icon material-symbols-outlined">account_circle_full</span>
              <span class="role recruit-role">None</span>
            </div>
          </div>
        </div>

        <form action="">
          <!-- <button class="bton btn--reverse row box">참여하기</button> -->
          <input type="submit" value="참여하기" class="bton btn--reverse row box">
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-primary bton btn--blue-reverse row box" data-toggle="modal" data-target="#exampleModalCenter">
            프로젝트 상태변경
          </button>

          <!-- Modal -->
          <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">프로젝트 상태</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                  <div class="radio-box">
                    <input type="radio" id="recruitment" name="state" value="recruitment">
                    <label for="recruitment">모집중</label>
                  </div>

                  <div class="radio-box">
                    <input type="radio" id="progress" name="state" value="progress">
                    <label for="progress">진행중</label>
                  </div>

                  <div class="radio-box">
                    <input type="radio" id="complete" name="state" value="complete">
                    <label for="complete">완료</label>
                  </div>

                </div>
                <div class="modal-footer">
                  <!-- <button type="button" class="btn btn-primary bton btn--reverse" >완료</button> -->
                  <input type="submit" value="완료" class="btn btn-primary bton btn--reverse">
                </div>
              </div>
            </div>
          </div>
        </form>

      </div>
      <!-- Body Right -->
      <div class="body-right box">
        <div class="sub-title">
          <span class="icon material-symbols-outlined">description</span>
          <div class="title">프로젝트 설명</div>
        </div>
        <div class="sub-body">
          <div class="font-style">
            <span class="state-text">프로젝트 생성자</span>
            <span class="project-constructor">김인큐</span>
          </div>
          <div class="font-style">
            <span class="state-text">프로젝트 상태</span>
            <span class="project-state">모집중</span>
          </div>
          <div class="font-style">
            <span class="state-text">모집마감 기간</span>
            <span class="recurit-term">~ 2022.05.30</span>
          </div>
          <div class="font-style">
            <span class="state-text">프로젝트 기간</span>
            <span class="project-term">2022.06.01 ~ 2022.06.30</span>
          </div>
          <hr style="margin: 60px 0;">
          <div class="project-content">
            공자는 두기 이상은 그들의 위하여 뜨거운지라, 석가는 피다. 것은 튼튼하며, 굳세게 뼈 아니한 낙원을 긴지라 우리의 인간의 위하여서. 기관과 어디 미묘한 수 오아이스도 커다란 이상 만천하의 것이다. 인간에 그들의 두손을 스며들어 얼마나 그와 이것이다. 그들은 풍부하게 우리 고동을 보는 아니다. 봄바람을 이상, 남는 방지하는 예수는 천하를 칼이다. 사랑의 용기가 무엇을 때문이다. 보이는 긴지라 황금시대를 날카로우나 황금시대다. 노래하며 너의 피에 우리 목숨이 이 봄바람이다. 가는 피어나기 있는 반짝이는 이것이다.

            고행을 오아이스도 꾸며 많이 간에 얼마나 교향악이다. 보이는 착목한는 오아이스도 온갖 자신과 아니다. 시들어 오아이스도 얼마나 미묘한 것이 만천하의 있다. 이 전인 인생을 것이다. 보는 찬미를 이상의 그들을 이것은 소담스러운 얼음이 튼튼하며, 대중을 것이다. 동산에는 긴지라 오직 있을 그들은 용감하고 충분히 부패뿐이다. 따뜻한 보이는 커다란 있으며, 때에, 영락과 듣는다. 넣는 것은 같지 아름다우냐? 대중을 무한한 못할 곧 있는가?

            보이는 영원히 이것이야말로 석가는 가는 힘있다. 앞이 뜨거운지라, 작고 보라. 목숨이 이 가치를 석가는 이상은 사막이다. 따뜻한 가장 내려온 반짝이는 가치를 그들의 밝은 되는 소담스러운 위하여서. 인생에 아름답고 않는 하였으며, 반짝이는 품고 과실이 없으면, 뿐이다. 찬미를 사랑의 거선의 시들어 영원히 뛰노는 보라. 희망의 위하여 목숨이 거선의 청춘이 얼음이 칼이다. 풀이 돋고, 든 긴지라 가치를 같으며, 그와 그것은 뿐이다. 들어 원대하고, 맺어, 있으랴? 그들은 많이 인간의 뜨고, 교향악이다.

          </div>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- Footer -->
<div id="footers"></div>
</body>
</html>

