<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,com.team5101.po.Page"%>
    <!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>销售报表</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script src="../jquery-3.3.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script type="text/javascript">
		</script>
	</head>
	<body>
		<div class="container">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					<a class="navbar-brand"><strong>销售报表</strong></a>
				</div>
			</nav>
			
			<div class="row">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked">
						<li class="active"><a href="table1.jsp">销售报表</a></li>
						<li><a href="../storage/books_storage1.jsp">诗云仓库</a></li>
						<li><a href="../index/sale_book.jsp">购买界面</a></li>
						<li><a href="../index/add_books.html">进货界面</a></li>
					</ul>
				</div>
				
				<div class="col-md-9">
					<h2>记录</h2>
					<form class="form-inline" role="form" action="books_storageAction.jsp" method="post">
						<br/>
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>序号</th>
									<th>书名</th>
									<th>库存</th>
									<th>进货数量</th>
									<th>销售数量</th>
								</tr>
							</thead>
							<tbody>
									<%
										int count=0; 
										String sql = "select count(*) from book where 1=1";
										int totalPage=0;
										int nowPage =0;
										int limit = 15;
										
										try{
											Class.forName("com.mysql.jdbc.Driver");
											String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
											Connection con = DriverManager.getConnection(s);
											Statement staBook = con.createStatement();
											ResultSet rs = staBook.executeQuery(sql);
											while(rs.next()){
											    count = rs.getInt(1);
											}
											Page p = new Page();
											p.setPage(5);
											nowPage = p.getPage();
											
											if(count%limit==0){
											    totalPage = count/limit;
											}else{
											    totalPage = count/limit + 1;
											}
											
											String sqlQuery = "select book.id,book.bookname as 书名,storage_number as 库存,stock_number as 进货数量,sale_number as 销售数量 from book,storage where book.id = storage.id ";
											ResultSet rsQuery = staBook.executeQuery(sqlQuery);
											rsQuery.absolute((nowPage-1)*	limit+1);

											    for(int j=0;j<limit;j++){%>
											    <tr>
											    	<td><%=rsQuery.getString(1) %></td>
											    	<td><%=rsQuery.getString(2) %></td>
											    	<td><%=rsQuery.getString(3) %></td>
											    	<td><%=rsQuery.getString(4) %></td>
											    	<td><%=rsQuery.getString(5) %></td>
											    </tr>
											   
											<% rsQuery.next();}
												//out.print(rs.getString(2)+rs.getString("user_ps")+"<hr />");	
											//con.close();
										}catch(Exception e){
											e.printStackTrace();
										}
									%>
						</tbody>
						</table>
						<div class="text-right">
							<ul class="pagination" id="pages">
							<li><a href="table<%=nowPage-1 %>.jsp">&laquo;</a></li>
							<%
								for(int i=0;i<totalPage;i++){%>
									<li><a href="table<%=i+1 %>.jsp" ><%=i+1 %></a></li>
								<%}
							%>
							  <li><a href="table<%=nowPage+1 %>.jsp">&raquo;</a></li>
							</ul>
							<script type="text/javascript">
								document.getElementById("pages").getElementsByTagName("li")[<%=nowPage%>].className='active';
							</script>
						</div>
					</form>
				</div>
			</div>
			
		</div>
	</body>
</html>
    