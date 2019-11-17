<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎您的到来！</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.layui-container{padding: 0px;margin: 0px;}

	.contro{height:20vh;}
	.controWidth{width:100vw;height: 430px;}
	.contro{height:20vh;} 
	.controwidth{width:100vw; height:430px;}
</style>
</head>
<body>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
	  <div class="layui-header">
	  <!-- 1、顶部导航开始 -->
	    <div class="layui-logo">学生信息管理系统</div>
	    <!-- 1.1、头部左区域 -->
	    <ul class="layui-nav layui-layout-left">
			  <li class="layui-nav-item layui-this"><a href="index">首页</a></li>
			  <li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="s">学生成绩查询</a></dd>
			      <dd><a href="">用户信息维护</a></dd>
			    </dl>
			  </li>
			  <li class="layui-nav-item"><a href="javascript:;">学生管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="s">学生成绩管理</a></dd>
			      <dd><a href="">学生信息管理</a></dd>
			    </dl>
			  </li>
		 </ul>
		 <!-- 1.2、头部右区域 -->
		 <ul class="layui-nav layui-layout-right">
	       <li class="layui-nav-item">
	         <a href="javascript:;">
	           <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
	           舞居<!-- <security:authentication property="username"/> -->
	         </a>
	       </li>
	       <li class="layui-nav-item"><a href="">登陆</a></li>
	     </ul>
	  <!-- 顶部导航结束 -->
	  </div>
  </div>
  
  <!-- <div class="layui-row contro">&nbsp;</div> -->
  <div class="layui-container layui-col-lg12">
  <!-- 内容主体区域 -->
  	<div class="layui-col-lg12">
  		<div class="layui-carousel" id="test1" lay-filter="test1">
		  <div carousel-item="">
		    <div><img src="image/2019091110495001.jpg" class="controWidth"/></div>
		    <div><img src="image/2019091110500502.jpg" class="controWidth"/></div>
		    <div><img src="image/2019062417174203.jpg" class="controWidth"/></div>
		    <div><img src="image/2019062416225804.jpg" class="controWidth"/></div>
		    <div><img src="image/201962505.jpg" class="controWidth"/></div>
		    <div><img src="image/XUEXIQIANGGUO06.jpg" class="controWidth"/></div>
		  </div>
		</div>
  	</div>

  <div class="layui-layout layui-layout-admin">
	  <div class="layui-container layui-col-lg12">
	  <!-- 2、内容主体区域 -->
	  	<div class="layui-col-lg12">
	  		<div class="layui-carousel" id="test1" lay-filter="test1">
			  <div carousel-item="">
			    <div><img src="image/2019091110495001.jpg" class="controwidth"/></div>
			    <div><img src="image/2019091110500502.jpg" class="controwidth"/></div>
			    <div><img src="image/2019062417174203.jpg" class="controwidth"/></div>
			    <div><img src="image/2019062416225804.jpg" class="controwidth"/></div>
			    <div><img src="image/201962505.jpg" class="controwidth"/></div>
			    <div><img src="image/XUEXIQIANGGUO06.jpg" class="controwidth" /></div>
			  </div>
			</div>
	  	</div>
	  </div>
  </div>

  <div class="layui-footer footer footer-doc layui-col-lg12">
    <!-- 3、底部固定区域 -->
    <p class=" layui-bg-black" style="padding: 6vw; text-align:center;">&copy; 2019 dcn 团队</p>
  </div>
</div>  
<script src="bower_components/layui/dist/layui.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
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