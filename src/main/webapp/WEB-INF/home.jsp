<%@ page import="team.projectmanager.domain.memberproject.MemberProject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/home.css">
    <!-- JS 파일 -->
    <script defer src="js/home.js"></script>
    <!-- Material icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp|Material+Symbols+Outlined">
    <!-- 공통 header 연결 -->
    <script type="text/javascript">
        $(document).ready( function() {
            $("#headers").load("common/header.html");  // 원하는 파일 경로를 삽입
        });
        $(document).ready( function() {
            $("#footers").load("common/footer.html");  // 원하는 파일 경로를 삽입
        });
    </script>
    <%
        MemberProject ingMP = (MemberProject) request.getAttribute("ingMP");
        MemberProject finMP = (MemberProject) request.getAttribute("finMP");
        MemberProject collectMP = (MemberProject) request.getAttribute("collectMP");
    %>
</head>
<body>
<!-- Header -->
<div id="headers"></div>

<!-- Member Information -->
<section class="member-info">
    <div class="inner">

        <div class="text-title">
            <span class="title">${member.name}</span>
        </div>
        <div class="text-body">
            <div class="row">
                <div class="member-detail detail-second">
                    <div class="detail-title">깃허브</div>
                    <button class="bton btn--yellow-reverse " type="button" style="background-color: var(--inq-yellow);">
                        <a style="color: black" href="${member.gitAddress}" class="detail-content a-font">My GitHub</a>
                    </button>
                </div>
                <div class="member-detail">
                    <div class="detail-title">한 줄 소개</div>
                    <span class="detail-content" style="color: var(--inq-white);">${member.intro}</span>
                </div>
            </div>
            <div class="row">
                <div class="member-skill">
                    <div class="skill-title">보유 스킬</div>
                    <c:forEach items="${member.skills}" var="skill">
                        <span class="skill-content">${skill}</span>
                    </c:forEach>
                </div>
            </div>
            <div class="row">
                <div class="member-project">
                    <div class="project-title">참여한 프로젝트</div>
                    <a href="javascript:void(0)">
                        <div class="project-content">
                            <span class="project-progress">진행중</span>
                            <%
                                if (ingMP == null) {
                            %>
                            <span class="project-name" style="color: var(--inq-white);">진행중인 프로젝트가 없습니다.</span>
                            <%
                                } else
                            %>
                            <span class="project-name" style="color: var(--inq-white);">${ingMP.project.name}</span>
                        </div>
                    </a>
                    <a href="javascript:void(0)">
                        <div class="project-content">
                            <span class="project-progress">완료</span>
                            <%
                                if (finMP == null) {
                            %>
                            <span class="project-name" style="color: var(--inq-white);">완료한 프로젝트가 없습니다.</span>
                            <%
                            } else
                            %>
                            <span class="project-name" style="color: var(--inq-white);">${finMP.project.name}</span>
                        </div>
                    </a>
                    <a href="javascript:void(0)">
                        <div class="project-content">
                            <span class="project-progress">모집중</span>
                            <%
                                if (collectMP == null) {
                            %>
                            <span class="project-name" style="color: var(--inq-white);">모집중인 프로젝트가 없습니다.</span>
                            <%
                            } else
                            %>
                            <span class="project-name" style="color: var(--inq-white);">${collectMP.project.name}</span>
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>
    <div class="custom-shape-divider-bottom-1652199240">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M985.66,92.83C906.67,72,823.78,31,743.84,14.19c-82.26-17.34-168.06-16.33-250.45.39-57.84,11.73-114,31.07-172,41.86A600.21,600.21,0,0,1,0,27.35V120H1200V95.8C1132.19,118.92,1055.71,111.31,985.66,92.83Z" class="shape-fill"></path>
        </svg>
    </div>

</section>

<!-- Project -->
<section class="project">
    <div class="inner">

        <div class="text-title">
            <a href="/projects"><span onClick="location.href='project/project_info.jsp'" class="title title-cursor underline line" title="프로젝트 페이지로 이동">프로젝트</span></a>
        </div>
        <div class="swiper">
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
            <div class="card-list swiper-wrapper">

                <c:forEach items="${projects}" var="project">
                <div class="card swiper-slide">
                    <c:if test="${project.uploadFile == null}">
                        <img class="card-img-top" src="images/inq_logo.png" alt="Card image cap" />
                    </c:if>
                    <c:if test="${project.uploadFile != null}">
                        <img class="card-img-top" src="images/${project.uploadFile.storeFilename}" alt="Card image cap" />
                    </c:if>
                    <div class="card-body">
                        <a href="/projects/${project.id}"><div class="card-text card-title">${project.name}</div></a>
                        <div class="card-text">
                            <div class="card-info">
                                <div class="info-left">
                                    <div class="info-date">
                                        모집기간
                                        <span class="recruit-date">~ ${project.period}</span>
                                    </div>
                                </div>
                                <div class="info-right">
                                    <div class="info-member">
                                        <span class="symbol material-icons">person</span>
                                        <span class="member-personnel">${project.memberProjects.size()}</span>
                                    </div>
                                    <div class="info-progress execution">${project.status}</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- Footer -->
<div id="footers"></div>
</body>
</html>