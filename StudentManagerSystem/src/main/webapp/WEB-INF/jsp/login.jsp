<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css" type="text/css">

</head>
<style>

.father {
	width: 1000px;
	height: auto;
	margin: 0 auto;
}

.layui-input {
	width: 300px;
	line-height: 40px;
}

.login-main {
	margin-top: 100px;
	margin-left: 350px;
	width: 300px;
	height: 450px; /* border:1px solid #e6e6e6; */
}

.layui-form {
	margin-top: 20px;
}

.layui-input-inline {
	margin-top: 30px;
}

button {
	width: 300px;
	height:50px;
	color:gold;
	font-size:20px;
	background:#FFF68F
}

body{
background:#E0FFFF
}
</style>
<body>

	<div class="father">
		<div class="login-main">
			<p style="color: #5FB878; font-size: 25px; text-align: center;">欢迎登录</p>
			<!-- 登录表单开始 -->
			<form class="layui-form" method="post">
				<div class="layui-input-inline">
					<input type="text" class="layui-input" name="username" required
						lay-verify="required" placeholder="请输入用户名" autocomplete="off"
						class="layui-input">
				</div>
				<br>
				<div class="layui-input-inline">
					<input type="password" name="pwd" required
						lay-verify="required" placeholder="请输入密码" autocomplete="off"
						class="layui-input">
				</div>
				<br>
				<div class="layui-input-inline login-btn">
					<button lay-submit lay-filter="login" class="layui-btn">登录</button>
				</div>
			</form>
				<div class="layui-input-inline login-btn">
					<button lay-submit lay-filter="registerBtn" class="layui-btn layui-btn-normal" id="openRegisterForm">没有账号？注册一个吧</button>
				</div>			
			<!-- 登录表单结束 -->
		</div>
	</div>
<!-- 注册表单 -->
<div id="registerForm" style="display: none">
	<form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" required lay-verify="required" name="username" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">密码</label>
    <div class="layui-input-block">
      <input type="password" required lay-verify="required" name="pwd" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-block">
      <input type="password" required lay-verify="required" name="pwd2" placeholder="与上个密码相同" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="doRegisterBtn">立即注册</button>
    </div>
  </div>
</form>
</div>
<!-- 注册表单结束 -->
<script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="bower_components/layui/dist/layui.js" type="text/javascript"></script>
	<script type="text/javascript">
	layui.use(['layer','form'], function(){
		  var layer = layui.layer;
		  var form = layui.form;
		  <!--打开注册表单-->
		  $("#openRegisterForm").click(function(){
			  layer.open({
				  type: 1, 
				  content:$("#registerForm"),
				  area:['35%','70%']
				});
		  });
		  //注册提交按钮监听
		  form.on('submit(doRegisterBtn)', function(data){
			  if(data.field.pwd==data.field.pwd2){
			  layui.$.post("user/add",data.field,function(res){
				  
					if(res.code==0){
						layer.closeAll();	
						layer.msg("注册成功，马上登录吧", {
								  icon: 6,
								  time: 2000 //2秒关闭（如果不配置，默认是3秒）
								}, function(){
								  
								});
					}else{
						layer.msg(res.msg, 
							{
							  icon: 5,
							  time: 3000 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
							  
							});
					}
				  });
				}else{
					layer.msg('两次密码不同', {icon: 5}); 
				}
			    return false;
			  });
		//登录提交按钮监听
		  form.on('submit(login)', function(data){
			  layui.$.post("user/doLogin",data.field);
		  });  
	});              
	</script>
</body>
</html>