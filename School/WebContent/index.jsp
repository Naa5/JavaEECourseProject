<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	import="edu.tongji.sse.j2ee.bean.*"
%>
<%	// This part is for Test
	User test = new User(0,false,true,"测试员");
	session.setAttribute("user", test);
%>
<%
	User user = (User)session.getAttribute("user");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>山寨教务管理系统</title>
<link href="index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="jquery-1.11.1.js"></script>
<script>
function sideControl() {
	if (<%=((User)session.getAttribute("user")).isStude()%>)
		$(".teacher").remove();
	else
		$(".student").remove();
	if (<%=((User)session.getAttribute("user")).isAdmin()%>)
		$(".normal").remove();
	else
		$(".admin").remove();
}
</script>
</head>

<body>
<div id="head">
	<div id="logo" class="clickable">
    	<span id="title">山寨教务管理系统</span>
    </div>
    <div id="using" style="display:none">
    	<div id="infor">
    		<span id="uID"><%=user.getuID() %></span>
    		<span id="uName"><%=user.getName() %></span>
    		<span id="uType"><%=user.isAdmin()?"管理员":(user.isStude()?"学生":"教师") %></span>
    	</div>
    	<div id="btnLogout" class="clickable btn">
    		<img src="img/sign_logout.png" width="20" height="20" title="注销" />
    	</div>
    </div>
</div>

<div id="login">
	<div id="input" style="display: none">
    	<div>
        	<span>ID:</span>
            <input type="text" name="uID" />
        </div>
        <div>
        	<span>密码:</span>
            <input type="password" name="uPass" />
        </div>
    </div>
    <div id="btnLogin">
    	<span class="clickable">登陆</span>
        <div class="btn clickable">
        	<img src="img/sign_login.png" width="20" height="20" title="登录" />
   		</div>
    </div>
</div>
<script>
	$("#btnLogin").mouseenter(function(e) {
        $("#input").slideDown();
    });
	$("body").mousemove(function(e) {
		if (!(e.pageY<110 && e.pageX>$(window).width()-240)) {
        	$("#input").slideUp();
		}
    });
</script>

<script>
	$(".clickable").mouseover(function(e) {
		$(this).css("background-color","#0066CC");
	});
	$(".clickable").mouseout(function(e) {
		$(this).css("background-color","#0066FF");
	});
	$(".clickable").mousedown(function(e) {
		$(this).css("background-color","#00337F");
	});
	$(".clickable").mouseup(function(e) {
		$(this).css("background-color","#0066CC");
	});
</script>

<div id="side">
</div>

<div id="main">
</div>

<script>
$("#main").load("pages/notice.jsp");
if (<%=(user!=null) %>) {
	$("#side").load("side.jsp",null,sideControl);
}
</script>

</body>

</html>