
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>


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

<body>
<div class="container">
	<h2 style="text-align: center;">김태리와 아이틀 회원목록</h2>
	<table class="table table-hover table-bordered table-responsive" align="center">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>삭제 / 수정</th>
			</tr>
		</thead>
		<c:forEach items="${list}" var="dto">
			<tbody>
				<tr>
					<td>${dto.num}</td>
					<td>${dto.id}</td>
					<td>
						<c:forEach begin="1" end="${dto.indent}">
						<%= "→" %>
						</c:forEach>
						<a href="detail?num=${dto.num }">
						${dto.title}
						</a>
					</td>
					<td>${dto.writeday }</td>
					<td>${dto.readcnt }</td>
					<td colspan="2">
					<c:choose>
					<c:when test="${dto.log==1}">
						<a href="delete?num=${dto.num}">삭제</a>
						<a href="modifya?num=${dto.num}&id=${dto.id}">수정</a>
					</c:when>
					<c:otherwise>
						<a>안보임</a>
					</c:otherwise>
					</c:choose>	
					</td>
				</tr>	
			</tbody>
		</c:forEach>
	</table>
</div>
</body>
</html>