<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form action="loginsave" method="post">
	<table border="1" width="70%" align="center">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
		</tr>
		<tr>
			<td>
				<input type="text" name="id">
			</td>
			<td>
				<input type="text" name="pw">
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