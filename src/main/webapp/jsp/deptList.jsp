<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>科室信息管理</title>
<meta charset="utf-8">
<meta name="viewport"
    content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div class="demoTable">
&nbsp&nbsp&nbsp&nbsp科室：

  <div class="layui-inline">
    <input name="id" class="layui-input" id="deptname" >
  </div>
        <button class="layui-btn" data-type="reload" id="search-button">
             <i class="layui-icon">&#xe615;</i> 搜索
         </button>
        <button class="layui-btn layui-btn-warm" type="button" id="add-button">
            <i class="layui-icon">&#xe654;</i>添加
        </button>
        <button class="layui-btn layui-btn-danger" type="button"
            id="delBatch-button">
            <i class="layui-icon">&#xe640;</i>批量删除
        </button>
</div>

    <table id="dg" lay-filter="demo"></table>
    <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
    <i class="layui-icon">&#xe642;</i>编辑 
  </a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
    <i class="layui-icon">&#xe640;</i>删除
  </a>
    </script>
    <script type="text/html" id="edit-dept-form">
  <form class="layui-form" action=""  lay-filter="edit-load-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">科室名称:</label>
    <div class="layui-input-block">
      <input type="text" name="dName" required  lay-verify="required" placeholder="科室名称" class="layui-input">
      <input type="hidden" name="dId"   l  class="layui-input">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">科室简介:</label>
    <div class="layui-input-block">
      <textarea name="dDesc" required  lay-verify="required" placeholder="科室简介" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit  lay-filter="edit-form-submit">提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</script>

<script type="text/html" id="add-dept-form">
  <form class="layui-form" action=""  lay-filter="add-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">科室名称:</label>
    <div class="layui-input-block">
      <input type="text" name="dName" required  lay-verify="required" placeholder="科室名称" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">科室简介:</label>
    <div class="layui-input-block">
      <textarea name="dDesc" required  lay-verify="required" placeholder="科室简介" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit  lay-filter="add-form-submit">提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</script>
    <script type="text/javascript" src="../layui/jquery.min.js"></script>
    <script src="../layui/layui.all.js"></script>

    <script type="text/javascript">
        layui.use([ 'table', 'form', 'layer' ], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            table.render({
                elem : '#dg',
                url : '../findDeptWithPage',
                page : true,
                cols : [ [ //表头
                {
                    field : 'dId',
                    title : '科室ID',
                    type : 'checkbox'
                }, {
                    field : 'dName',
                    title : '科室名称',
                }, {
                    field : 'dDesc',
                    title : '科室简介',
                }, {
                    title : '操作',
                    toolbar : '#barDemo'
                } ] ]
            });


          //批量删除
            $("#delBatch-button").click(function(){
                var  dg=table.checkStatus('dg');
                if(dg.data.length==0){
                    layer.msg('请选择要删除的数据', {icon: 5});
                }else {
                    var did=[];
                    var   array=dg.data;
                    for(var i in array){
                        did.push(array[i].dId);
                    }
                    $.post('../delBatchDeptInfo',{'dids[]':did},function(flag){
                        if(flag){
                            layer.msg('删除成功', {icon: 6});
                            table.reload('dg');
                        }else{
                            layer.msg('删除失败', {icon: 5});
                        }
                    })
                }
            })
            //表格条件查询
            $("#search-button").click(function(){
                table.reload('dg',{
                    where:{
                        deptname:$("#deptname").val()
                    }
                    
                })
            })

            $("#add-button").click(function() {
                layer.open({
                    type : 1,
                    area : [ '500px', '300px' ],
                    title : '添加科室信息',
                    content : $("#add-dept-form").html()
                });

              //添加提交
                form.on('submit(add-form-submit)', function(data) {
                    $.post('../saveDeptInfo', data.field, function(flag) {
                        if (flag) {
                            layer.msg('添加成功');
                            table.reload('dg',{});//操作成功刷新表格
                            layer.closeAll('page');//关闭当前页面弹出层
                            
                        } else {
                            layer.msg('添加失败');
                        }
                    })
                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });
            })
            
            
                
                
           
            

            //监听工具条
            table.on('tool(demo)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
                var layEvent = obj.event; //获得 lay-event 对应的值
                var dept = obj.data;//获得obj对象data属性，该属性中有点击改行获得一条科室数据
                if (layEvent === 'del') {
                    layer.confirm('真的删除行么', function(index) {
                    	$.post('../delDeptInfo', {
                            did : dept.dId
                        }, function(flag) {
                            if (flag) {
                                layer.msg('删除成功');
                                table.reload('dg', {});//操作成功刷新表格
                            } else {
                                layer.msg('删除失败');
                            }

                        })
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if (layEvent === 'edit') {
                    layer.open({
                        type : 1,
                        title : '添加科室信息',
                        area : [ '500px', '300px' ],
                        content : $("#edit-dept-form").html()
                    });
                    $.post('../getDeptInfo', {
                        dId : dept.dId
                    }, function(d) {
                        form.val("edit-load-form-data", {//填充表单
                            "dName" : d.dName // "name": "value"
                            ,
                            "dId" : d.dId // "name": "value"
                            ,
                            "dDesc" : d.dDesc
                        })
                    })

                }
            });
            //修改提交
                form.on('submit(edit-form-submit)', function(data) {
                    $.post('../updateDeptInfo', data.field, function(flag) {
                        if (flag) {
                            layer.msg('操作成功');
                            table.reload('dg',{});//操作成功刷新表格
                            layer.closeAll('page');//关闭当前页面弹出层
                            
                        } else {
                            layer.msg('操作失败');
                        }
                    })
                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });
        

        });
    </script>
</body>
</html>