<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>学生信息管理</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.layui-container{padding: 0px;margin: 0px;}
	.layui-card-header{border: 0px;}
</style> 
</head>
<body class="layui-layout-body">
  <div class="layui-layout layui-layout-admin">
	  <!-- 1、顶部导航开始 -->
	  <div class="layui-header">
	    <div class="layui-logo">学生管理系统</div>
	    <!-- 1.1、头部左区域 -->
	    <ul class="layui-nav layui-layout-left">
			  <li class="layui-nav-item"><a href="index">首页</a></li>
			  <li class="layui-nav-item"><a href="javascript:;">用户管理</a>
			    <dl class="layui-nav-child">
			      <dd><a href="">个人成绩查询</a></dd>
			      <dd><a href="">个人信息维护</a></dd>
			    </dl>
			  </li>
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
	       <li class="layui-nav-item"><a href="logout">退出</a></li>
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
				  <div class="layui-card-header"> 
				  	 <div class="layui-item">
				  	 	<!-- 2.1.1、条件搜索框开始，内容在form -->
				        <form class="layui-form" style="float: right;" lay-filter="searchFormFilter">
					        <div class="layui-inline">
					          <label class="layui-form-label">用户名</label>
					          <div class="layui-input-block">
					            <input type="text" name="userid" placeholder="请输入姓名" autocomplete="off" class="layui-input">
					          </div>
					        </div>
					        <div class="layui-inline">
					          <button class="layui-btn layuiadmin-btn-admin" lay-submit="" lay-filter="searchFilter">
					            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					          </button>
					        </div>
				        </form>
			         </div><!-- 2.1.1、条件搜索框结束 -->
			         
				  </div>
				  <!-- 2.1、 卡片头结束 -->
				  <!-- 2.2、卡片主体开始 -->
				  <div class="layui-card-body">
			    	<table class="layui-hide" id="test" lay-filter="test"></table>
				  </div>
				  <!-- 2.2、卡片主体结束 -->
				</div>
		    </div>
		  </div><!-- 2、内容主体区域结束 --> 
	   </div>
  </div>
  
<!-- 4、按钮块 -->
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删&nbsp;&nbsp;&nbsp;除&nbsp;&nbsp;&nbsp;学&nbsp;&nbsp;&nbsp;生</a>
</script>

<script src="bower_components/layui/dist/layui.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>

<script>
	//注意：导航 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	});
</script>

<script>
	/* 0、表格功能all */
	layui.use(['table','form'], function(){
	  var table = layui.table;
	  var form=layui.form;
	  
	  /* 1、表格遍历显示功能a */
	  table.render({
	    elem: '#test'
	    ,url:'user/findAll'
	    ,title: '学生信息表'
	    ,cols: [[
	      {type: 'checkbox', fixed: 'left', width:100}
	      ,{field:'id', title:'ID', width:100, fixed: 'left', unresize: true, sort: true}
	      ,{field:'username', title:'用户名', width:300, sort: true}
	      ,{field:'pwd', title:'学生用户密码', width:300}
	      ,{fixed: 'right', title:'操 作', toolbar: '#barDemo'}
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
		    limits:[5,10,15],
		    limit: 5
	  });

	  /* 2、监听操作列事件之删除功能a */
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){
	    	layer.confirm('确定将该学生用户剔除？', function(index) {
				layui.jquery.post("user/del", {
				id : data.id}, function(ret) {//成功时的回调函数，服务器返回消息后对页面进行处理
					if (ret.code == "1") {//删除成功， 刷新当前页表格
						layer.msg(ret.msg,//删除成功的消息
						{
							icon : 1,
							time : 1500
						//1.5s后关闭(如果不配置，默认3s)
						//持续多久自动关闭
						}, function() {//成功弹出消息框时候调用
							obj.del(); //删除对应行（tr） 的 DOM 结构， 并更新缓存
							layer.close(index);//关闭弹出框
							table.reload("test", {
								url : "user/findAll"
							});//重新加载表单（id=test）(表单重载)
						});
					} else if (ret.code == "-1") { //删除失败
						layer.alert(ret.msg, {
							icon : 2
						}, function() {
							layer.close(index);
						});
					}
				});
			})
			
	     }
	  });
	  
	  /* 3、监听操作列事件之成绩查询提交功能b */
	  form.on('submit(searchFilter)', function(data){
		  table.reload('test', {
			  url: 'user/findAll'
			  ,where: data.field //设定异步数据接口的额外参数
		  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。	
		});
	});
</script>
</body>
</html>