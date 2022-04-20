<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!--  -->
<header style="text-align: center;">
	<table align="center">
		<tr>
			<td>
				<h1>김태리 와 아이들</h1>
			</td>
		</tr>
		<tr>
			<td style="width: 900px; text-align: right;">
				<c:choose>
				
					<c:when test="${islogon==true && member != null}">
						환영합니다${member.name}!! &emsp;
						<a href="logout">로그아웃</a> 
					</c:when>
					<c:otherwise>
						<a href="login">로그인</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>
</header>
<!--  -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">김태리</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="inputsave">회원등록</a></li>
          <li><a href="outsave">회원목록</a></li>
        </ul>
      </li>
      <!--  -->
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판관리 <span class="caret"></span></a>
        <ul class="dropdown-menu">
      		  <c:choose>
				<c:when test="${islogon==true && member != null}">
					<li><a href="boardin?id=${member.id}&name=${member.name}">글 등록</a></li>
					<li><a href="boardout?id=${member.id}">글 목록</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="boardin">글 등록</a></li>
						<li><a href="boardout">글 목록</a></li>
					</c:otherwise>
			</c:choose>
        </ul>
      </li>
      <!--  -->
      <!--  -->
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">작품목록 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="drama">드라마</a></li>
          <li><a href="movie">영화</a></li>
          <li><a href="photo">사진</a></li>
        </ul>
      </li>
      <!--  -->
    </ul>
  </div>
</nav>
</html>