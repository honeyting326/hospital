<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title></title>
<link rel="stylesheet" href="layui/css/layui.css">
</head>
<body class="layui-layout-body">


    <script type="text/html" id="login-dialog">
<form class="layui-form" action="">
  <div class="layui-form-item">
    <label class="layui-form-label">用户名称:</label>
    <div class="layui-input-inline">
      <input type="text" name="uname" required  lay-verify="required" placeholder="请输入名称"  class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">用户账号:</label>
    <div class="layui-input-inline">
      <input type="password" name="account" required lay-verify="required"  placeholder="请输入密码"  class="layui-input">
    </div>
  
  </div>
 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="login-button"><i class="layui-icon">&#xe66f;</i> 登陆</button>
      <button type="reset" class="layui-btn layui-btn-primary"><i class="layui-icon">&#xe631;</i>重置</button>
    </div>
  </div>
</form>
    </script>
    <script src="layui/layui.all.js"></script>
    <script type="text/javascript">
        layui.use([ 'layer', 'form', 'jquery' ], function() {
            var layer = layui.layer
            var form = layui.form;
            var $ = layui.$ //重点处
            layer.open({
                type : 1,
                content : $("#login-dialog").html()
            });

            //登录
            form.on('submit(login-button)', function(data) {
                $.post('login', data.field, function(flag) {
                    if (flag == '1') {
                        window.location.href = "index.jsp";
                    } else if (flag == '0') {
                        layer.msg('用户名称输入错误', {
                            icon : 5
                        });
                    } else if (flag == '-1') {
                        layer.msg('用户密码输入错误', {
                            icon : 5
                        });
                    } else if (flag == '-2') {
                        layer.msg('系统出现故障', {
                            icon : 5
                        });
                    }
                })
                return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
            });

        })
    </script>
</body>
</html>
