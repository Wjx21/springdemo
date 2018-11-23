<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		function jingpai(startPrice){
			var max = parseFloat($("#max").next().children("li:eq(1)").html());
			var price=parseFloat($("#sale").val());
			if(price>9999999.99){
				$("#errorMessage").html("超出最大值!");
				return false;
			}
			if(!max){
				max = startPrice;
			}
			if(price>max){
				$("#errorMessage").html("");
				return true;
			}
			
			$("#errorMessage").html("不能低于最高竞拍价!");
			return false;
		}
		
		$(function(){
			var max = $("#max").next().children("li:eq(1)").html();
			if(!max){
				max = $("ul:eq(4)").children("li:eq(1)").html();
			}
			$("#sale").val(max);
		});
</script>
</head>

<body>
<div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="#" title="注销">注销</a></div>
  </div>
  <div class="items sg-font lf">
      <ul class="rows">
        <li>名称：</li>
        <li class="borderno">${auction.name}</li>
      </ul>
      <ul class="rows">
        <li>描述：</li>
        <li class="borderno">${auction.desc}</li>
      </ul>
      <ul class="rows">
        <li>开始时间：</li>
        <li class="borderno"><fmt:formatDate value="${auction.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
      </ul>
      <ul class="rows">
        <li>结束时间：</li>
        <li class="borderno"><fmt:formatDate value="${auction.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
      </ul>
      <ul class="rows border-no">
        <li>起拍价：</li>
        <li class="borderno">${auction.startPrice}</li>
      </ul>
  </div>
  <div class="rg borders"><img src="${pageContext.request.contextPath }/images/${auction.pic}" width="270" height="185" alt="" /></div>
  <div class="cl"></div>
  <div class="top10 salebd">
  		
       <p>
       <form action="${pageContext.request.contextPath }/record/jingpai.action" method="post" onsubmit="return jingpai(${auction.startPrice})">
       <label for="sale">出价：</label>
       <input type="text"  class="inputwd" id="sale" value="${auction.startPrice}" name="price" onblur="jingpai(${auction.startPrice})"/>
       <input type="hidden" value="${auction.id}" name="aid"/>
       <input type="submit" value="竞 拍" class="spbg buttombg f14  sale-buttom" />
       </form>
       </p>
       <p class="f14 red" id="errorMessage"></p>
  </div>
  <div class="top10">
    <input name="" type="submit" value="刷 新" class="spbg buttombg f14" />
    <input name="" type="submit" value="返回列表" class="spbg buttombg f14" />
  </div>
  <div class="offer">
    <h3>出价记录</h3>
    <div class="items sg-font">
      <ul class="rows even strong" id="max">
        <li>竞拍时间</li>
        <li>竞拍价格</li>
        <li class="borderno">竞拍人</li>
      </ul>
      <c:forEach items="${list }" var="recordDTO" varStatus="sta">
      	<c:if test="${sta.index%2==0}">
      		 <ul class="rows">
      	</c:if>
      	<c:if test="${sta.index%2!=0}">
      		 <ul class="rows even">
      	</c:if>
      		<li><fmt:formatDate value="${recordDTO.time }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
	        <li>${recordDTO.price}</li>
	        <li class="borderno">${recordDTO.name}</li>
	        </ul>
      </c:forEach>
  </div>
  </div>
<!-- main end-->
</div>
</body>
</html>
