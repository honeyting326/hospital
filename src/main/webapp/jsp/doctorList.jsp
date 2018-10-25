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
		医生名称:
		<div class="layui-inline">
			<input class="layui-input" id="docname">
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
	<table id="dg" lay-filter="demo" class="layui-table "></table>
	
	<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    </script>
	
	<script type="text/html" id="add-doctor-form">
  <form class="layui-form" action=""  lay-filter="edit-load-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">姓名:</label>
    <div class="layui-input-block">
      <input type="text" name="docname" required  lay-verify="required" placeholder="请输入姓名" class="layui-input">
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">科室:</label>
    <div class="layui-input-block">
      <select name="did" id="selectDept" lay-verify="required" lay-search>
      <option value="">请选择科室</option>
      </select>
    </div>
  </div>
    <div class="layui-form-item">
     <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女" checked>
        </div>
    </div>

  <div class="layui-form-item">
    <label class="layui-form-label">专业:</label>
    <div class="layui-input-block">
      <textarea name="major" required  lay-verify="required" placeholder="请输入专业" class="layui-textarea"></textarea>
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">电话:</label>
    <div class="layui-input-block">
      <textarea name="tel" required  lay-verify="required|phone" placeholder="请输入电话" class="layui-textarea"></textarea>
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">简介:</label>
    <div class="layui-input-block">
      <textarea name="docdesc" placeholder="请输入简介" class="layui-textarea"></textarea>
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
	
	<script type="text/html" id="edit-doctor-form">
  <form class="layui-form" action=""  lay-filter="edit-load-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">姓名:</label>
    <div class="layui-input-block">
      <input type="text" name="docname" required  lay-verify="required" placeholder="请输入姓名" class="layui-input">
       <input type="hidden" name="docid" >
</div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">科室:</label>
    <div class="layui-input-block">
      <select name="did" id="selectDept" lay-verify="required" lay-search>
      <option value="">请选择科室</option>
      </select>
    </div>
  </div>
    <div class="layui-form-item">
     <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男">
            <input type="radio" name="sex" value="女" title="女" checked>
        </div>
    </div>

  <div class="layui-form-item">
    <label class="layui-form-label">专业:</label>
    <div class="layui-input-block">
      <textarea name="major" required  lay-verify="required" placeholder="请输入专业" class="layui-textarea"></textarea>
    </div>
  </div>
 <div class="layui-form-item">
    <label class="layui-form-label">电话:</label>
    <div class="layui-input-block">
      <textarea name="tel" required  lay-verify="required|phone" placeholder="请输入电话" class="layui-textarea"></textarea>
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">简介:</label>
    <div class="layui-input-block">
      <textarea name="docdesc" placeholder="请输入简介" class="layui-textarea"></textarea>
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





	<script type="text/javascript" src="../layui/jquery.min.js"></script>
	<script src="../layui/layui.all.js"></script>

	<script type="text/javascript">
		layui.use([ 'table', 'form', 'layer' ], function() {
			var table = layui.table;
			var form = layui.form;
			var layer = layui.layer;
		
			table.render({
				elem : '#dg',
				url : '../findDoctorWithPage',
				page : true,
				cols : [ [ //表头
				{
					field : 'docid',
					title : '医生ID',
					type : 'checkbox'
				}, {
					field : 'docname',
					title : '医生名称',
				}, {
					field : 'sex',
					title : '性别',
				}, {
					field : 'major',
					title : '专业',
				}, 
				{
                    field : 'tel',
                    title : '电话',
                },{
					field : 'docdesc',
					title : '简介',
				}, {
					field : 'dName',
					title : '所属科室',
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
					var docids=[];
					var   array=dg.data;
					for(var i in array){
						docids.push(array[i].docid);
					}
					$.post('../delBatchDoctorInfo',{'docids[]' : docids},function(flag){
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
						docname:$("#docname").val()
					}
					
				})
			})
			$("#add-button").click(function() {
				layer.open({
					type : 1,
					area : [ '500px', '300px' ],
					content : $("#add-doctor-form").html()
				});
				$.post('../findDeptAllInfo', function(data) {
					
                    for ( var i in data) {
                        $("#selectDept").append(
                                "<option value="+data[i].dId+">"
                                        + data[i].dName + "</option>")
                                        
                    }
                    form.render();
                })

				
				//添加提交
				form.on('submit(add-form-submit)', function(data) {
					$.post('../saveDoctorInfo', data.field, function(flag) {
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
			})

			

			//监听工具条
			table.on('tool(demo)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
				var layEvent = obj.event; //获得 lay-event 对应的值
				var doctor = obj.data;//获得obj对象data属性，该属性中有点击改行获得一条科室数据
				if (layEvent === 'del') {
					layer.confirm('真的删除行么', function(index) {
						$.post('../delDoctorInfo', {
							docid : doctor.docid
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
					$.post('../findDeptAllInfo', function(data) {
                        for ( var i in data) {
                            $("#selectDept").append(
                                    "<option value="+data[i].dId+">"
                                            + data[i].dName + "</option>")
                        }
                        form.render();
                    })
					layer.open({
						type : 1,
						title : '修改医生信息',
						area : [ '500px', '300px' ],
						content : $("#edit-doctor-form").html()
					});
					$.post('../getDoctorInfo', {
						docid : doctor.docid
					}, function(doc) {
						form.val("edit-load-form-data", {//填充表单
							"docid" : doc.docid,
                            "docname" : doc.docname,
                            "did" : doc.did,
                            "major" : doc.major,
                            "docdesc" : doc.docdesc,
                            "tel" : doc.tel,
                            "sex" : doc.sex,
						})
					})

				}
			});

			
			//修改提交
			form.on('submit(edit-form-submit)', function(data) {
				$.post('../updateDoctorInfo', data.field, function(flag) {
					if (flag) {
						layer.msg('操作成功');
						table.reload('dg', {});//操作成功刷新表格
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