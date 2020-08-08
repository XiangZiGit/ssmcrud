<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <%
        pageContext.setAttribute("APP_PATH", request.getContextPath());
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="${APP_PATH}/webjars/bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet">
    <script src="${APP_PATH}/webjars/jquery/3.5.1/jquery.js"></script>
    <script src="${APP_PATH}/webjars/bootstrap/3.3.7/js/bootstrap.js"></script>
</head>
<body>
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button type="button" class="btn btn-primary">添加</button>
                <button type="button" class="btn btn-success">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table class="table table-striped">
                    <tr>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>员工性别</th>
                        <th>员工邮箱</th>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department.deptId}</td>
                            <td>${emp.department.deptName}</td>
                            <td>
                                <button type="button" class="btn btn-primary btn-xs">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>添加
                                </button>
                                <button type="button" class="btn btn-success btn-xs">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4">
                当前页${pageInfo.pageNum}总共${pageInfo.pages}总记录数${pageInfo.total}
            </div>
            <div class="col-md-5 col-md-offset-3">
                <nav aria-label="Page navigation">

                    <ul class="pagination">
                        <c:if test="${pageInfo.pageNum>3}">
                            <li><a href="${APP_PATH}/emps?pageNum=1">首页</a></li>
                        </c:if>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pageNum=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageNum ==pageInfo.pageNum}">
                                <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageNum !=pageInfo.pageNum}">
                                <li><a href="${APP_PATH}/emps?pageNum=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pageNum=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:if test="${pageInfo.pageNum<pageInfo.pages-2}">

                            <li><a href="${APP_PATH}/emps?pageNum=${pageInfo.pages}">末页</a></li>
                        </c:if>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <%----%>
</div>


</body>
</html>
