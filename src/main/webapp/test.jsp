<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
		function checkName(){
			var name = $("#test").val();
			var xmlHttp;
 
			 try
			    {
			   // Firefox, Opera 8.0+, Safari
			    xmlHttp=new XMLHttpRequest();
			    }
			 catch (e)
			    {
			
			  // Internet Explorer
			   try
			      {
			      xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			   catch (e)
			      {
			
			      try
			         {
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			         }
			      catch (e)
			         {
			         alert("您的浏览器不支持AJAX！");
			         return false;
			         }
			      }
			    }

			
			xmlHttp.open("get", "${pageContext.request.contextPath }/user/checkUserName.action?name="+name);
			xmlHttp.send();
			xmlHttp.onreadystatechange=function(){
				if(xmlHttp.readyState==4&&xmlHttp.status==200){
					var data = xmlHttp.responseText;
					alert(data);
				}
			};
			
		}
		
	</script>
	

  </head>
  
  <body>
    用户名：<input type="text" onblur="checkName()" id="test"/><span id="message"></span>
  </body>
</html>
