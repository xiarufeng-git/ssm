<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<html>
<head>
    <title>Title</title>
    <base href="<%=basePath%>"/>
    <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript">
        $(function () {
            dataLoaderStudent();
            $("#btnLoader").click(function () {
                dataLoaderStudent();
            })
        })

        function dataLoaderStudent() {
            $.ajax({
                url: "student/queryStudent.do",
                dataType: "json",
                type: "get",
                success: function (resp) {
                    $("#info").html("")
                    $.each(resp, function (i, n) {
                        $("#info").append("<tr>").append("<td>" + n.id + "</td>").append("<td>" + n.name + "</td>").append("<td>" + n.age + "</td>").append("<tr>")
                    })
                }
            })
        }
    </script>
</head>
<body>
<div align="center">
    <table border="2px">
        <thead>
        <tr>
            <td>学号</td>
            <td>姓名</td>
            <td>年龄</td>
        </tr>
        </thead>
        <tbody id="info">

        </tbody>


    </table>
    <input type="button" id="btnLoader" value="查询数据"/>

</div>

</body>
</html>
