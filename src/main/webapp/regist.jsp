<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"/></script>
<script type="text/javascript">
	$(function(){
		function code() {
			$("img:last").prop("src", "${pageContext.request.contextPath }/getKaptcha.action?a=" + Math.random());
		};
		
	});
	
	
	
	function checkLength(obj,str){
		var test = $(obj).val();
		if(test.length<6){
			$(obj).next().html(str+"要求不低于6个字符!");
			return false;
		}else{
			$(obj).next().html("");
			return true;
		}
	};
	
	function checkNull(obj,str){
		var test = $(obj).val();
		if(test==''){
			$(obj).next().html(str+"必填!");
			return false;
		}
		$(obj).next().html("");
		return true;
	}
	
	function checkForm(){
		var t1 = checkLength($(":text:first").get(0),'用户名');
		var t2 = checkLength($(":text:eq(1)").get(0),'密码');
		var t3 = checkNull($(":text:eq(2)").get(0),'身份证号');
		var t4 = checkNull($(":text:eq(3)").get(0),'电话号');
		
		if(!$(":checkbox").prop("checked")){
			alert("注册前请确认是否同意服务条款");
			return false;
		}
		if(t1&t2&t3&t4){
			return true;
		}
		return false;
	}

</script>
</head>

<body>
<div class="wrap">
  <!-- main begin-->
      <div class="zclf login logns">
        <h1  class="blue">用户注册</h1>
          <dl>
          	<form action="${pageContext.request.contextPath}/user/regist.action" method="post" onsubmit="return checkForm()">
            <dd>
              <label> <small>*</small>用户名</label>
              <input type="text" class="inputh lf" name="name" onblur="checkLength(this,'用户名')"/>
             <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>密码</label>
              <input type="text" class="inputh lf" name="password" onblur="checkLength(this,'密码')"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>身份证号</label>
              <input type="text" class="inputh lf" name="cardNum" onblur="checkNull(this,'身份证号')"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>电话</label>
              <input type="text" class="inputh lf" name="tel" onblur="checkNull(this,'电话号')"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>住址</label>
              <input type="text" class="inputh lf" name="address" onblur=""/>
            	<div class="lf red laba"></div>
            </dd>
            <dd>
              <label> <small>*</small>邮政编码</label>
              <input type="text" class="inputh lf" name="postNum" onblur=""/>
               <div class="lf red laba"></div>
            </dd>
            <dd class="hegas">
              <label> <small>*</small>验证码</label>
              <input type="text" class="inputh inputs lf" name="code" />
               <span class="wordp lf"><img src="${pageContext.request.contextPath }/getKaptcha.action" width="96" height="27" alt="" onblur="checkCode(this)"/></span>
               <span class="blues lf"><a href="" title="">看不清</a></span>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
               <input name=""  type="checkbox" id="rem_u"   />
              <label for="rem_u" class="labels">我同意<span class="blues">《服务条款》</span></label>
            </dd>
            <dd class="hegas">
              <label>&nbsp;</label>
              <input name="" type="submit" value="立即注册" class="spbg buttombg buttombgs f14 lf" />
            </dd>
            </form>
          </dl>
    </div>
<!-- main end-->
<!-- footer begin-->

</div>
 <!--footer end-->
 
</div>
</body>
</html>
