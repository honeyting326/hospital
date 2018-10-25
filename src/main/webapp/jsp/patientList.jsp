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
&nbsp&nbsp&nbsp&nbsp
患者姓名：

  <div class="layui-inline">
    <input class="layui-input" id="pname" >
  </div>
        <button class="layui-btn" data-type="reload" id="search-button">
             <i class="layui-icon">&#xe615;</i> 搜索
         </button>
        <button class="layui-btn layui-btn-warm" type="button" id="add-patientnum-button">
            <i class="layui-icon">&#xe613;</i>患者挂号
        </button>
        <button class="layui-btn layui-btn-danger" type="button"
            id="delBatch-button">
            <i class="layui-icon">&#xe640;</i>批量删除
        </button>
</div>

   <table id="dg" lay-filter="demo"></table> 
    
    
    
    <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    </script>

    <script type="text/html" id="edit-patientnum-model">
  <form class="layui-form" action=""  lay-filter="edit-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">患&nbsp;者&nbsp;名&nbsp;称</label>
    <div class="layui-input-block">
      <input type="text" name="pname" required  lay-verify="required" placeholder="请输入患者名称" class="layui-input">
     <input type="hidden" name="pid"  class="layui-input">
   
    </div>
  </div> 
 <div class="layui-form-item">
    <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男"  checked>
      <input type="radio" name="sex" value="女" title="女" >
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄</label>
    <div class="layui-input-block">
      <input type="number" name="age" required  lay-verify="required" placeholder="请输入年龄" class="layui-input">
    </div>
  </div> 

 <div class="layui-form-item">
    <label class="layui-form-label">身&nbsp;&nbsp;&nbsp;份&nbsp;&nbsp;&nbsp;证</label>
    <div class="layui-input-block">
      <input type="text" name="idcard" required  lay-verify="required" placeholder="请输入身份证" class="layui-input">
    </div>
  </div> 
<div class="layui-form-item">
    <label class="layui-form-label">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室</label>
    <div class="layui-input-block">
      <select name="did" lay-verify="required" id="did" required  lay-filter="dept-name" lay-search>
        <option value="">请选择科室</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生</label>
    <div class="layui-input-block">
      <select name="docid" lay-verify="required" required  id="select-docnames" lay-search>
        <option value="">请选择医生</option>
      </select>
    </div>
  </div>

<div class="layui-form-item">
    <label class="layui-form-label">挂&nbsp;号&nbsp;类&nbsp;别</label>
    <div class="layui-input-block">
      <input type="radio" name="flagnum" value="专家号" title="专家号"  checked >
      <input type="radio" name="flagnum" value="普通号" title="普通号">
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
    
    
    
    
    <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">
    <i class="layui-icon">&#xe642;</i>编辑 
  </a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">
    <i class="layui-icon">&#xe640;</i>删除
  </a>
    </script>
    <script type="text/html" id="add-patientnum-form">
  <form class="layui-form" action=""  lay-filter="add-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">患者名称:</label>
    <div class="layui-input-block">
      <input type="text" name="pname" required  lay-verify="required" placeholder="请输入患者名称" class="layui-input">
   
    </div>
  </div> 
 <div class="layui-form-item">
    <label class="layui-form-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
    <div class="layui-input-block">
      <input type="radio" name="sex" value="男" title="男"  checked>
      <input type="radio" name="sex" value="女" title="女" >
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄:</label>
    <div class="layui-input-block">
      <input type="text" name="age" required  lay-verify="required" placeholder="请输入年龄" class="layui-input">
    </div>
  </div>
<div class="layui-form-item">
    <label class="layui-form-label">身&nbsp;&nbsp;&nbsp;份&nbsp;&nbsp;&nbsp;证</label>
    <div class="layui-input-block">
      <input type="text" name="idcard" required  lay-verify="required" placeholder="请输入身份证" class="layui-input">
    </div>
  </div>  
<div class="layui-form-item">
    <label class="layui-form-label">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;室</label>
    <div class="layui-input-block">
      <select name="did" lay-verify="required"  id="did" lay-filter="dept-name">
        <option value="">请选择科室</option>
      </select>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生</label>
    <div class="layui-input-block">
      <select name="docid" lay-verify="required"  id="select-docnames">
        <option value="">请选择医生</option>
      </select>
    </div>
  </div>

<div class="layui-form-item">
    <label class="layui-form-label">是否专家号</label>
    <div class="layui-input-block">
      <input type="radio" name="flagnum" value="专家号" title="专家号">
      <input type="radio" name="flagnum" value="普通号" title="普通号"  checked >
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


  
    <script src="../layui/layui.js"></script>

    <script type="text/javascript">
        layui.use([ 'table', 'form', 'layer' ,'jquery'], function() {
            var table = layui.table;
            var form = layui.form;
            var layer = layui.layer;
            var $=layui.$;
            table.render({
                elem : '#dg',
                url : '../findPatientWithPage',
                page : true,
                cols : [ [ //表头
                {
                    field : 'pid',
                    title : '科室ID',
                    type : 'checkbox'
                }, {
                    field : 'pnum',
                    title : '挂号码',
                },  {
                    field : 'did',
                    title : '科室',
                }, {
                    field : 'pname',
                    title : '患者名称',
                }, {
                    field : 'sex',
                    title : '性别',
                }, {
                    field : 'age',
                    title : '年龄',
                }, {
                    field : 'idcard',
                    title : '身份证',
                }, {
                    field : 'flagnum',
                    title : '挂号类别',
                }, {
                    field : 'money',
                    title : '费用',
                }, {
                    field : 'docname',
                    title : '医生',
                }, {
                    field : 'remark',
                    title : '备注',
                }, {
                    title : '操作',
                    toolbar : '#barDemo'
                } ] ]
            });
          //查询
            $("#search-button").click(function() {
                table.reload("dg", {
                    where : {
                        pname : $("#pname").val()
                    }
                })
            })
            
            //批量删除
            $("#delBatch-button").click(function() {
                var dg = table.checkStatus('dg');
                if (dg.data.length == 0) {
                    layer.msg('请选择要删除的数据');
                } else {
                    var pid = [];
                    var array = dg.data;
                   
                    for ( var i in array) {
                        pid.push(array[i].pid);
                    }
                    console.log(pid);
                    $.post('../delBatchPatientInfo', {
                        'pids[]' : pid
                    }, function(flag) {
                        if (flag) {
                            layer.msg('删除成功', {
                                icon : 6
                            });
                            table.reload('dg');
                        } else {
                            layer.msg('删除失败', {
                                icon : 5
                            });
                        }
                    })
                }
            })
            
            
            table.on('tool(demo)', function(obj) {
                var event = obj.event;
                var patient = obj.data;
                if (event === 'del') {
                    layer.confirm('真的删除行么', function(index) {
                        $.post('../delPatientInfo', {
                            pid : patient.pid
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
                } else if (event === 'edit') {
                    layer.open({
                        title : '挂号',
                        type : 1,
                        area : [ '550px', '500px' ],
                        content : $("#edit-patientnum-model").html()
                    })
                    $.post('../findDeptAllInfo', function(data) {
                        for ( var i in data) {
                            $("#did").append(
                                    "<option value="+data[i].dId+">"
                                            + data[i].dName + "</option>");
                        }
                        //填充下拉列表
                        $("select[id='did']").val(patient.did);
                        form.render();
                    })
                    form.val('edit-form-data',{
                        "pid":patient.pid,
                        "pname":patient.pname,
                        "sex":patient.sex,
                        "flagnum":patient.flagnum,
                        "idcard":patient.idcard,
                        "age":patient.age,
                        
                    })
                    form.on('submit(edit-form-submit)',function(data){
                        //提交之前判断科室底下是否有医生
                        if($("select[name='docid']").val()==null||$("select[name='docid']").val()==''){
                            layer.msg('该科室底下没有医生',{icon:5});
                            return false;
                        }else{
                            $.post('../updatePatientInfo',data.field,function(flag){
                                if(flag){
                                    layer.msg('修改成功');
                                    table.reload('dg', {});//操作成功刷新表格
                                    layer.closeAll('page');
                                }else{
                                    layer.msg('修改失败');
                                }
                            });
                            return false;
                        }
                    
                    })
                    form.render();
                    return false;
                }
            })
            
            
         

            $("#add-patientnum-button").click(function() {
                layer.open({
                    type : 1,
                    area : [ '500px', '300px' ],
                    title : '添加挂号信息',
                    content : $("#add-patientnum-form").html()
                });
                
                $.post('../findDeptAllInfo', function(data) {
                    for ( var i in data) {
                        $("#did").append(
                                "<option value="+data[i].dId+">"
                                        + data[i].dName + "</option>")
                    }
                    form.render();
                })
            });
               
               //监听下拉列表是否被选中
               form.on('select(dept-name)', function(data) {
                $("#select-docnames").html("");//情况html代码
                $.post('../findDoctorByDid', {
                    'did' : data.value
                }, function(data) {
                    for ( var i in data) {
                        $("#select-docnames").append(
                                "<option value="+data[i].docid+">"
                                        + data[i].docname + "</option>")
                    }
                    form.render();//重新载入
               
                });
              //添加提交
                form.on('submit(add-form-submit)', function(data) {
                    $.post('../savePatientInfo', data.field, function(flag) {
                        if (flag) {
                            layer.msg('添加成功');
                            table.reload('dg', {});//操作成功刷新表格
                            layer.closeAll('page');//关闭当前页面弹出层
                        } else {
                            layer.msg('添加失败');
                        }
                    })
                    return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
                });

                form.render();
            });

        });
    </script>
</body>
</html>