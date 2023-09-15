<%@page import="java.util.List"%>
<%@page import="com.poscodx.guestbook.repository.GuestbookRepository"%>
<%@page import="com.poscodx.guestbook.vo.GuestbookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

List<GuestbookVo> list = new GuestbookRepository().findAll();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook01/add.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="message" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>

	<br>

	<%
	int count = list.size();
	for (GuestbookVo gvo : list) {
	%>
	<table width=510 border=1>
		<tr>
			<td><%=count--%></td>
			<td><%=gvo.getName()%></td>
			<td><%=gvo.getDate()%></td>
			<td><a href="deleteform.jsp?no=<%=gvo.getNo() %>" >삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=gvo.getContents().replaceAll("\n", "<br>")%></td>
		</tr>
	</table>
	<%
	}
	%>
</body>
</html>