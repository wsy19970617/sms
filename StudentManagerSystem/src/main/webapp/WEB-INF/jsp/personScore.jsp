<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生成绩查询</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.layui-container{padding: 0px;margin: 0px;}
	.layui-card-header{border: 0px;}
</style>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<!-- 1、顶部导航开始 -->
		<div class="layui-header">
			<div class="layui-logo">学生信息管理系统</div>
			<!-- 1.1、头部左区域 -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="index">首页</a></li>
				<li class="layui-nav-item"><a href="javascript:;">用户管理</a>
					<dl class="layui-nav-child">
						<dd><a href="ss">个人成绩查询</a></dd>
			      		<dd><a href="">个人信息维护</a></dd>
					</dl></li>
				<security:authorize access="hasRole('ROLE_ADMIN')">
			  <li class="layui-nav-item  layui-this"><a href="javascript:;">学生管理</a>
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
	           <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
	           <security:authentication property="name"/>
	         </a>
	       </li>
	       <li class="layui-nav-item"><a href="">登陆</a></li>
	     </ul>
	  </div><!-- 1、顶部导航结束 -->
	</div>
 <div class="layui-layout layui-layout-admin">
	  <div class="layui-container layui-col-lg12">
		  <!-- 2、内容主体区域 -->
		  <div class="layui-row">
		    <div class="layui-col-lg12">
		    	<div class="layui-row contro">&nbsp;</div>
				<div class="layui-card">
			      <!-- 2.1、卡片头开始 -->		 
				  <!-- 2.1、 卡片头结束 -->
				  <!-- 2.2、卡片主体开始 -->
				  <div class="layui-card-body">
			    	<table class="layui-hide" id="test1" lay-filter="test1"></table>
				  </div>
				  <!-- 2.2、卡片主体结束 -->
				</div>
		    </div>
		  </div> <!-- 2、内容主体区域结束 --> 
	  </div>
  </div>
	
<!-- <div class="layui-footer footer footer-doc layui-col-lg12">
    3、底部固定区域
    <p class=" layui-bg-black" style="padding: 6vw; text-align:center;">&copy; 2019 dcn 团队</p>
  </div> -->
<script src="${pageContext.request.contextPath }/bower_components/layui/dist/layui.js"></script>
<script src="${pageContext.request.contextPath }/bower_components/jquery/dist/jquery.min.js"></script>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;  
});
</script>
<script>
/* 0、表格功能all */
layui.use('table', function(){
  var table = layui.table;
    
  /* 1、表格遍历显示功能a */
  table.render({
    elem: '#test1'
    ,url:'score/list'
    ,title: '用户数据表'
    ,cols: [[
     
      {field:'id', title:'ID',  fixed: 'left', unresize: true, sort: true}
      ,{field:'userid', title:'学生姓名', width: 180}
      ,{field:'gradeid', title:'学生年级', width: 180, sort: true}
      ,{field:'english', title:'英语成绩', width: 180, sort: true}
      ,{field:'politics', title:'政治成绩', width: 180, sort: true}
      ,{field:'major1', title:'专业课一成绩', width: 180, sort: true}
      ,{field:'major2', title:'专业课二成绩', width: 180, sort: true}
    ]]
    ,page: true
    ,parseData: function(res){ //res 即为原始返回的数据
	    return {
	        "code": 0, //解析接口状态
	        //"msg": res.message, //解析提示文本
	        "count": res.total, //解析数据长度
	        "data": res.records //解析数据列表
	      };
	    },
	    limits:[2,5,10],
	    limit: 2
  });
});
</script>
</body>
</html>