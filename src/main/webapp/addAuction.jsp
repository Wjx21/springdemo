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
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

	function numberCheck(obj){
		var reg1 = /^\d{1,7}$/;
		var reg2 = /^\d{1,7}.\d{1,2}/;
		var number = $(obj).val();
		if(reg1.test(number)||reg2.test(number)){
			
			$(obj).next().html("");
			return true;
		}else{
			$(obj).next().html("必须是数字");
			return false;
			}
		}
		
	function timeCheck(obj){
		var time = $(obj).val();
		var reg = /^[1|2|3|4|5|6|7|8|9]{1}\d{3}-\d{2}-\d{2} [0|1|2]{1}\d{1}:\d{2}:\d{2}$/;
		if(!reg.test(time)){
			$(obj).next().html("格式：2011-05-05 12:30:00");
			return false;
		}else{
			$(obj).next().html("");
			return true;
		}
	};
	
	function checkName(obj){
		if($(obj).val()==''){
			$(obj).next().html("不能为空！");
			return false;
		}else{
			$(obj).next().html("");
			return true;
		}
	}
	
	function checkDesc(obj){
		if($(obj).val()!=''){
			$(obj).next().html("");
			return true;
		
		}
		
		$(obj).next().html("不能为空！");
		return false;
	}
	function checkPhoto(obj){
		var photo = $(obj).val();
		if(photo){
			$(obj).next().html("");
			return true;
		}
		$(obj).next().html("请选定一张图片！");
		return false;
		
	}
	
	
	function checkForm(){
		var t1 = checkName($(":text:first").get(0));
		var t2 = numberCheck($(":text:eq(1)").get(0));
		var t3 = numberCheck($(":text:eq(2)").get(0));
		var t4 = timeCheck($(":text:eq(3)").get(0));
		var t5 = timeCheck($(":text:eq(4)").get(0));
		var t6 = checkPhoto($(":file").get(0));
		var t7 = checkDesc($(":text:last").get(0));
		
		
		if(t1&t2&t3&t4&t5&t6&t7){
			return true;
		}else{
			
			return false;
		}
	
	}


	$(function(){
		// 文件上传(文件域)的改变事件
		$(':file').change(function(event) {
			//  HTML5 js 对象的获取
  			var files = event.target.files, file;  
			if(files && files.length > 0){
					// 获取目前上传的文件
    		 		var file = files[0];
    		 		
    		 		// 判断图片大小不能超过指定大小
    		 		if(file.size > 1024 * 1024 * 2) {
	       			 	alert('图片大小不能超过 2MB!');
	        			return false;
    				}
    				
     				// file对象生成可用的图片
     				var URL = window.URL || window.webkitURL;
     				// 通过 file 生成目标 url
     				var imgURL = URL.createObjectURL(file);
     				
     				// 用这个 URL 产生一个 <img> 将其显示出来
     				$("img").attr('src', imgURL);
			}
		});
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
      <div class="login logns produce">
        <h1 class="blues">拍卖品信息</h1>
          <dl>
          <form action="${pageContext.request.contextPath }/auction/add.action"  method="post" enctype="multipart/form-data" onsubmit="return checkForm()">
            <dd >
              <label>名称：</label>
              <input type="text" class="inputh lf" value="" name="name" onblur="checkName(this)"/>
              <div class="xzkbg spbg lf"></div>
            </dd>
            <dd>
              <label>起拍价：</label>
              <input type="text" class="inputh lf" value="" name="startPrice" onblur="numberCheck(this)"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>底价：</label>
              <input type="text" class="inputh lf" value="" name="upset" onblur="numberCheck(this)"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>开始时间：</label>
              <input type="text" class="inputh lf" value="" name="startTime" onblur="timeCheck(this)"/>
              <div class="lf red laba"></div>
            </dd>
            <dd>
              <label>结束时间：</label>
              <input type="text" class="inputh lf" value="" name="endTime" onblur="timeCheck(this)"/>
              <div class="lf red laba"></div>
            </dd>
            <dd class="dds">
              <label>拍卖品图片：</label>
               <div class="lf salebd"><a href="#"><img src="images/ad20.jpg" width="100" height="100" /></a></div>
              <input name="myPhoto" type="file" class="offset10 lf"  onblur="checkPhoto(this)"/>
               <div class="lf red laba"></div>
            </dd>
             <dd class="dds">
              <label>描述：</label>
              <textarea name="desc" cols="" rows="" class="textarea" onblur="checkDesc(this)"></textarea>
               <div class="lf red laba"></div>
            </dd>
            <dd class="hegas">
                <input name="" type="submit" value="保 存" class="spbg buttombg buttombgs buttomb f14 lf" />
                <input name="" type="button" value="取 消" class="spbg buttombg buttombgs buttomb f14 lf" />
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
