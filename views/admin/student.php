<div class="demoTable">
    搜索班级：
    <div class="layui-inline">
        <input class="layui-input" name="class" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>
<table class="layui-table" lay-data="{url:'/admin/getstudent/', id:'ysdata',page: true}" lay-filter="ysdata" id="ysdata">
    <thead>
    <tr>
        <th lay-data="{field: 'id', title: 'ID', sort: true,align: 'center',width:65}">ID</th>
        <th lay-data="{field: 'username', title: '用户名',align: 'center', edit: 'text',width:205}">用户名</th>
        <th lay-data="{field: 'password', title: '密码', edit: 'text',align: 'center'}">密码</th>
        <th lay-data="{field: 'class', title: '班级',sort: true, edit: 'text',align: 'center'}">班级</th>
        <th lay-data="{field: 'role', title: '角色', align: 'center'}">角色</th>
        <th lay-data="{field: 'create_time', title: '创建时间',sort: true}">创建时间</th>
        <th lay-data="{field: 'update_time', title: '创建时间',sort: true}">更新时间</th>
    </tr>
    </thead>
</table>

<script src="/js/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->

<script>
    layui.use('table', function(){
        var table = layui.table;

        // //第一个实例
        // table.render({
        //     elem: '#demo'
        //     ,url: '/admin/getstudent/' //数据接口
        //     // ,cellMinWidth: 80
        //     ,page: true //开启分页
        //     ,cols: [[ //表头
        //         {field: 'id', title: 'ID', sort: true,align: 'center',width:65}
        //         ,{field: 'username', title: '用户名',align: 'center', edit: 'text',width:205}
        //         ,{field: 'password', title: '密码', edit: 'text',align: 'center'}
        //         ,{field: 'class', title: '班级',sort: true, edit: 'text',align: 'center'}
        //         ,{field: 'role', title: '角色', edit: 'text',align: 'center'}
        //         ,{field: 'create_time', title: '创建时间',sort: true}
        //         ,{field: 'update_time', title: '更新时间', sort: true}
        //         // ,{field: 'classify', title: '职业', width: 80}
        //         // ,{field: 'wealth', title: '财富', width: 135, sort: true}
        //     ]]
        //     ,id: 'testReload',
        // });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('ysdata', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        key: demoReload.val()
                    }
                }, 'data');
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听单元格编辑
        table.on('edit(ysdata)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            $.ajax({
                type : "POST", //提交方式
                url : "/admin/updatestudent",//路径
                data : {
                    "id" : data.id,
                    "field" : field,
                    "value" : value,
                },//数据，这里使用的是Json格式进行传输
                success : function(result) {//返回数据根据结果进行相应的处理
                    if ( result.message == "success" ) {
                        layer.msg('[ID: '+ data.id +'] ' + field + ' 更改为：'+ value);
                        // $("#tipMsg").text("删除数据成功");
                        // tree.deleteItem("${org.id}", true);
                    } else {
                        // $("#tipMsg").text("删除数据失败");
                    }
                }
            });
        });

    });
</script>