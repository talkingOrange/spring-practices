<%@page import="com.poscodx.guestbook.repository.GuestbookRepository"%>
<%@page import="com.poscodx.guestbook.vo.GuestbookVo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
String password = request.getParameter("password");
String contents = request.getParameter("message");

GuestbookVo vo = new GuestbookVo();
vo.setName(name);
vo.setPassword(password);
vo.setContents(contents);

new GuestbookRepository().insert(vo);
response.sendRedirect("/guestbook01");
%>