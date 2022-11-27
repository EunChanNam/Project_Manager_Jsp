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
  <link rel="icon" href="images/inq_logo.png">
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
  <link rel="stylesheet" href="css/common.css">
  <link rel="stylesheet" href="css/project_home.css">
  <!-- JS 파일 연결 -->
  <script defer src="js/project_home.js"></script>
  <script type="text/javascript">
    $(document).ready( function() {
      $("#headers").load("common/header.html");  // 원하는 파일 경로를 삽입
    });
    $(document).ready( function() {
      $("#footers").load("common/footer.html");  // 원하는 파일 경로를 삽입
    });
  </script>
</head>
<body>
  <!-- Header -->
  <header>
    <div id="headers"></div>
  </header>
  <section class="search-bar">
    <form <%--th:action--%> action="/projects" method="get" <%--th:object="${search}"--%>>
      <div class="search-radio">
        <div class="inner">

          <div class="radio-box">
            <input <%--th:value="COLLECT" th:name="status"--%> type="radio" id="recruitment" name="status" value="COLLECT">
            <label for="recruitment" class="bton underline">모집중</label>
          </div>

          <div class="radio-box">
            <input <%--th:value="ING" th:name="status"--%> type="radio" id="progress" name="status" value="ING">
            <label for="progress" class="bton underline">진행중</label>
          </div>

          <div class="radio-box">
            <input <%--th:value="FIN" th:name="status"--%> type="radio" id="complete" name="status" value="FIN">
            <label for="complete" class="bton underline">완료</label>
          </div>

          <div class="search">
            <span class="icon material-symbols-outlined">search</span>
            <input <%--th:field="*{name}"--%> placeholder="프로젝트명으로 검색" type="text" name="name" id="search-text">
            <input type="submit" class="bton btn--reverse" value="검색">
          </div>

        </div>
      </div>
    </form>
    <a <%--th:href="@{/projects/new}"--%> href="#" class="bton btn--reverse posting" onclick="location.href='/project/new'">프로젝트 등록</a>
  </section>
  <!-- Project Bundle-->
  <section class="project-bundle">
    <div class="inner">

      <div class="card-list" <%--th:each="project : ${projects}"--%>>
        <c:forEach items="${projects}" var="project">
        <div class="card">
          <img class="card-img-top" src="images/inq_logo.png" alt="Card image cap" />
          <div class="card-body">
            <a href="/projects/${project.id}" <%--th:href="@{/projects/{projectId}(projectId = ${project.id})}"--%>><div class="card-text card-title" <%--th:text="${project.name}"--%>>${project.name}</div></a>
            <div class="card-text">
              <div class="card-info">
                <div class="info-left">
                  <div class="info-date">
                    모집기간
                    <span class="recruit-date" <%--th:text="'~' + ${project.period}"--%>>${project.startDate} ~ ${project.endDate}</span>
                  </div>
                </div>
                <div class="info-right">
                  <div class="info-member">
                    <span class="symbol material-icons">person</span>
                    <span class="member-personnel" <%--th:text="${project.memberProjects.size()}"--%>>
                      ${project.memberProjects.size()}
                    </span>
                  </div>
                  <div <%--th:if="${project.status == T(team.projectmanager.domain.project.ProjectStatus).ING}"--%> class="info-progress execution">${project.status}</div>
<%--                  <div &lt;%&ndash;th:if="${project.status == T(team.projectmanager.domain.project.ProjectStatus).COLLECT}"&ndash;%&gt; class="info-progress recruit">모집중</div>--%>
<%--                  <div &lt;%&ndash;th:if="${project.status == T(team.projectmanager.domain.project.ProjectStatus).FIN}"&ndash;%&gt; class="info-progress complete">완료</div>--%>
                </div>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <div id="footers"></div>

</body>
</html>
