<%@ page import="team.projectmanager.domain.project.Project" %>
<%@ page import="team.projectmanager.domain.project.ProjectStatus" %>
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
  <!-- Material icons -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp|Material+Symbols+Outlined" rel="stylesheet">
  <!-- CSS 파일 연결 -->
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/project_info.css">
  <!-- 공통 header 연결 -->
  <script type="text/javascript">
    $(document).ready( function() {
      $("#headers").load("/common/header.html");  // 원하는 파일 경로를 삽입
    });
    $(document).ready( function() {
      $("#footers").load("/common/footer.html");  // 원하는 파일 경로를 삽입
    });
  </script>
  <%
    Project project = (Project) request.getAttribute("project");
    boolean isAdmin = (boolean) request.getAttribute("isAdmin");
    boolean isJoin = (boolean) request.getAttribute("isJoin");
  %>
</head>
<body>
  <!-- Header -->
  <div id="headers"></div>

  <!-- Project Information -->
  <section class="project-info">
    <div class="inner">

      <div class="text-title">
        <span class="title">${project.name}</span>
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
              <c:forEach items="${project.positions}" var="position">
              <div class="role-body">
                <span class="icon material-symbols-outlined">account_circle${position}</span>
              </div>
              </c:forEach>
            </div>
          </div>

          <div class="recruit-box row box">
            <div class="title">
              <span class="icon material-symbols-outlined">group</span>
              <span class="text">참여중인 멤버</span>
            </div>
            <div class="content">
              <c:forEach items="${project.memberProjects}" var="memberProject">
              <div class="role-body">
                <span class="icon material-symbols-outlined">account_circle${memberProject.member.name}</span>
                <span class="role">${memberProject.member.position}</span>
              </div>
              </c:forEach>
            </div>
          </div>

          <form action="/memberproject/join" method="post">
            <input type="hidden" value="${projectId}" name="projectId">
            <%
              if (!isJoin && (project.getStatus() == ProjectStatus.COLLECT)){
            %>
            <input type="submit" value="참여하기" class="bton btn--reverse row box">
            <%}%>
          </form>
            <!-- Button trigger modal -->
          <%
            if (isAdmin){
          %>
          <button type="button" class="btn btn-primary bton btn--blue-reverse row box" data-toggle="modal" data-target="#exampleModalCenter">
            프로젝트 상태변경
          </button>
          <%}%>
          <!-- Modal -->
          <form action="/projects/edit/status" method="post">
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
                      <c:forEach items="${statusList}" var="status">
                      <label for="${status}">${status}</label>
                      <input type="radio" id="${status}" name="projectStatus" value="${status}">
                      <input type="hidden" value="${projectId}" name="projectId">
                      </c:forEach>
                    </div>
  
                  </div>
                  <div class="modal-footer">
                    <input type="submit" value="완료" class="btn btn-primary bton btn--reverse">
                  </div>
                </div>
              </div>
            </div>
          </form>

        </div>
        <!-- Body Right -->
        <div class="body-right box">
          <div>
            <c:if test="${project.uploadFile == null}">
              <img style="width: 500px; height: 500px; margin-bottom: 20px" class="card-img-top" src="/images/inq_logo.png" alt="Card image cap" />
            </c:if>
            <c:if test="${project.uploadFile != null}">
              <img style="width: 500px; height: 500px; margin-bottom: 20px" class="card-img-top" src="/images/${project.uploadFile.storeFilename}" alt="Card image cap" />
            </c:if>
          </div>
          <div class="sub-title">
            <span class="icon material-symbols-outlined">description</span>
            <div class="title">프로젝트 설명</div>
          </div>
          <div class="sub-body">
            <div class="font-style">
              <span class="state-text">프로젝트 생성자</span>
              <span class="project-constructor">${admin.name}</span>
            </div>
            <div class="font-style">
              <span class="state-text">프로젝트 상태</span>
              <span class="project-state">${project.status}</span>
            </div>
            <div class="font-style">
              <span class="state-text">모집마감 기간</span>
              <span class="recurit-term">~ ${project.period}</span>
            </div>
            <div class="font-style">
              <span class="state-text">프로젝트 기간</span>
              <span class="project-term">${project.startDate} ~ ${project.endDate}</span>
            </div>
            <hr style="margin: 60px 0;">
            <div class="project-content">
              ${project.introduction}
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
