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
  <!-- CSS 파일 연결 -->
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/login.css">
  <!-- 공통 header 연결 -->
  <script type="text/javascript">
    $(document).ready( function() {
      $("#headers").load("/common/header_non.html");  // 원하는 파일 경로를 삽입
    });
    $(document).ready( function() {
      $("#footers").load("../common/footer.html");  // 원하는 파일 경로를 삽입
    });
  </script>
<!--  에러 클래스 추가-->
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

  <!-- Login -->
  <section class="login">
    <div class="inner">

      <div class="text-title">
        <span class="title">로그인</span>
      </div>
      <form <%--th:action method="post" th:object="${loginForm}"--%> action="/login" method="post">
      <div class="text-body">
        <div class="row">
          <label for="loginId" class="sub-title">아이디</label>
          <input <%--th:field="*{loginId}"--%> type="text" id="loginId" name="loginId" required
                minlength="4" maxlength="15" <%--th:errorclass="field-error"--%>>
<%--          <div th:errors="*{loginId}"></div>--%>
        </div>
        <div class="row">
          <label for="loginPw" class="sub-title">비밀번호</label>
          <input <%--th:field="*{pw}" th:errorclass="field-error"--%> type="password" id="loginPw" name="pw" minlength="8" required>
<%--          <div th:errors="*{pw}"></div>--%>
        </div>

<!--        글로벌 오류-->
<%--        <div th:if="${#fields.hasGlobalErrors()}">--%>
<%--          <p class="field-error" th:each="err : ${#fields.globalErrors()}"--%>
<%--             th:text="${err}">글로벌 오류 메시지</p>--%>
<%--        </div>--%>

        <div class="find-member">
          <a href="javascript:void(0)" class="find-account">아이디 찾기</a>
          <a href="javascript:void(0)" class="find-account">비밀번호 찾기</a>
        </div>
        <div class="btn-group">
          <div class="btn-row">
            <input class="bton btn--reverse" type="submit" value="로그인하기">
          </div>

          <div class="btn-row">
            <a class="btn_signup" <%--th:href="@{/members/join}"--%> href="/members/join">
              <input class="bton btn--blue" type="button" value="회원 가입하기">
            </a>
            <!-- 회원가입 페이지 링크 연결하기 -->
          </div>
        </div>
      </div>
      </form>

    </div>
  </section>
  <!-- Footer -->
  <div id="footers"></div>
</body>
</html>