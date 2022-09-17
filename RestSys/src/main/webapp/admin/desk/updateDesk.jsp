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
            <form action="<c:url value='/DeskServlet'/> " method="post">
                <input type="hidden" name="action" value="updateDesk">
                <input type="hidden" name="id" value="${list.get(0).getId()}">
                <ul class="list-group list-unstyled">
                    <li class="list-group-item-heading form-group"><h2 class="h2">修改餐台信息</h2></li>
                </ul>
                <div class="form-group">
                    <lable>餐台名称</lable>
                    <input name="name" class="form-control" value="${list.get(0).getName()}" type="text">
                </div>
                <div class="form-group">
                    <lable>餐台类型</lable>
                    <select class="form-control" name="desktype_id">
                        <c:forEach var="item" items="${list1}">

                            <c:choose>
                                <c:when test="${list.get(0).getDeskType().getDp_id()==item.dp_id}">
                                    <option selected value="${item.dp_id}">${item.dp_name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${item.dp_id}">${item.dp_name}</option>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <input type="submit"  class="form-control btn btn-primary" value="修改">
                </div>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
