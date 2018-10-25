<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>药品信息管理</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
	<div class="demoTable">
		药品名称:
		<div class="layui-inline">
			<input class="layui-input" id="drugname">
		</div>

		<button class="layui-btn" data-type="reload" id="search-button">
			<i class="layui-icon">&#xe615;</i> 搜索
		</button>
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
	<script type="text/html" id="edit-drug-form">
   <form class="layui-form" action=""  lay-filter="edit-drug-form">
  <div class="layui-form-item">
    <label class="layui-form-label">药品名称:</label>
    <div class="layui-input-block">
      <input type="text" name="drugname" required  lay-verify="required" placeholder="请输入药品名称" class="layui-input">
      <input type="hidden" name="drugid">
	</div>
  </div>

	<div class="layui-form-item">
    <label class="layui-form-label">药品说明:</label>
    <div class="layui-input-block">
      <textarea type="text" name="ddesc" required  lay-verify="required" placeholder="请输入药品说明" class="layui-textarea"></textarea>
   
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">生产厂家:</label>
    <div class="layui-input-block">
      <input name="manufacturer" required  lay-verify="required" placeholder="请输入生产厂家" class="layui-input">
    </div>
  </div>


<div class="layui-form-item">
    <label class="layui-form-label">所属类型</label>
    <div class="layui-input-block">
      <select name="drugtypeid" lay-verify="required" id="selectdrugtype" required lay-search>
		 <option value="">请选择药品类型</option>
      </select>
    </div>
  </div>

	<div class="layui-form-item">
    <label class="layui-form-label">库存数量:</label>
    <div class="layui-input-block">
      <input type="text" name="quantity" required  lay-verify="required" placeholder="请输入库存数量" class="layui-input">
    </div>
  </div>


	<div class="layui-form-item">
    <label class="layui-form-label">备注:</label>
    <div class="layui-input-block">
      <input type="text" name="remark" required  lay-verify="required" placeholder="请输入药品备注" class="layui-input">
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


	<script type="text/html" id="add-drug-form">
  <form class="layui-form" action=""  lay-filter="add-form-data">
  <div class="layui-form-item">
    <label class="layui-form-label">药品名称:</label>
    <div class="layui-input-block">
      <input type="text" name="drugname" required  lay-verify="required" placeholder="请输入药品名称" class="layui-input">
    </div>
  </div>

	<div class="layui-form-item">
    <label class="layui-form-label">药品说明:</label>
    <div class="layui-input-block">
      <textarea type="text" name="ddesc" required  lay-verify="required" placeholder="请输入药品说明" class="layui-textarea"></textarea>
   
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">生产厂家:</label>
    <div class="layui-input-block">
      <input name="manufacturer" required  lay-verify="required" placeholder="请输入生产厂家" class="layui-input">
    </div>
  </div>


<div class="layui-form-item">
    <label class="layui-form-label">所属类型</label>
    <div class="layui-input-block">
      <select name="drugtypeid" id="selectdrugtype" lay-verify="required" lay-search>
		 <option value="">请选择药品类型</option>
      </select>
    </div>
  </div>
  



	<div class="layui-form-item">
    <label class="layui-form-label">库存数量:</label>
    <div class="layui-input-block">
      <input type="text" name="quantity" required  lay-verify="required" placeholder="请输入库存数量" class="layui-input">
    </div>
  </div>


	<div class="layui-form-item">
    <label class="layui-form-label">备注:</label>
    <div class="layui-input-block">
      <input type="text" name="remark" required  lay-verify="required" placeholder="请输入药品备注" class="layui-input">
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
				url : '../findDrugWithPage',
				page : true,
				cols : [ [ //表头
				{
					field : 'drugid',
					title : '科室ID',
					type : 'checkbox'
				}, {
					field : 'drugname',
					title : '药品名称',
				}, {
					field : 'ddesc',
					title : '药品说明',
				}, {
					field : 'manufacturedate',
					title : '生成日期',
				}, {
					field : 'manufacturer',
					title : '生成厂家',
				}, {
					field : 'drugtypname',
					title : '所属类型',
				}, {
					field : 'drugtypeid',
					title : '类型ID',
				}, {
					field : 'quantity',
					title : '库存数量',
				}, {
					field : 'remark',
					title : '备注',
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
					var   drugid=[];
					var   array=dg.data;
					for(var i in array){
						drugid.push(array[i].drugid);
					}
					$.post('../delBatchDrugInfo',{'drugids[]':drugid},function(flag){
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
						drugname:$("#drugname").val()
					}
					
				})
			})
			
			$("#add-button").click(function() {
				layer.open({
					type : 1,
					area : [ '600px', '300px' ],
					 title : '添加药品信息',
					content : $("#add-drug-form").html()
				});
				

				$.post('../findDrugTypeAllInfo', function(data) {					
                    for ( var i in data) { 
                      
                        $("#selectdrugtype").append(
                                "<option value="+data[i].drugtypeid+">"
                                        + data[i].drugtypname + "</option>")
                                      
                    }
                    form.render();
                })
               

				//添加提交
				form.on('submit(add-form-submit)', function(data) {
					$.post('../saveDrugInfo', data.field, function(flag) {
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
				var drug = obj.data;//获得obj对象data属性，该属性中有点击改行获得一条科室数据
				if (layEvent === 'del') {
					layer.confirm('真的删除行么', function(index) {
						$.post('../delDrugInfo', {
							drugid : drug.drugid
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
					$.post('../findDrugTypeAllInfo', function(data) {
						for ( var i in data) {
							$("#selectdrugtype").append(
									"<option value="+data[i].drugtypeid+">"
											+ data[i].drugtypname + "</option>")
						}
						form.render();
					})
					layer.open({
						type : 1,
						title : '编辑药品信息',
						area : [ '500px', '300px' ],
						content : $("#edit-drug-form").html()
					});
					
					$.post('../getDrugInfo', {
						drugid : drug.drugid	
					}, function(d) {
						form.val("edit-drug-form", {//填充表单
							"drugid" : d.drugid // "name": "value"
							,
							"drugname" : d.drugname // "name": "value"
							,
							
							"ddesc" : d.ddesc
							,
							"manufacturer" : d.manufacturer
							,
							"drugtypname" : d.drugtypname
							,
							"drugtypeid" : d.drugtypeid
							,
							"quantity" : d.quantity
							,
							"remark" : d.remark
							,
						})
					} )

				}
			});
			//修改提交
			form.on('submit(edit-form-submit)', function(data) {
				$.post('../updateDrugInfo', data.field, function(flag) {
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