<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.layui-container{padding: 0px;margin: 0px;}
	.contro{height:20vh;}
</style>
</head>
<body>
<div class="layui-container layui-col-lg12">
  <div class="layui-row">
    <div class="layui-col-lg12">
    	<!-- 顶部导航开始 -->
		  	<ul class="layui-nav layui-bg-molv" lay-filter="">
			  <li class="layui-nav-item"><a href="javascript:;">学生信息管理系统</a></li>
			  <li class="layui-nav-item layui-this"><a href="">首页</a></li>
			  <li class="layui-nav-item"><a href="">个人成绩</a></li>
			  <li class="layui-nav-item"><a href="">个人信息维护</a></li>
			  <li class="layui-nav-item"><a href="s">学生成绩管理</a></li>
			  <li class="layui-nav-item"><a href="">用户管理</a></li>  
			</ul>
			 <!-- 顶部导航结束 -->
    </div>
  </div>
  <div class="layui-row contro">&nbsp;</div>
  <div class="layui-row">
  	<div class="layui-col-lg12">
  		<div class="layui-carousel" id="test1">
		  <div carousel-item>
		    <div><img src="image/2019091110495001.jpg"/></div>
		    <div><img src="image/2019091110500502.jpg"/></div>
		    <div><img src="image/2019062417174203.jpg"/></div>
		    <div><img src="image/2019062416225804.jpg"/></div>
		    <div><img src="image/201962505.jpg"/></div>
		    <div><img src="image/XUEXIQIANGGUO06.jpg"/></div>
		  </div>
		</div>
  	</div>
  </div>
  <div class="layui-row contro">&nbsp;</div>
  <div class="layui-footer" style="text-align: center;">
    <!-- 4、底部固定区域 -->
    © xcn团队
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