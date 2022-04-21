<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,td{
	text-align: center;	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2 style="text-align: center;">글 보기</h2>
<form action="replyview" method="post">
	<c:forEach items="${list }" var="dto">
		<table border="1" width="600" align="center">
			<tr>
				<th>글번호</th>
				<td>
					<input type="hidden" name="num" value="${dto.num }" readonly>${dto.num} 
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="hidden" name="id" value="${dto.id }" readonly>${dto.id} 
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea rows="6" cols="20">
						${dto.content }
					</textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td>
					<img src="${pageContext.request.contextPath }/image/${dto.picture}" width="300" height="300">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="댓글달기">
					<input type="button" value="메인" onclick="location.href='index'">
				</td>
			</tr>
		</table>
	</c:forEach>

</form>
</body>
</html>