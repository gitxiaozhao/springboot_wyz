<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1/001
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- easyUI -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-easyui-1.5.4.5/themes/gray/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/jquery-easyui-1.5.4.5/themes/icon.css">

</head>
<body>
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'north',split:true,border:0" style="height:100px;"></div>
        <div data-options="region:'west',split:true,border:0" style="width:200px;">

            <a  href="javascript:action('权限','<%=request.getContextPath() %>/jsp/quanxian.jsp')" class="easyui-linkbutton" >权限</a>
        </div>
        <div id="tt" class="easyui-tabs" data-options="region:'center',split:true,border:0" style=""></div>
    </div>


    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.0.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui-1.5.4.5/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui-1.5.4.5/jquery.easyui.min.js"></script>
    <!-- 汉化 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-easyui-1.5.4.5/locale/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/util-js.js"></script>

    <script>
        function action(tabsname,urlStr){
            if($('#tt').tabs('exists',tabsname)){
//		 	select	:选择某个选项卡面板
                $('#tt').tabs('select',tabsname)
            }else{// 如果此选项卡面板没有打开过 ，则 添加选项卡面板
                $('#tt').tabs('add',{
                    title:tabsname,
                    href:urlStr,
                    closable:true,

                });
            }
        }

    </script>
</body>
</html>
