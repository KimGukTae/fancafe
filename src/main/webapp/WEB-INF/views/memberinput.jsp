<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h2 style="text-align: center;">김태리 와 아이들 가입</h2>
<form action="memberinputsave" method="post">
	<table border="1" width="300" align="center">
		<tr>
			<th>아이디</th>
				<td>
					<input type="text" name="id">
				</td>
		</tr>
		<tr>
			<th>비밀번호</th>
				<td>
					<input type="text" name="pw">
				</td>
		</tr>
		<tr>
			<th>이름</th>
				<td>
					<input type="text" name="name">
				</td>
		</tr>
		<tr>
			<th>전화번호</th>
				<td>
					<input type="text" name="tel">
				</td>
		</tr>
		<tr>
			<th>이메일</th>
				<td>
					<input type="text" name="email">
				</td>
		</tr>
		<tr>
			<th>주소</th>
				<td>
					<input type="text" name="address">
				</td>
		</tr>
		<tr>
			<th>가입날짜</th>
				<td>
					<input type="text" name="day">
				</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="전송">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>

</form>
</body>
</html>