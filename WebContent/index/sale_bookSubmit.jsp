<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
		String id = request.getParameter("xuliehao");
		String number = request.getParameter("goumaishuliang");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
			Connection con = DriverManager.getConnection(s);
			Statement staSto = con.createStatement();
			Statement staCache = con.createStatement();
			
			String sqlCache = "select * from cache";
			String sqlSto = "select * from storage";
			
			ResultSet rsSto = staSto.executeQuery(sqlSto);
			ResultSet rsCache = staCache.executeQuery(sqlCache);
			
			rsCache.next();
			
			while(rsSto.next()){
			    if(rsSto.getString(1).equals(rsCache.getString(1))){
					Statement updateSto = con.createStatement();
					String sqlupdateSto = "update storage set storage_number = "+(rsSto.getInt(2)- rsCache.getInt(6))+",sale_number = "
			    +(rsSto.getInt(4)+rsCache.getInt(6))+" where id = "+rsSto.getString(1);
					int row = updateSto.executeUpdate(sqlupdateSto);
					if(rsCache.next()==false){
					    break;
					}
			    }
			    
			}
			String delCache = "delete from cache";
			int del = staCache.executeUpdate(delCache);
			
			response.sendRedirect("sale_book.jsp");
			return;
		}catch(Exception e){
			e.printStackTrace();
		}
%>
    
    