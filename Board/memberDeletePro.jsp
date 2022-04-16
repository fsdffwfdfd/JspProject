<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	String sql = "delete from member where id='"+id+"';";
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	
	stmt.close();
	con.close();
	
	response.sendRedirect("memberList.jsp");
%>