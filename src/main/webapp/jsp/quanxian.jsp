<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1/001
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'east',title:'权限',split:true,border:0" style="width:400px;">
            <a  href="javascript:addRoleQuanxian()" class="easyui-linkbutton" data-options="">赋给此角色权限</a>
            <input type="hidden" id="quanxianHidden" >
            <ul id="quanxiantree"></ul>
        </div>
        <div data-options="region:'west',title:'用户',split:true,border:0" style="width:400px;">
            <ul id="usertree"></ul>
        </div>
        <div data-options="region:'center',title:'角色',split:true,border:0" style="">
            <a  href="javascript:addUserRole()" class="easyui-linkbutton" data-options="">赋给此管理员角色</a>
            <input type="hidden" id="userHidden" >
            <ul id="roletree"></ul>
        </div>
    </div>
    <script>
        /*页面加载事件查询三棵树*/
        $(function(){
            queryUser();

            queryRole();

            queryQuanxian();
        })

        /*用户树+点击用户回显对应角色和权限*/
        function queryUser(){
            $("#usertree").tree({
                url:"<%=request.getContextPath()%>/springboot_wyz/userController/queryUser",
                checkbox:true,
                parentField:'pid',
                onClick:function(node){
                    /*把用户的ID存到隐藏域中，用户赋角色会用到*/
                    var userid = node.id;
                    $("#userHidden").val(userid);

                    /*先将回显数据全部清除*/
                    /*1.获取所有被选中的节点*/
                    var root = $("#roletree").tree("getChildren");
                    /*2.循环取消选中*/
                    for(var i = 0;i<root.length;i++){

                        $("#roletree").tree("uncheck", root[i].target);
                    }

                    /*查询对应用户的角色*/
                    $.ajax({
                        url:"<%=request.getContextPath() %>/springboot_wyz/userController/queryRoleById",
                        //传入用户的ID
                        data:{"userid":node.id},
                        type:"post",
                        dataType:"json",
                        success:function(data){
                            if (data==""){
                                alert("该用户没有角色")
                            }else{
                                var roleid = "";
                                //循环并选中
                                for(var i = 0;i<data.length;i++){
                                    // 查找一个节点并选择它
                                    var node = $('#roletree').tree('find', data[i].rid);
                                    $('#roletree').tree('check', node.target);

                                    roleid += ","+data[i].rid;
                                }
                                var roleids = roleid.substr(1);

                                //先将回显数据全部清除
                                //获取所有被选中的节点
                                var root = $("#quanxiantree").tree("getChildren");
                                //循环取消选中
                                for(var i = 0;i<root.length;i++){

                                    $("#quanxiantree").tree("uncheck", root[i].target);
                                }

                                //查询对应角色的权限
                                $.ajax({
                                    url:"<%=request.getContextPath() %>/springboot_wyz/userController/queryQuanxianByIds",
                                    //传入用户的ID
                                    data:{"roleids":roleids},
                                    type:"post",
                                    dataType:"json",
                                    success:function(data){
                                        //循环并选中
                                        for(var i = 0;i<data.length;i++){
                                            // 查找一个节点并选择它
                                            var node = $('#quanxiantree').tree('find', data[i].qid);
                                            $('#quanxiantree').tree('check', node.target);
                                        }
                                    }
                                });
                            }
                        }
                    });
                }
            })
        }

        /*角色树*/
        function queryRole(){
            $("#roletree").tree({
                url:"<%=request.getContextPath()%>/springboot_wyz/userController/queryRole",
                checkbox:true,
                parentField:'pid',
                onClick:function(node){

                }
            })
        }

        /*权限树*/
        function queryQuanxian(){
            $("#quanxiantree").tree({
                url:"<%=request.getContextPath()%>/springboot_wyz/userController/queryQuanxian",
                checkbox:true,
                parentField:'pid',
                onClick:function(node){

                }
            })
        }

        //点击一行用户数据触发事件，给用户赋角色
        function addUserRole() {
            //从隐藏域取出用户ID
            var userid = $("#userHidden").val()
            //获取当前用户所有被选中的角色ID
            var arr = $("#roletree").tree("getChecked");
            var roleIds = ""
            for (var i = 0; i < arr.length; i++) {
                roleIds+=","+arr[i].id
            }
            roleIds = roleIds.substr(1)
            //发送ajax请求
            $.ajax({
                url:"<%=request.getContextPath() %>/springboot_wyz/userController/updateUserRole",
                //传入用户的ID
                data:{"userid":userid,"roleIds":roleIds},
                type:"post",
                success:function(data){
                    alert("赋角色成功")
                    //重新查询角色和权限树
                    queryUser();
                    queryRole();
                    queryQuanxian();
                },
                error:function(){
                    alert("赋角色失败")
                    //服务器连接失败
                }

            });
        }
    </script>
</body>
</html>
