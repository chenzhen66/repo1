<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>标题</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="<c:url value='/webjars/jquery/3.6.0/jquery.min.js'/>"></script>
    <script src="<c:url value='/webjars/bootstrap/4.6.1/js/bootstrap.min.js'/>"></script>
    <link rel="stylesheet" href="<c:url value='/webjars/bootstrap/4.6.1/css/bootstrap.min.css'/> ">
</head>
<body>
<div class="container mt-5">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-4 border" style="padding: 5%">
            <form action="<c:url value='/FoodTypeServlet'/> " method="post">
                <input type="hidden" name="action" value="addFoodType">
                <ul class="list-group list-unstyled">
                    <li class="list-group-item-heading form-group"><h2 class="h2">添加菜品类型</h2></li>
                </ul>
                <div class="form-group">
                    <lable>菜品类型</lable>
                    <input name="tname" class="form-control" type="text">
                </div>
                <div class="form-group">
                    <input type="submit"  class="btn btn-primary" value="添加">
                </div>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
