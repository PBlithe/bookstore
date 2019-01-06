<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
		    try{
			Class.forName("com.mysql.jdbc.Driver");
			String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
			Connection con = DriverManager.getConnection(s);
			Statement sta = con.createStatement();
			
			String delCache = "delete from cache";
			int del = sta.executeUpdate(delCache);
			
			response.sendRedirect("sale_book.jsp");
			return;
		}catch(Exception e){
			e.printStackTrace();
		}
    %>