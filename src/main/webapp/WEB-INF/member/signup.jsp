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
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/signup.css">
    <!-- 공통 header 연결 -->
    <script type="text/javascript">
        $(document).ready( function() {
            $("#headers").load("../common/header_non.html");  // 원하는 파일 경로를 삽입
        });
        $(document).ready( function() {
            $("#footers").load("../common/footer.html");  // 원하는 파일 경로를 삽입
        });
    </script>
</head>
<body>
<!-- Header -->
<div id="headers"></div>

<!-- Sign up -->
<section class="signup">
    <div class="inner">

        <div class="text-title">
            <span class="title">회원 가입</span>
        </div>
        <form action="/members/join" method="post" class="form-example">
            <div class="text-body">
                <div class="row">
                    <label for="memberName" class="sub-title">이름*</label>
                    <input type="text" id="memberName" name="name" required >
                </div>
                <div class="row">
                    <label for="signupId" class="sub-title">아이디*</label>
                    <input type="text" id="signupId" name="loginId" required
                           minlength="4" maxlength="15">
                    <!--            아이디 중복 오류 메세지-->
                    <%
                        if ((boolean)request.getAttribute("isDuplicated")){
                    %>
                    <script>alert("이미 존재하는 아이디 입니다.")</script>
                    <%}%>
                </div>
                <div class="row">
                    <label for="signupPw" class="sub-title">비밀번호*</label>
                    <input type="password" id="signupPw" name="pw" minlength="8" required >
                </div>
                <div class="row">
                    <label for="signupPwCheck" class="sub-title">비밀번호 확인*</label>
                    <input type="password" id="signupPwCheck" name="checkPw" minlength="8" required >
                    <!--            비밀번호 확인 오류 메세지-->
                    <%
                        if ((boolean)request.getAttribute("isInconsistent")){
                    %>
                    <script>alert("비밀번호가 일치하지 않습니다.")</script>
                    <%}%>
                </div>
                <div class="row">
                    <label for="signupEmail" class="sub-title">이메일*</label>
                    <input type="email" id="signupEmail" name="email" required >
                </div>
                <div class="row">
                    <label for="memberPosition" class="sub-title">포지션*</label>
                    <select name="memberPosition" id="memberPosition" required >
                        <option value="">--- Position ---</option>
                        <c:forEach items="${positionList}" var="position">
                            <option name="position" value="${position}">${position}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="row">
                    <label class="sub-title">보유기술*</label>
                    <div class="modal-btn">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary bton btn--blue-reverse" data-toggle="modal" data-target="#exampleModalCenter">
                            선택하기
                        </button>
                    </div>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle">보유기술</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>

                                </div>
                                <div>
                                    <div class="check-box">
                                        <c:forEach items="${skillList}" var="skill">
                                            <label for="${skill}">${skill}</label>
                                            <input type="checkbox" id="${skill}" name="${skill}" value="${skill}">
                                        </c:forEach>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary bton btn--reverse" data-dismiss="modal">완료</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--            <input type="text" id="memberSkill" name="memberSkill">-->
                </div>
                <div class="row">
                    <label for="memberGithub" class="sub-title">깃허브</label>
                    <input type="text" id="memberGithub" name="gitAddress">
                </div>
                <div class="row">
                    <label for="memberInfo" class="sub-title">한 줄 자기소개</label>
                    <input type="text" id="memberInfo" name="intro" maxlength="25">
                </div>

                <div class="btn-row">
                    <input class="bton btn--reverse" type="submit" value="가입하기">
                </div>
            </div>
        </form>
    </div>
</section>
</body>
<!-- Footer -->
<div id="footers"></div>
</html>