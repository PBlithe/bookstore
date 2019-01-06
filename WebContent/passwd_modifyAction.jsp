<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,java.sql.*,com.team5101.test.*,com.team5101.po.*,javax.swing.JOptionPane" %>
    <!DOCTYPE html>
<html>
<head>

    <title>修改密码</title>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<script src="jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        html{
            background:url(graphic/background.jpg) no-repeat top center fixed;
            background-size:cover;
        }
        .login{
            width:470px;
            height:550px;
            background-color:white;
            top:50%;
            left:50%;
            position:absolute;
            transform:translate(-50%,-50%);
        }
        #telnumber{
            text-align:center;
            width:470px;
            height:45px;
            
        }
        #passwd{
            text-align:center;
            width:470px;
            height:40px;
            
        }
        #rpasswd{
            text-align:center;
            width:470px;
            height:40px;
        }
        #zhuce{
            text-align:center;
            width:470px;
            height:45px;
        }
    </style>
</head>
<body>
    
    <div class="login container" tabindex="1">
        <br />
        <h1 class="text-center">诗&nbsp;云&nbsp;舍</h1>
        <h4 class="text-center" >A mind needs books as a sword needs a whetstone, if it is to keep its edge.</h4>
		<!--大脑需要书才能保持敏锐，就像剑需要磨刀石一样-->
        <br />
        <br />
        	<div id="telnumber" class="form-group"><input type="password"  class="form-control" onfocus="cleartt('ttelnumber');"  placeholder="初始密码" style="width:440px;" id="ttelnumber"  name="ttelnumber"/></div>
	        <div id="passwd" class="form-group"><input type="text" class="form-control" onfocus="cleartt('tpasswd');"  placeholder="请输入密码" style="width:440px; " id="tpasswd" name="tpasswd"/></div>
	        <div id="rpasswd" class="form-group"><input type="text" class="form-control" onfocus="cleartt('trpasswd');"  placeholder="请再次输入" style="width:440px; " id="trpasswd" name="trpasswd"/></div>
	        <br />
	        <div id="zhuce container"><input type="button" class="btn btn-primary btn-block" value="修改密码" onclick="zhuce()"/></div>
        <%
        	String primary = request.getParameter("ttelnumber");
        	String passwd1 = request.getParameter("tpasswd");
        	String passwd2 = request.getParameter("trpasswd");
        	PqwBatisConfig myBatis = new PqwBatisConfig();
        	out.print(primary);
        	out.print(passwd1);
        	if(!myBatis.userConfig("root", primary)){%>
        	    <script type='text/javascript'>
				alert("初始密码不正确!!!");
				window.location='passwd_modify.html';
				 </script>
        	<%return;}
        	if(myBatis.userModify(passwd1)&&passwd1.equals(passwd2)){
        	    out.print("<script language='javascript'>alert('密码修改成功!!!');</script>"); 
        	    response.sendRedirect("index/sale_book.jsp");
        	}
        %>
    </div>
</body>
</html>