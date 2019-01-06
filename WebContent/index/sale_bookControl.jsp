<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   
<%
		String id = request.getParameter("xuliehao");
		String number = request.getParameter("goumaishuliang");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
			Connection con = DriverManager.getConnection(s);
			Statement staBook = con.createStatement();
			Statement staCache = con.createStatement();
			Statement staBookq = con.createStatement();
			Statement sss = con.createStatement();
			
			String sqlBook = "select * from book where id = "+id;
			
			String sqlBookq = "select * from cache where id = "+id;
			
			ResultSet rs = staBookq.executeQuery(sqlBookq);
			
			if(rs.next()){
			    String str = "update cache set number = "+(rs.getInt(6)+Integer.parseInt(number))+" where id = "+id;
			    int rrr = sss.executeUpdate(str);
			    response.sendRedirect("sale_bookAction.jsp");  
			    return;
			}
			
			ResultSet rsBook = staBook.executeQuery(sqlBook);
			rsBook.next();
			
			String sqlCache = "insert into cache values("+rsBook.getInt(1)+",'"+rsBook.getString(2)+"', '"+rsBook.getString(3)+"','"+rsBook.getString(4)+"',"+rsBook.getFloat(5)+","+number+")";
			int row  = staCache.executeUpdate(sqlCache);
			
			response.sendRedirect("sale_bookAction.jsp");  
			return ;
		}catch(Exception e){
			e.printStackTrace();
		}
%>
    
    