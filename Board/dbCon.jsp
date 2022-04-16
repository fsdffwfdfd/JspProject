<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
	/*
		DB 테이블 생성
		
		------sql-----------
		CREATE TABLE member(
				id VARCHAR(30),
				pw VARCHAR(30),
				NAME VARCHAR(30)
			);
			CREATE TABLE board(
				title VARCHAR(30),
				name VARCHAR(20),
				content VARCHAR(200),
				idx VARCHAR(200)
			);
			
	*/

	//1. DB 연동 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");
		
		//2. 연결 객체 생성
		String url = "jdbc:mariadb://localhost:3333/mindb";
		String user = "sumin";
		String pwd= "1111";
		Connection con = DriverManager.getConnection(url, user, pwd);
		
%>