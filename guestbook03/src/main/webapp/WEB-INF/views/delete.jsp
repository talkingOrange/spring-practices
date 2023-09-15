<%@page import="com.poscodx.guestbook.repository.GuestbookRepository"%>
<%@page import="com.poscodx.guestbook.vo.GuestbookVo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String password = request.getParameter("password");

GuestbookVo vo = new GuestbookVo();
vo.setPassword(password);

new GuestbookRepository().deleteByPassword(password);
response.sendRedirect("/guestbook01");
%>