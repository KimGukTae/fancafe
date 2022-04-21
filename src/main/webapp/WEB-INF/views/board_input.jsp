<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="board_inputsave" method="post" enctype="multipart/form-data">
	<table border="1" width="300" align="center">
		<tr>
			<th>작성자</th>
			<c:forEach items="${list}" var="dto">
				<td>
					<input type="hidden" name="id" value="${dto.id}">
					<input type="text" name="name" value="${dto.name}" readonly="readonly">
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
					<textarea rows="10" cols="20" name="content">
				</textarea>
		</tr>
		<tr>
			<th>사진</th>
			<td>
				 <input type="file" name="picture" value="업로드">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글등록">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
	
</form>
</body>
</html>