<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="text-align: center;">댓글달기</h2>
<form action="reply" method="post">
	<c:forEach items="${list}" var="dto">
		<input type="hidden" name="num" value="${dto.num}">
		<input type="hidden" name="groups" value="${dto.groups}">
		<input type="hidden" name="step" value="${dto.step}">
		<input type="hidden" name="indent" value="${dto.indent}">	
	</c:forEach>
	
	<table border="1" width="400" align="center">
		<tr>
			<th>작성자</th>
			<c:forEach items="${list}" var="dto">
			<td>
				<input type="text" name="id" value="${dto.id}"readonly="readonly">
			</td>
			</c:forEach>
		</tr>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="20"></textarea>
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="댓글등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>