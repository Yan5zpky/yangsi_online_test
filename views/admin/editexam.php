<form class="layui-form" action="/admin/editexam" method="post">
    <input name="e_id" type="hidden" lay-verify="required" lay-reqtext="题库名称是必填项，不能为空？" placeholder="请输入" autocomplete="off" class="layui-input" value="<?= $exam->e_id?>">
    <div class="layui-form-item">
        <label class="layui-form-label">题库名称</label>
        <div class="layui-input-block">
            <input type="text" name="name" lay-verify="required" lay-reqtext="题库名称是必填项，不能为空？" placeholder="请输入" autocomplete="off" class="layui-input" value="<?= $exam == "" ? "" : $exam->name?>">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">学科</label>
        <div class="layui-input-block">
            <select name="s_id" lay-filter="aihao">
                <option value=""></option>
                <?php foreach ($subject as $value) { ?>
                    <option value="<?= $value['s_id']?>" <?= $value['s_id'] == $exam->s_id ? "selected='selected'" : ""?>><?= $value['subject']?></option>
                <?php }?>
            </select>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="content"><?= $exam == "" ? "" : $exam->content?></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">类型</label>
        <div class="layui-input-block">
            <select name="type" lay-filter="aihao">
                <option value=""></option>
                <option value="1" <?= $exam->type == 1 ? "selected='selected'" : ""?>>题库</option>
                <option value="2" <?= $exam->type == 2 ? "selected='selected'" : ""?>>测试</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">是否在题库显示</label>
        <div class="layui-input-block">
            <select name="is_active" lay-filter="aihao">
                <option value=""></option>
                <option value="0" <?= $exam->is_active == 0 ? "selected='selected'" : ""?>>否</option>
                <option value="1" <?= $exam->is_active == 1 ? "selected='selected'" : ""?>>是</option>
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
            ,laydate = layui.laydate;

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            title: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [
                /^[\S]{6,12}$/
                ,'密码必须6到12位，且不能出现空格'
            ]
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

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

        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'datetime'
        });
        //日期时间选择器
        laydate.render({
            elem: '#test6'
            ,type: 'datetime'
        });
    });
</script>