<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
  <!-- CSS 파일 연결 -->
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/project_posting.css">
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
<!-- Project Posting -->
<section class="project">
  <div class="inner">

    <div class="text-title">
      <span class="title">프로젝트 생성</span>
    </div>
    <form action="/projects/new" method="post" enctype="multipart/form-data" class="form-example">
      <div class="text-body">
        <div class="row">
          <label for="projectName" class="sub-title">프로젝트 이름*</label>
          <input type="text" id="projectName" name="name" required >
        </div>
        <div class="row">
          <label for="recruitDateStart" class="sub-title">모집완료 기간*</label>
          <div class="date-bundle">
            <input type="date" class="date-one" id="recruitDateStart" name="period" required >
          </div>
        </div>
        <div class="row">
          <label for="projectDateStart" class="sub-title">프로젝트 기간*</label>
          <div class="date-bundle">
            <input type="date" class="date-one" id="projectDateStart" name="startDate" required >
            <span> ~ </span>
            <input type="date" class="date-one" id="projectDateEnd" name="endDate" required >
          </div>
        </div>
        <div class="row">
          <label for="recruitSkill" class="sub-title">모집할 역할*</label>
          <div class="modal-btn">
            <!-- Button trigger modal -->
            <button id="recruitSkill" type="button" class="btn btn-primary bton btn--blue-reverse" data-toggle="modal" data-target="#exampleModalCenter">
              선택하기
            </button>
          </div>

          <!-- Modal -->
          <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Position</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">

                  <div class="check-box">
                    <c:forEach items="${positionList}" var="position">
                    <label for="${position}">${position}</label>
                    <input type="checkbox" id="${position}" value="${position}" name="positions">
                    </c:forEach>
                  </div>

                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary bton btn--reverse" data-dismiss="modal">완료</button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <label for="fileInput" class="sub-title">표지 사진*</label>
          <input type="file" id="fileInput" name="file">
        </div>
        <div class="row">
          <label for="projectInfo" class="sub-title">프로젝트 소개</label>
          <textarea id="projectInfo" name="introduction" rows="9" cols="33" required></textarea>
        </div>

        <div class="btn-row">
          <input class="bton btn--reverse" type="submit" value="프로젝트 등록">
        </div>
      </div>
    </form>

  </div>
</section>
<!-- Footer -->
<div id="footers"></div>
</body>
</html>