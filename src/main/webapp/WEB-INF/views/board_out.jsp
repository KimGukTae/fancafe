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
	<h2 style="text-align: center;">김태리와 아이들 게시판</h2>
	<form action="board_search" method="post" align="center">
		<select name="category">
			<option value="title">제목
			<option value="id">작성자
		</select>
		<input type="text" name="search">
		<input type="submit" value="검색">
	</form>
	<table class="table table-hover table-bordered table-responsive" >
		<thead style="align:center" >
			<tr align="center">
				<th>글번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>비고</th>
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
						<a></a>
					</c:otherwise>
					</c:choose>	
					</td>
				</tr>
		</c:forEach>
		
		<tr>
    	<td colspan="5">
    		<c:if test="${paging.startpage !=1 }">
    			<a href="notice?nowpage=${paging.startpage-1}&cntperpage=${paging.cntperpage}">&lt;</a>
    		</c:if>
    		<c:forEach begin="${paging.startpage}" end="${paging.endpage}" var="p">
    			<c:choose>
    				<c:when test="${p == paging.nowpage }">
    					<b>${p}</b>
    				</c:when>
    				<c:when test="${p != paging.nowpage }">
    					<a href="notice?nowpage=${p }&cntperpage=${paging.cntperpage}">
    						${p}
    					</a>
    				</c:when>
    			</c:choose>
    		</c:forEach>
    		<c:if test="${paging.endpage != paging.lastpage }">
    			<a href="notice?nowpage=${paging.endpage+1}&cntperpage=${paging.cntperpage}">&gt;</a>
    		</c:if>
    	</td>
    </tr>
    </tbody>
	</table>
</div>
</body>
</html>