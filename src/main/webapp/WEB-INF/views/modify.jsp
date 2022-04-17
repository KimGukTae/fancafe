<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,tr{
	text-align: center;
}
th{
	background-color: lightblue;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center;">자료수정</h1>
<form action="modifysave" align="center" method="post">
	<table border="1" width="300" align="center">
		<tr>
			<th>글번호</th>
			<c:forEach items="${list }" var="dto">
				<td>
					<input type="text" name="num" value="${dto.num }" readonly="readonly">
				</td>	
				</c:forEach>
		</tr>
		<tr>
			<th>작성자</th>
			<c:forEach items="${list }" var="dto">
				<td>
					<input type="text" name="id" value="${dto.id}" readonly="readonly">
				</td>
			</c:forEach>	
		</tr>
		<tr>
			<th>내용</th>
				<td>
					<textarea rows="10" cols="20" name="content"></textarea>
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="저장">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</body>
</html>