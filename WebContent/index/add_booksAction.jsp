<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
   
<%
		request.setCharacterEncoding("UTF-8");
		String sid   = request.getParameter("sid");
		String type   = request.getParameter("type");
		String bookname   = request.getParameter("bookname");
		String author   = request.getParameter("author");
		String price   = request.getParameter("price");
		String stock_number   = request.getParameter("stock_number");
		
		try{
		    Class.forName("com.mysql.jdbc.Driver");
			String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
			Connection con = DriverManager.getConnection(s);
			Statement staBook = con.createStatement();
			Statement staSto = con.createStatement();
			Statement staBookq = con.createStatement();
			
			String sqlBook = "insert into book values("+sid+",'"+type+"','"+bookname+"','"+author+"','"+price+"'"+")";
			String sqlSto = "insert into storage values("+sid+","+0+","+stock_number+","+0+")";
			String sqlBookq = "select * from book where id = "+sid;
			
			ResultSet rs = staBookq.executeQuery(sqlBookq);
			
			if(rs.next()){%>
			    <script type="text/javascript">
			    	alert("此序列号存在!!!");
			    	window.location.href="add_books.html";  
				</script>
			<%return;}
			
			int book = staBook.executeUpdate(sqlBook);
			int sto = staSto.executeUpdate(sqlSto);
			
			%>
			<script type="text/javascript">
			window.location="add_books.html";  
			</script>
		<%}catch(Exception e){
			e.printStackTrace();
		}
%>
    
    