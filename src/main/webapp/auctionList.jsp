<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link href="${pageContext.request.contextPath }/css/common.css" rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"/></script>
	<script type="text/javascript">
	$(function(){
		$("[value='发布']").click(function(){
			location="${pageContext.request.contextPath }/addAuction.jsp";
		});
	});
	</script>
	
  </head>
  
  
  <body>
    <div class="wrap">
<!-- main begin-->
  <div class="sale">
    <h1 class="lf">在线拍卖系统</h1>
    <div class="logout right"><a href="${pageContext.request.contextPath }/user/zhuxiao.action" title="注销">注销</a></div>
  </div>
  <form action="${pageContext.request.contextPath }/auction/selectAll.action" method="get">
  <div class="forms">
    <label for="name">名称</label>
    <input name="name" type="text" class="nwinput" id="name"/>
    <label for="names">描述</label>
    <input name="desc" type="text" id="names" class="nwinput"/>
    <label for="time">开始时间</label>
    <input name="startTimestr" type="text" id="time" class="nwinput"/>
    <label for="end-time">结束时间</label>
    <input name="endTimestr" type="text" id="end-time" class="nwinput" />
    <label for="price">起拍价</label>
    <input name="startPrice" type="text" id="price" class="nwinput" />
    <input type="submit"  value="查询" class="spbg buttombg f14  sale-buttom"/>
    <c:if test="${ user.status==1}">
    <input type="button"  value="发布" class="spbg buttombg f14  sale-buttom buttomb"/>
    </c:if>
  </div>
  </form>
  <div class="items">
      <ul class="rows even strong">
        <li>名称</li>
        <li class="list-wd">描述</li>
        <li>开始时间</li>
        <li>结束时间</li>
        <li>起拍价</li>
        <li class="borderno">操作</li>
      </ul>
      <c:forEach items="${requestScope.auctionList }" var="auction" varStatus="sta" >
      <c:if test="${sta.index%2==0 }">
      <ul class="rows">
      </c:if>
      <c:if test="${sta.index%2!=0 }">
      <ul class="rows even">
      </c:if>
        <li><a href="国书" title="">${auction.name }</a></li>
        <li class="list-wd">${auction.desc }</li>
        <li><fmt:formatDate value="${auction.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
        <li><fmt:formatDate value="${auction.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></li>
        <li>${auction.startPrice }</li>
        <li class="borderno red">
        	<c:if test="${sessionScope.user.status==0 }" >
		       <a href="${pageContext.request.contextPath }/record/getRecords.action?aid=${auction.id}">竞拍</a>
        	</c:if>
           <c:if test="${sessionScope.user.status==1 }">
			   <a href="javascript:void(0)" title="修改" onclick="dele(${auction.id});">修改</a>|
	           <a href="javascript:void(0)" title="删除" onclick="abc(${auction.id});">删除</a>
           </c:if>
        </li>
      </ul>
     </c:forEach>
      
  </div>
  <script>
   function abc(id){
	   
	   if(confirm("你真的确认要删除吗？请确认")){
	    	location="${pageContext.request.contextPath }/auction/delete.action?id="+id;
		   return true;
		 }
		 else{
			 return false;
			 }
			 
	   };
	   function dele(id){
		   if(confirm("你真的确认要修改吗？请确认")){
		   location="${pageContext.request.contextPath }/auction/selectOne.action?id="+id;
			   return true;
			   }
			   else{
				   return false;
				   }
		   }
  </script>
<!-- main end-->
</div>
  </body>
</html>
