<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>学生成绩信息管理系统</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">学生成绩信息管理系统</div>
    <!-- 1、头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">首页</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">舞居
        </a>
      </li>
      <li class="layui-nav-item"><a href="">登出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 2、左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">学生信息管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" id="addScore">成绩添加</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">学生用户管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">用户添加</a></dd>
            <dd><a href="javascript:;">用户更新</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 3、内容主体区域 -->
    <div style="padding: 15px;">
    <div class="layui-card">
    <!-- 卡片头开始 -->
	  <div class="layui-card-header">
	  	<div class="layui-item">
        <form class="layui-form" action="" lay-filter="searchFormFilter">
        <div class="layui-inline">
          <!--卡片搜索功能 -->
          <label class="layui-form-label">学生姓名</label>
          <div class="layui-input-block">
            <input type="text" name="userid" placeholder="请输入" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-inline">
          <button class="layui-btn layuiadmin-btn-admin" lay-submit="" lay-filter="searchFilter">
            <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
          </button>
        </div>
        </form>
      </div>
	  </div>
	  <!-- 卡片头结束 -->
	  <!-- 卡片身体开始 -->
	  <div class="layui-card-body">

    	<table class="layui-hide" id="test" lay-filter="test"></table>

	  </div>
	  <!-- 卡片身体结束 -->
	</div>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 4、底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">选中学生行信息</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">选中学生信息数</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">全选验证</button>
  </div>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">修&nbsp;&nbsp;&nbsp;改</a>
</script>

<!-- 1、成绩修改功能表单，默认为不可见 -->
<div style="display: none" id="EditDiv">
	<form class="layui-form" action="" lay-filter="FormFilter">
	<input type="hidden" name="id"/>
  <div class="layui-form-item">
    <label class="layui-form-label">学生姓名</label>
    <div class="layui-input-block">
      <input type="text" name="userid" required  lay-verify="required" placeholder="请输入学生姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生年级</label>
    <div class="layui-input-block">
      <select name="gradeid" lay-verify="required" id="gradeidSel">
        <option value="-1">---请选择---</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">英语成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="english" required lay-verify="required" placeholder="请输入英语成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">政治成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="politics" required lay-verify="required" placeholder="请输入政治成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课一成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="major1" required lay-verify="required" placeholder="请输入专业课一成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课二成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="major2" required lay-verify="required" placeholder="请输入专业课二成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div><!-- 1、成绩修改功能表单结束 -->
<!-- 1、成绩添加功能表单，默认为不可见 -->
<div style="display: none" id="AddDiv">
	<form class="layui-form" action="" lay-filter="addFormFilter">
	<input type="hidden" name="id"/>
  <div class="layui-form-item">
    <label class="layui-form-label">学生姓名</label>
    <div class="layui-input-block">
      <input type="text" name="userid" required  lay-verify="required" placeholder="请输入学生姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">学生年级</label>
    <div class="layui-input-block">
      <select name="gradeid" lay-verify="required" id="addGradeidSel">
        <option value="-1">---请选择---</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">英语成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="english" required lay-verify="required" placeholder="请输入英语成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">政治成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="politics" required lay-verify="required" placeholder="请输入政治成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课一成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="major1" required lay-verify="required" placeholder="请输入专业课一成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课二成绩</label>
    <div class="layui-input-inline">
      <input type="text" name="major2" required lay-verify="required" placeholder="请输入专业课二成绩" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="addForm">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div><!-- 1、成绩添加功能表单结束 -->

<script src="bower_components/layui/dist/layui.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>

<script>
/* 0、表格功能all */
layui.use(['table','form'], function(){
  var table = layui.table;
  var form=layui.form;
  
  /* 1、表格遍历显示功能a */
  table.render({
    elem: '#test'
    ,url:'score/list'
    ,toolbar: '#toolbarDemo' // ①开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { // ②自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,title: '用户数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'userid', title:'学生姓名', width:130, sort: true}
      ,{field:'gradeid', title:'学生年级', width:110, sort: true}
      ,{field:'english', title:'英语成绩', width:130, sort: true}
      ,{field:'politics', title:'政治成绩', width:130, sort: true}
      ,{field:'major1', title:'专业课一成绩', width:140, sort: true}
      ,{field:'major2', title:'专业课二成绩', width:140, sort: true}
      ,{fixed: 'right', title:'操 作', toolbar: '#barDemo', sort: true}
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
  
  /* 2、头工具栏事件功能all */
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
    	// ①选中学生行信息
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      	// ②选中学生信息数
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      	// ③验证全选
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
      	// ④自定义头工具栏右侧图标 - 提示
      case 'LAYTABLE_TIPS':
        layer.alert('这是工具栏右侧自定义的一个图标按钮');
      break;
    };
  });
  
  /* 3、监听操作列事件之年级回显功能a */
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'edit'){
    	layer.open({
			type:1,
			content:$("#EditDiv"),
			area:['35%','78%'],
			success: function(layero, index){
				   form.val("FormFilter",data);
				   layui.$("#gradeidSel").empty();
					 layui.$("#gradeidSel").append("<option value='-1'>---请选择---<option>");
				   layui.$.post("grade/findAll",function(data){
						for(var i=0;i<data.length;i++){
							var op=new Option(data[i].name,data[i].id);
							layui.$("#gradeidSel").append(op);
							if(data[i].id==obj.data.gradeid){
								op.selected=true;
							}
						}
						form.render('select');//动态更新插入的新option，要不然select选项无法显示
				   });
			}	
        });
    }
  });
  
  /* 3、监听操作列事件之年级提交功能b */
  form.on('submit(formDemo)', function(data){
	  layui.$.post("score/update",data.field,function(res){
		  layer.closeAll();
			if(res.code==0){	
				table.reload('test', {
					  url: 'score/list'
					});
			}else{
				layer.msg(res.msg, 
					{
					  icon: 2,
					  time: 3000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
					  
					});
			}
		  });
	  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
  });

  
});
</script>
<script type="text/javascript">
layui.use(['table','form'], function(){
	var table = layui.table;
	 var form=layui.form;
	$("#addScore").click(function(){
		layer.open({
			type:1,
			content:$("#AddDiv"),
			area:['35%','78%'],
			success: function(layero, index){
				 form.val("addFormFilter",{"gradeid":"-1"});
				 layui.$("#addGradeidSel").empty();
				 layui.$("#addGradeidSel").append("<option value='-1'>---请选择---<option>");				   
				 layui.$.post("grade/findAll",function(data){
						for(var i=0;i<data.length;i++){
							var op=new Option(data[i].name,data[i].id);
							layui.$("#addGradeidSel").append(op);
						}
						form.render('select');//动态更新插入的新option，要不然select选项无法显示
				   });
			}	
        });
	});
	 /* 3、监听操作列事件之年级提交功能b */
	  form.on('submit(addForm)', function(data){
		  layui.$.post("score/update",data.field,function(res){
			  layer.closeAll();
				if(res.code==0){	
					table.reload('test', {
						  url: 'score/list'
						});
				}else{
					layer.msg(res.msg, 
						{
						  icon: 2,
						  time: 3000 //2秒关闭（如果不配置，默认是3秒）
						}, function(){
						  
						});
				}
			  });
		  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
	  });
	  /* 3、监听操作列事件之搜索功能 */
	  form.on('submit(searchFilter)', function(data){
			table.reload('test', {
				url: 'score/list'
				,where: data.field //设定异步数据接口的额外参数
			});
				  return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
			
	  });
});
</script>
</body>
</html>