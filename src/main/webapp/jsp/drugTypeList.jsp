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

		<button class="layui-btn " type="button" id="add-button">
			<i class="layui-icon">&#xe654;</i>添加
		</button>
		<button class="layui-btn layui-btn-danger" type="button"
			id="delBatch-button">
			<i class="layui-icon">&#xe640;</i>批量删除
		</button>
	</div>
	<table id="dg" lay-filter="demo" class="layui-table "></table>
	<script type="text/html" id="barDemo">
  <a class="layui-btn  layui-btn-xs" lay-event="edit"><i class="layui-icon">&#xe642;</i>编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><i class="layui-icon">&#xe640;</i>删除</a>
    </script>
	<script type="text/html" id="edit-drugtype-form">
  <form class="layui-form" action=""  lay-filter="edit-drugtype-form">
  <div class="layui-form-item">
    <label class="layui-form-label">药品类型:</label>
    <div class="layui-input-block">
      <input type="text" name="drugtypname" required  lay-verify="required" placeholder="药品类型" class="layui-input">
      <input type="hidden" name="drugtypeid"   l  class="layui-input">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">类型简介:</label>
    <div class="layui-input-block">
      <textarea name="drugtypdesc" required  lay-verify="required" placeholder="类型简介" class="layui-textarea"></textarea>
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


	<script type="text/html" id="add-drugtype-form">
  <form class="layui-form" action=""  lay-filter="add-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">药品类型:</label>
    <div class="layui-input-block">
      <input type="text" name="drugtypname" required  lay-verify="required" placeholder="药品类型" class="layui-input">
   
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">类型描述:</label>
    <div class="layui-input-block">
      <textarea name="drugtypdesc" required  lay-verify="required" placeholder="类型描述" class="layui-textarea"></textarea>
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
	<script src="../layui/layui.all.js"></script>
	<script type="text/javascript">
		layui.use([ 'table', 'form', 'layer' ], function() {
			var table = layui.table;
			var form = layui.form;
			var layer = layui.layer;
			var $ = layui.$ //重点处
			table.render({
				elem : '#dg',
				url : '../findDrugTypeWithPage',
				page : true,
				cols : [ [ //表头
				{
					field : 'drugtypeid',
					title : '科室ID',
					type : 'checkbox'
				}, {
					field : 'drugtypname',
					title : '药品类型名称',
				}, {
					field : 'drugtypdesc',
					title : '类型描述',
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
					var drugtypeid=[];
					var   array=dg.data;
					for(var i in array){
						drugtypeid.push(array[i].drugtypeid);
					}
					$.post('../delBatchDrugtypeInfo',{'drugtypeids[]':drugtypeid},function(flag){
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
					area : [ '500px', '400px' ],
					content : $("#add-drugtype-form").html()
				});
				//添加提交
				form.on('submit(add-form-submit)', function(data) {
					$.post('../saveDrugtypeInfo', data.field, function(flag) {
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
				var drugtype = obj.data;//获得obj对象data属性，该属性中有点击改行获得一条科室数据
				if (layEvent === 'del') {
					layer.confirm('真的删除行么', function(index) {
						$.post('../delDrugtypeInfo', {
							drugtypeid : drugtype.drugtypeid
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
						title : '编辑科室信息',
						area : [ '500px', '300px' ],
						content : $("#edit-drugtype-form").html()
					});
					$.post('../getDrugtypeInfo', {
						drugtypeid : drugtype.drugtypeid
					}, function(d) {
						form.val("edit-drugtype-form", {//填充表单
							"drugtypeid" : d.drugtypeid // "name": "value"
							,
							"drugtypname" : d.drugtypname // "name": "value"
							,
							"drugtypdesc" : d.drugtypdesc
							,
						})
					})

				}
			});
			//修改提交
			form.on('submit(edit-form-submit)', function(data) {
				$.post('../updateDrugtypeInfo', data.field, function(flag) {
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