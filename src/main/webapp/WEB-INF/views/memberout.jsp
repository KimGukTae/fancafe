<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
th{
	text-align: center;
}
</style>
<title>Insert title here</title>
</head>
<body>
<h2 style="text-align: center;">김태리 와 아이들 회원목록</h2>
<table class="table table-hover">
	<tr>
		<td colspan="7" align="right">
			<a href="index">메인홈페이지</a>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>이메일</th>
		<th>주소</th>
		<th>가입일자</th>
	</tr>
	<c:forEach items="${list}" var="dto">
	<tr>
		<td>${dto.id }</td>
		<td>${dto.pw}</td>
		<td>${dto.name}</td>
		<td>${dto.tel}</td>
		<td>${dto.email}</td>
		<td>${dto.address}</td>
		<td>${dto.day}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>