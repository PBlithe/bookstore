<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*,java.sql.*,com.team5101.test.*,com.team5101.po.*" %>
    <!DOCTYPE html>
<html>
<head>

    <title>登陆</title>
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
        #denglu{
            text-align:center;
            width:470px;
            height:45px;
        }
    </style>
    <script type="text/javascript">
        function cleartt(id) {
            document.getElementById(id).value = "";
            if (id == "tpasswd") {
                var pv = document.getElementById("tpasswd");
                pv.type = "password";
            }
        }
        var t = document.getElementById("ttelnumber");
        if (t) {
            t.addEventListener("focus", clear, false);
        }
        function submitss() {
            var treg = /^1[358][0-9]{9}$/;
            var preg = /^\w{6,12}$/;

            var tv = document.getElementById("ttelnumber").value;
            var pv = document.getElementById("tpasswd").value;

            if (tv=="") {
                alert("账号不能为空!!!");
                document.getElementById("ttelnumber").value = "";
                return;
            }
            if (!preg.test(pv)) {
                alert("密码格式不正确!长度必须在6-12位之间!!!");
                document.getElementById("tpasswd").value = "";
                return;
            }
            
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
        <form action="loginAction.jsp" method="post">
        	<div class="form-group" ><input type="text" class="form-control"  onfocus="cleartt('ttelnumber');"  placeholder="账号" style="width:440px;" id="ttelnumber"  name="ttelnumber"/></div>
			<br />
	        <div class="form-group"><input type="text" class="form-control" onfocus="cleartt('tpasswd');"  placeholder="请输入密码" style="width:440px; " id="tpasswd" name="tpasswd"/></div>
	        <br />
	        <br />
	        <div id="denglu container"><input type="submit" class="btn btn-primary btn-block" value="登陆" onclick="submitss()"/></div>
	        <p align="right" ><a href="passwd_modify.html" style="color:cornflowerblue;text-decoration:none;">修改密码</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>
	         <p align="right" ><a href="forget_passwd.html" style="color:cornflowerblue;text-decoration:none;">忘记密码</a>&nbsp;&nbsp;&nbsp;&nbsp;</p>
        </form>
    </div>
</body>
</html>