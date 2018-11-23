<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js" /></script>
<script type="text/javascript">
	function code() {
		$("img:last").prop("src", "${pageContext.request.contextPath }/getKaptcha.action?a=" + Math.random());
	};
	$(function(){
		$("[value='注 册']").click(function(){
			location="${pageContext.request.contextPath }/regist.jsp";
	});
	});
	
</script>

</head>

<body>
	<div class="wrap">
		<!-- main begin-->
		<div class="main">
			<div class="sidebar">
				<p>
					<img src="images/img1.jpg" width="443" height="314" alt="" />
				</p>
			</div>
			<div class="sidebarg">
				<form action="${pageContext.request.contextPath }/user/login"
					method="post" >
					<div class="login">
						<dl>
							<dt class="blues">用户登陆</dt>
							<dd>
								<label for="name">用户名：</label><input type="text" class="inputh"
									name="name" value="常用邮箱" id="name" />
							</dd>
							<dd>
								<label for="password">密 码：</label><input type="password"
									name="password" class="inputh" value="密码" id="password" />
							</dd>
							<dd>
								<label class="lf" for="passwords">验证码：</label> <input
									type="text" class="inputh inputs lf" value="验证码" id="passwords"
									name="kaptcha" /> <span class="wordp lf"><img
									src="${pageContext.request.contextPath }/getKaptcha.action"
									width="96" height="27" alt="" /></span> <span class="blues lf"><a
									href="javasript:void(0)" title="" onclick="code()">看不清</a></span>
							</dd>
							<dd style="color:red">${error }</dd>
							<dd>
								<input name="" type="checkbox" id="rem_u" /> <span for="rem_u">下次自动登录</span>
							</dd>
							<dd class="buttom">
								<input name="" type="submit" value="登 录"
									class="spbg buttombg f14 lf" /> <input name="" type="button"
									value="注 册" class="spbg buttombg f14 lf" /> <span
									class="blues  lf"><a href="" title="">忘记密码?</a></span>
								<div class="cl"></div>
							</dd>

						</dl>
					</div>
				</form>
			</div>
			<div class="cl"></div>
		</div>
		<!-- main end-->

		<!-- footer begin-->
	</div>
	<!--footer end-->

	</div>
</body>
</html>

</body>
</html>
