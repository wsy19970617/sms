<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>欢迎您的到来！</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.layui-container{padding: 0px;margin: 0px;}
	.layui-container{padding: 0px;margin: 0px;}
	.contro{height:20vh;}
	.controWidth{width:100vw;height: 430px;}
	.controWidth{width:100vw;height: 430px;}
	.contro{height:20vh;} 
	.controwidth{width:100vw; height:430px;}
	.controwidth{width:100vw; height:430px;}
</style>
</head>
<body class="layui-layout-body layui-bg-black" >
  <div class="layui-layout layui-layout-admin">
	  <div class="layui-header">
	  <!-- 1、顶部导航开始 -->
	    <div class="layui-logo">教务管理系统</div>
	    <!-- 1.1、头部左区域 -->
	    <ul class="layui-nav layui-layout-left">
			  <li class="layui-nav-item layui-this"><a href="index">首页</a></li>
			  <li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="ss">个人成绩查询</a></dd>
			      <dd><a href="pm">个人信息维护</a></dd>
			    </dl>
			  </li>
			  <security:authorize access="hasRole('ROLE_ADMIN')">
				  <li class="layui-nav-item"><a href="javascript:;">学生管理</a>
				    <dl class="layui-nav-child">
				      <dd><a href="s">学生成绩管理</a></dd>
				      <dd><a href="mes">学生信息管理</a></dd>
				    </dl>
				  </li>
			  </security:authorize>
		 </ul>
		 <!-- 1.2、头部右区域 -->
		 <ul class="layui-nav layui-layout-right">
	       <li class="layui-nav-item">
	         <a href="javascript:;">
	           <img src="${pageContext.request.contextPath }/image/timg.jpg" class="layui-nav-img">
	           <security:authentication property="name"/>
	         </a>
	       </li>
	       <li class="layui-nav-item"><a href="logout">退出</a></li>
	     </ul>
	  <!-- 1、顶部导航结束 -->
	  </div>
  </div>
  

  <!-- <div class="layui-row contro">&nbsp;</div> -->
  <div class="layui-container layui-col-lg12">
  <!-- 内容主体区域 -->
  <div class="contro">&nbsp;</div>
  	<div class="layui-col-lg12">
  		<div class="layui-carousel" id="test1" lay-filter="test1">
		  <div carousel-item="">
		    <div><img src="${pageContext.request.contextPath }/image/2019091110495001.jpg" class="controWidth"/></div>
		    <div><img src="${pageContext.request.contextPath }/image/2019091110500502.jpg" class="controWidth"/></div>
		    <div><img src="${pageContext.request.contextPath }/image/2019062417174203.jpg" class="controWidth"/></div>
		    <div><img src="${pageContext.request.contextPath }/image/2019062416225804.jpg" class="controWidth"/></div>
		    <div><img src="${pageContext.request.contextPath }/image/201962505.jpg" class="controWidth"/></div>
		    <div><img src="${pageContext.request.contextPath }/image/XUEXIQIANGGUO06.jpg" class="controWidth"/></div>
		  </div>
		</div>
  	</div>
  </div>
  <div class="layui-footer footer footer-doc layui-col-lg12" style="text-align: center;">
    <!-- 3、底部固定区域 -->
    <div class="contro">&nbsp;</div>
    	&copy; 2019 dcn 团队
    
  </div> 
<script src="${pageContext.request.contextPath }/bower_components/layui/dist/layui.js"></script>
<script src="${pageContext.request.contextPath }/bower_components/jquery/dist/jquery.min.js"></script>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use(['element','carousel'], function(){
  var element = layui.element;
  var carousel = layui.carousel;
  carousel.render({
	    elem: '#test1'
		,height:"430px"
	    ,width: '100%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
	  });
});
</script>
</body>
</html>