<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息管理注册页</title>
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
			<p style="color: #5FB878; font-size: 25px; text-align: center;">欢迎注册</p>
			<form class="layui-form">
				<div class="layui-input-inline">
					<input type="text" class="layui-input" name="username" required
						lay-verify="required" placeholder="请输入用户名" autocomplete="off"
						class="layui-input">
				</div>
				<br>
				<div class="layui-input-inline">
					<input type="password" name="password" required
						lay-verify="required" placeholder="请输入密码" autocomplete="off"
						class="layui-input">
				</div>
				<br>
				<div class="layui-input-inline">
					<input type="password" name="password" required
						lay-verify="required" placeholder="请再次输入密码" autocomplete="off"
						class="layui-input">
				</div>
				<br>
				<div class="layui-input-inline login-btn">
					<button lay-submit lay-filter="login" class="layui-btn">注册</button>
				</div>
				

				
			</form>
		</div>
	</div>

<script src="bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="bower_components/layui/dist/layui.js" type="text/javascript"></script>
	<script type="text/javascript">
		layui.use([ 'form', 'layer', 'jquery' ], function() {

			// 操作对象
			var form = layui.form;
			var $ = layui.jquery;
			form.on('submit(login)', function(data) {
				// console.log(data.field);
				$.ajax({
					url : 'login.php',
					data : data.field,
					dataType : 'text',
					type : 'post',
					success : function(data) {
						if (data == '1') {
							location.href = "toLogin";
						} else {
							layer.msg('用户名已存在');
						}
					}
				})
				return false;
			})

		});
	</script>
</body>
</html>