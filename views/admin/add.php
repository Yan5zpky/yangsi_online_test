<form class="layui-form" action="/admin/addstudent" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="username" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">辅助文字</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <select name="class" lay-verify="required">
                <option value=""></option>
                <option value="000000">无</option>
                <option value="202201">1班</option>
                <option value="202202">2班</option>
                <option value="202203">3班</option>
                <option value="202204">4班</option>
                <option value="202205">5班</option>
                <option value="202206">6班</option>
                <option value="202207">7班</option>
                <option value="202208">8班</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">角色</label>
        <div class="layui-input-block">
            <input type="radio" name="role" value="0" title="教师">
            <input type="radio" name="role" value="2" title="学生" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="/js/layui.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            console.log(data);
            $.ajax({
                dataType: "json",
                type: 'POST',
                url: "/admin/addstudent",
                data: JSON.stringify(data.field),
                success: layer.msg("提交成功"),
            });

            return false;
        });
    });
</script>