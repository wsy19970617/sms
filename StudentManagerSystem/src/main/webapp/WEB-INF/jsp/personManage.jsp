<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.controHeight{height:15vh;}
	#personImg{}
</style>
</head>
<body style="background-color:rgba(192,192,192,0.25)" >
<div class="layui-layout layui-layout-admin">
	  <!-- 1、顶部导航开始 -->
	  <div class="layui-header">
	    <div class="layui-logo">学生管理系统</div>
	    <!-- 1.1、头部左区域 -->
	    <ul class="layui-nav layui-layout-left">
			  <li class="layui-nav-item"><a href="index">首页</a></li>
			  <li class="layui-nav-item  layui-this"><a href="javascript:;">用户管理</a>
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
	  </div><!-- 1、顶部导航结束 -->
  </div>
<div class="layui-container">
<div class="controHeight"></div>  
  <div class="layui-row">
    <div class="layui-col-md12">
      <div class="layui-card">
  <div class="layui-card-header"><button type="button" class="layui-btn layui-btn-radius" style="float: right;">修改个人信息</button></div>
  <div class="layui-card-body">
    <table class="layui-table">
      <colgroup>
        <col width="150">
        <col width="200">
        <col>
      </colgroup>
      <tbody>
        <tr>
          <td>个人照片</td>
          <td>
          	<img src="${pageContext.request.contextPath }/image/timg.jpg" height="150px"/>
          </td>
        </tr>
        <tr>
          <td>用户名</td>
          <td><security:authentication property="name"/></td>
        </tr> 
        <tr>
          <td>学号</td>
          <td>1</td>
        </tr>   
        <tr>
          <td>性别</td>
          <td>男</td>
        </tr>
        <tr>
          <td>出生日期</td>
          <td>1997-11-28</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>
    </div>
  </div>
</div>
<script src="bower_components/layui/dist/layui.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script>
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
</body>
</html>