<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>登录</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bower_components/layui/dist/css/layui.css">
<style type="text/css">
	.controHeight {height: 20vh;}
	body{background-image:url("${pageContext.request.contextPath }/image/123.jpg"); background-repeat: no-repeat;background-size:100vw 100vh; }
	.yinshen{display: none;}
</style>
</head>
<body>
<!--  style="background-color:rgba(192,192,192,0.25)"  -->
  <div class="layui-layout layui-layout-admin">
	  <!-- 1、顶部导航开始 -->
	  <div class="layui-header">
	    <div class="layui-row">
	       <div class="layui-col-md5 layui-col-md-offset5">
	         <div class="layui-logo ">学生管理系统登录</div>
	       </div>
	    </div>
	  </div><!-- 1、顶部导航结束 -->
	  
  </div>

  <div class="layui-layout layui-layout-admin">
	 <!-- 2、内容主体区域 -->
	 <div class="layui-container controbackground">
		<div class="layui-row controHeight"></div>
		<div class="layui-row">&nbsp;</div>
		<div class="layui-row">&nbsp;</div>
		<div class="layui-row">&nbsp;</div>
		<div class="layui-row">
		<div class="layui-col-md5">&nbsp;</div>
		<div class="layui-col-md6">
		<button type="button" class="layui-btn layui-btn-lg layui-btn-radius layui-btn-normal" id="tanchu">&nbsp;&nbsp;&nbsp;登&nbsp;&nbsp;录&nbsp;&nbsp;&nbsp;Login</button>
		</div>
		</div>
		
		
		<div class="layui-card yinshen" id="card">
			<div class="layui-card-header">欢迎您的到来，请先登录</div>
			<div class="layui-card-body">
				<div class="layui-container">
					<div class="layui-row">
						<div class="layui-col-lg2">&nbsp;</div>
						<div class="layui-col-md6">
							<!-- 登录表单开始 -->
							<form class="layui-form" action="" method="post">
								<div class="layui-form-item">
									<label class="layui-form-label">账号</label>
									<div class="layui-input-block">
										<input type="text" name="username" required
											lay-verify="required" placeholder="请输入账号" autocomplete="off"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label">密码</label>
									<div class="layui-input-block">
										<input type="password" name="pwd" required
											lay-verify="required" placeholder="请输入密码" autocomplete="off"
											class="layui-input">
									</div>

								</div>
								<div class="layui-form-item">
									<div class="layui-input-block">
										<button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
										<button type="reset" class="layui-btn layui-btn-primary"
											id="registerBtn">没有账号？注册一个吧！</button>
									</div>
								</div>
							</form>
							<!-- 登录表单结束 -->
						</div>
						<div class="layui-col-md3"></div>
					</div>
				</div>
			</div>
		</div>
	 </div>
  </div>
  <!-- ***************************** -->
	<!-- 注册表单开始 -->
	<div id="registerDiv" style="display: none;">
		<form class="layui-form" action="post">
			<div class="layui-col-lg2">&nbsp;</div>
			<div class="layui-form-item layui-col-md10">
				<label class="layui-form-label">账号</label>
				<div class="layui-input-block">
					<input type="text" name="username" required lay-verify="required"
						placeholder="请输入账号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-col-md10">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-block">
					<input type="password" name="pwd" required lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-col-md10">
				<label class="layui-form-label">确认密码</label>
				<div class="layui-input-block">
					<input type="password" name="pwd2" required lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="registerFilter">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<!-- 注册表单结束 -->
	
	<!-- ***************** -->
	<script
		src="${pageContext.request.contextPath }/bower_components/layui/dist/layui.js"></script>
	<script
		src="${pageContext.request.contextPath }/bower_components/jquery/dist/jquery.min.js"></script>
	<script>
		//Demo
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form;
			//弹出注册表单
			$("#registerBtn").click(function() {
				layer.open({
					type : 1,
					content : $("#registerDiv"),
					area : [ '40%', '45%' ],
					title:"请您注册一个新用户"
				});
			})
			//监听注册提交
			form.on('submit(registerFilter)', function(data) {
				if(data.field.pwd==data.field.pwd2){
					$.post("user/add",data.field,function(res){
						if(res.code==0){
							layer.closeAll();	
							layer.msg("注册成功，开始登录吧", 
								{icon: 5,time: 2000
								}, function(){});
						}else{
							layer.msg(res.msg, 
								{icon: 2,time: 2000 //2秒关闭（如果不配置，默认是3秒）
								}, function(){});
						}
				   });
				}else{
					layer.msg("两次密码不一致，请重新输入",
							{icon: 5,time: 2000
							}, function(){});
				}
				return false;
			});
		});
	</script>
	<script type="text/javascript">
		$("#tanchu").click(function(){
			$("#tanchu").addClass("yinshen");
			$("#card").removeClass("yinshen");
			});
	</script>
</body>
</html>