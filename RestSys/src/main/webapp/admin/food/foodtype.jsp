<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>餐台类型</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<c:url value='/webjars/jquery/3.6.0/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.1/js/bootstrap.min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.1/css/bootstrap.min.css'/> ">
    <script>
        /*页面加载时绑定事件*/
        $(function () {
            /*减少最大人数*/
            $(".reduce").click(function (){
                var count =$(this).next("span").text()-1;
                if (count<=0){
                    count=0;
                }
                var id=$(this).val()
                var btn =$(this);
                $.post(
                    "${pageContext.request.contextPath}/DeskTypeServlet",
                    {"count":count,"action":"updatePer","id":id},
                    function (data) {
                        btn.next("span").text(data);
                    });

            })
            /*增加最大人数*/
            $(".add").click(function (){
                var count =parseInt($(this).prev("span").text())+1;
                var id=$(this).val()
                var btn =$(this);
                $.post(
                    "${pageContext.request.contextPath}/DeskTypeServlet",
                    {"count":count,"action":"updatePer","id":id},
                    function (data) {
                        btn.prev("span").text(data);
                    });

            })
        })

    </script>
</head>
<body>
<div class="container mt-3">
    <div class="row">
        <%--搜索框--%>
        <form class="form col-md-4" action="<c:url value='FoodTypeServlet'/>" method="post">
            <input type="hidden" name="action" value="findByName">
            <div class="form-group ">
                <div class="input-group">
                    <input name="tname" type="text" class="form-control" placeholder="请输入菜品类型">
                    <div class="col-md-1"></div>
                    <div class="input-group-append">
                        <span class="input-group" style="margin: 0;padding: 0">
                            <input class="form-control btn-primary" type="submit" value="搜索">
                        </span>
                    </div>
                </div>
            </div>
        </form>
        <%--添加--%>
        <form class="col-md-2" method="post" action="<c:url value='/admin/food/addfoodtype.jsp'/> ">
            <input class="btn btn-primary" type="submit" value="添加">
        </form>
        <%--表格--%>
        <div class="col-md-12">
            <table class="table table-responsive-md table-striped text-center" >
                <thead>
                <tr class="table-active table-dark">
                    <th scope="col">编号</th>
                    <th scope="col">菜品类型</th>
                    <th scope="col">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>
                                ${item.id}
                        </td>
                        <td>
                                ${item.tname}
                        </td>

                        <td>
                            <span>
                                <a class="btn btn-primary" href="<c:url value='FoodTypeServlet?action=updateFoodTypeBefore&id=${item.id}'/> ">修改</a>
                            </span>

                            <span class="ml-2">
                                <a href="javascript:if (confirm('确定要删除吗？')){window.location.href='<c:url value="FoodTypeServlet?action=deleteFoodTypeById&id=${item.id}"/>'};" class="btn btn-danger">删除</a>
                            </span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
