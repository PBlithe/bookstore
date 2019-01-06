<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,java.sql.*,com.team5101.test.*,com.team5101.po.*" %>
    <!DOCTYPE html>
<html>
<head>

    <title>忘记密码</title>
    <meta charset="UTF-8">
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
    <script type="text/javascript">
        function cleartt(id) {
            document.getElementById(id).value = "";
            if (id == "tpasswd" || id == "trpasswd") {
                var pv = document.getElementById(id);
                pv.type = "password";
            }
        }
        var t = document.getElementById("ttelnumber");
        if (t) {
            t.addEventListener("focus", clear, false);
        }
        function zhuce() {
            
        }
        
    </script>
</head>
<body>
    
    
    <div class="login container" tabindex="1">
        <br />
        <h1 class="text-center">诗&nbsp;云&nbsp;舍</h1>
        <h4 class="text-center" >A mind needs books as a sword needs a whetstone, if it is to keep its edge.</h4>
		<!--大脑需要书才能保持敏锐，就像剑需要磨刀石一样-->
        <br />
		<br />
        <br />
        <form action="forget_passwdAction.jsp" method="post">
        	<div class="form-group">
			<label for="question">密码提示:123456</label>
			<input type="password" class="form-control" id="question" placeholder="请输入密码" id="tpasswd" />
			</div>
	        <br />
	        <div id="zhuce container"><input type="submit" class="btn btn-primary btn-block" value="确认密码" onclick="zhuce()"/></div>
        </form>
        
        <%
        	String passwd = request.getParameter("tpasswd");
        	PqwBatisConfig myBatis = new PqwBatisConfig();
        	if(!myBatis.userConfig("root", passwd)){%>
        	    <script type="text/javascript">
    		alert("密码仍然错误，请仔细回想.");
    		 window.location.href = "forget_passwd.html";
    		</script>
        	<%}
        	
        	if(myBatis.userConfig("root", passwd)){%>
        	<script type="text/javascript">
        		alert("答案正确，密码已重置为123456");
        		 window.location.href = "index/sale_book.jsp";
        	</script>
        	<%    
        	myBatis.userModify("123456");
        	//response.sendRedirect("index/sale_book.jsp");
        	}
        %>
    </div>
</body>
</html>