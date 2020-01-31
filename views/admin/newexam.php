<form class="layui-form" action="/admin/newexam" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">题库名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="题库名称是必填项，不能为空？" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学科</label>
        <div class="layui-input-block">
            <select name="s_id" lay-filter="aihao">
                <option value=""></option>
                <?php foreach ($subject as $value) { ?>
                    <option value="<?= $value['s_id']?>"><?= $value['subject']?></option>
                <?php }?>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="content"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select name="type" lay-filter="aihao">
                <option value=""></option>
                <option value="1">题库</option>
                <option value="2">测试</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否在题库显示</label>
        <div class="layui-input-block">
            <select name="is_active" lay-filter="aihao">
                <option value=""></option>
                <option value="0">否</option>
                <option value="1">是</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="/js/layui.js" charset="utf-8"></script>

<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            // layer.alert(JSON.stringify(data.field), {
            //     title: '最终的提交信息'
            // })
            // return false;
        });


    });
</script>