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
    <style>
        .field-error {
            border-color: #dc3545;
            color: #dc3545;
        }
    </style>
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
        <form th:action method="post" class="form-example" th:object="${memberForm}">
            <div class="text-body">
                <div class="row">
                    <label for="memberName" class="sub-title">이름*</label>
                    <input th:field="*{name}" type="text" id="memberName" name="memberName" required >
                </div>
                <div class="row">
                    <label for="signupId" class="sub-title">아이디*</label>
                    <input th:field="*{loginId}" type="text" id="signupId" name="signupId" required
                           minlength="4" maxlength="15">
                    <div th:class="field-error" th:errors="*{loginId}"></div>
                </div>
                <div class="row">
                    <label for="signupPw" class="sub-title">비밀번호*</label>
                    <input th:field="*{pw}" type="password" id="signupPw" name="signupPw" minlength="8" required >
                </div>
                <div class="row">
                    <label for="signupPwCheck" class="sub-title">비밀번호 확인*</label>
                    <input th:field="*{checkPw}" type="password" id="signupPwCheck" name="signupPwCheck" minlength="8" required >
                    <!--            비밀번호 확인 오류 메세지-->
                    <div th:class="field-error" th:errors="*{checkPw}"></div>
                </div>
                <div class="row">
                    <label for="signupEmail" class="sub-title">이메일*</label>
                    <input th:field="*{email}" type="email" id="signupEmail" name="signupEmail" required >
                </div>
                <div class="row">
                    <label for="memberPosition" class="sub-title">포지션*</label>
                    <select th:field="*{position}" name="memberPosition" id="memberPosition" required >
                        <option value="">--- Postion ---</option>
                        <th:blcok th:each="position : ${positionList}">
                            <option th:value="${position.name()}" th:text="${position.name()}">Full Stack</option>
                        </th:blcok>
                    </select>
                </div>
                <div class="row">
                    <label for="memberSkill" class="sub-title">보유기술*</label>
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
                                <div th:each="skill : ${skillList}" class="modal-body">
                                    <div class="check-box">
                                        <label th:for="${#ids.next('skills')}" th:text="${skill.name()}" for="HTML">HTML</label>
                                        <input type="checkbox" th:field="*{skills}" th:value="${skill.name()}" id="HTML" name="HTML">
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
                    <input th:field="*{gitAddress}" type="text" id="memberGithub" name="memberGithub">
                </div>
                <div class="row">
                    <label for="memberInfo" class="sub-title">한 줄 자기소개</label>
                    <input th:field="*{intro}" type="text" id="memberInfo" name="memberInfo" maxlength="25">
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