<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>学生成绩信息管理</title>
<link rel="stylesheet" href="bower_components/layui/dist/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">layui 后台布局</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有商品</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div style="padding: 15px;">
    	<table class="layui-hide" id="test" lay-filter="test"></table>
    </div>
  </div>
  
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © layui.com - 底部固定区域
  </div>
</div>
<script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">修改</a>
</script>
<!-- 成绩修改表单，默认为不可见 -->
<div style="display: none" id="EditDiv">
	<form class="layui-form" action="" lay-filter="FormFilter">
	<input type="hidden" name="id"/>
  <div class="layui-form-item">
    <label class="layui-form-label">学生姓名</label>
    <div class="layui-input-block">
      <input type="text" name="userid" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">年级</label>
    <div class="layui-input-block">
      <select name="gradeid" lay-verify="required" id="gradeidSel">
        <option value="-1">---请选择---</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">英语</label>
    <div class="layui-input-inline">
      <input type="text" name="english" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">政治</label>
    <div class="layui-input-inline">
      <input type="text" name="politics" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课一</label>
    <div class="layui-input-inline">
      <input type="text" name="major1" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">专业课二</label>
    <div class="layui-input-inline">
      <input type="text" name="major2" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div>
<!-- 表单结束 -->
<script src="bower_components/layui/dist/layui.js"></script>
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script>
layui.use(['table','form'], function(){
  var table = layui.table;
  var form=layui.form;
  table.render({
    elem: '#test'
    ,url:'score/list'
    ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
    ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
      title: '提示'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
    ,title: '用户数据表'
    ,cols: [[
      {type: 'checkbox', fixed: 'left'}
      ,{field:'id', title:'ID', width:80, fixed: 'left', unresize: true, sort: true}
      ,{field:'userid', title:'学生姓名', width:120}
      ,{field:'gradeid', title:'年级', width:150, sort: true}
      ,{field:'english', title:'英语', width:80, sort: true}
      ,{field:'politics', title:'政治', width:100, sort: true}
      ,{field:'major1', title:'专业课一', width:100, sort: true}
      ,{field:'major2', title:'专业课二', sort: true}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
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
  
  //头工具栏事件
  table.on('toolbar(test)', function(obj){
    var checkStatus = table.checkStatus(obj.config.id);
    switch(obj.event){
      case 'getCheckData':
        var data = checkStatus.data;
        layer.alert(JSON.stringify(data));
      break;
      case 'getCheckLength':
        var data = checkStatus.data;
        layer.msg('选中了：'+ data.length + ' 个');
      break;
      case 'isAll':
        layer.msg(checkStatus.isAll ? '全选': '未全选');
      break;
      
      //自定义头工具栏右侧图标 - 提示
      case 'LAYTABLE_TIPS':
        layer.alert('这是工具栏右侧自定义的一个图标按钮');
      break;
    };
  });
  
  //监听操作列事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'edit'){
    	layer.open({
			type:1,
			content:$("#EditDiv"),
			area:['35%','78%'],
			success: function(layero, index){
				   form.val("FormFilter",data);
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
  //监听提交
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
</body>
</html>