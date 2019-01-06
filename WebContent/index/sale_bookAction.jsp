<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>购买界面</title>
		<link rel="stylesheet" href="../css/bootstrap.min.css" />
		<script src="../jquery-3.3.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
		<script type="text/javascript">
			function mydelete(){
				var number = document.getElementById("goumaishuliang").value;
				if(number<=0){
					document.getElementById("goumaishuliang").value = 0;
					alert("购买数量不能小于0!!!");
					return;
				}
				document.getElementById("goumaishuliang").value = number -1;
			}
			
			function myadd(){
				var number = document.getElementById("goumaishuliang").value;
				document.getElementById("goumaishuliang").value = Number(number) +1;
				//console.log(number);
			}
			function mycancel(){
				document.getElementById("xuliehao").value = "";
				document.getElementById("goumaishuliang").value = 0
			}
			
			function addToStorage(){
				//mycancel();
			}
			
			function myisNaN(){
				var id = document.getElementById("xuliehao").value;
				if(isNaN(id)){
					alert("序列号不是数值!!!");
					document.getElementById("xuliehao").value = "";
				}
			}
			
			function mydel(){
				window.location.href="sale_bookDel.jsp";
			}
		</script>
	</head>
	<body>
		<div class="container">
			<nav class="navbar navbar-default" role="navigation"> 
				<div class="navbar-header">
					<a class="navbar-brand"><strong>购买界面</strong></a>
				</div>
			</nav>
			
			<div class="row">
				<div class="col-md-3 col-sm-3">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="../saletable/table1.jsp">销售报表</a></li>
						<li><a href="../storage/books_storage1.jsp">诗云仓库</a></li>
						<li class="active"><a href="sale_book.jsp">购买界面</a></li>
						<li><a href="add_books.html">进货界面</a></li>
					</ul>
				</div>
				
				<div class="col-md-9 col-sm-9">
					<h2>购买书籍</h2>
					<form class="form-inline" role="form" action="sale_bookControl.jsp" method="post">
						<div class="row">
							<div class="col-md-4 col-sm-4">
								<div class="form-group">
									<label for="xuliehao">序列号:</label>
									<input type="text" class="form-control" 
									id="xuliehao" name="xuliehao"  onblur="myisNaN()"/>
								</div>
							</div>
							<div class="col-md-4 col-sm-4">
								<div class="input-group">
									<span class="input-group-btn">
										<button type="button" class="btn btn-default" id="del" onclick="mydelete()" >
											<span class="glyphicon glyphicon-minus"></span>
										</button>
									</span>
									
										<input type="text" class="form-control text-center"
										id="goumaishuliang"  name="goumaishuliang" value="1"/>
									
									<span class="input-group-btn">
										<button type="button" class="btn btn-default" id="add" onclick="myadd()" >
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>
							</div>
							<div class="col-md-4 text-center col-sm-4">
								<button type="submit" class="btn btn-primary" onclick="addToStorage()">添加</button>
								<button type="button" class="btn btn-primary" onclick="mycancel()">撤销</button>
							</div>
						</div>
					</form>
					<br/>
						<table class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>序列号</th>
									<th>种类</th>
									<th>书籍名称</th>
									<th>作者</th>
									<th>价格</th>
									<th>数量</th>
								</tr>
							</thead>
							<tbody>
									<%
										/*String id = request.getParameter("xuliehao");
										String number = request.getParameter("goumaishuliang");*/
										
										try{
											Class.forName("com.mysql.jdbc.Driver");
											String s = "jdbc:mysql://localhost:3306/bookstore?user=root&password=161723ii";
											Connection con = DriverManager.getConnection(s);
											Statement sta = con.createStatement();
											//Statement staCache = con.createStatement();
											
											String sqlCache = "select * from cache";
											/*String sqlBook = "select * from book where id = "+id;
											ResultSet rsBook = sta.executeQuery(sqlBook);
											rsBook.next();
											String updateCache = "insert into cache values"
												+"('"+rsBook.getString(1)+"','"+rsBook.getString(2)+"','"+rsBook.getString(3)+"','"+rsBook.getString(4)+"',"+rsBook.getString(5)+","+number+")";
											int row = staCache.executeUpdate(updateCache);*/
											ResultSet rsCache=sta.executeQuery(sqlCache);
											
											while(rsCache.next()){%>
											    <tr>
											    	<td><%=rsCache.getString(1) %></td>
											    	<td><%=rsCache.getString(2) %></td>
											    	<td><%=rsCache.getString(3) %></td>
											    	<td><%=rsCache.getString(4) %></td>
											    	<td><%=rsCache.getString(5) %></td>
											    	<td><%=rsCache.getString(6) %></td>
											    </tr>
											<%}
												//out.print(rs.getString(2)+rs.getString("user_ps")+"<hr />");	
											//con.close();
										}catch(Exception e){
											e.printStackTrace();
										}
									%>
							</tbody>
						</table>
							<form action="sale_bookSubmit.jsp" method="post" class="form-inline text-right">
							<button class="btn btn-primary" type="submit">确定</button>
							<button class="btn btn-primary" type="submit" onclick="mydel()">取消</button>
							</form>
						
				</div>
			</div>
			
		</div>
	</body>
</html>
    
    