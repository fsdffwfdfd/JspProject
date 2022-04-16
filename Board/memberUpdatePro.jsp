<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbCon.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	System.out.println("id : "+id);
	System.out.println("pw : "+pw);
	System.out.println("name : "+name);
	
	String sql = "update member set NAME=?, pw=? where id=?;";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, pw);
	pstmt.setString(3, id);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	
	response.sendRedirect("memberList.jsp");
	
%>