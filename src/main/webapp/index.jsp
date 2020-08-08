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
<div class="modal fade" id="EmpUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">员工信息更新</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_input"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_update_input"
                                   placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderM_update_input" value="M" checked="checked">
                                男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderF_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="department_update_input">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_emp_btn">修改</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="EmpAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">员工姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input"
                                   placeholder="name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">邮箱</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="email" id="email_add_input"
                                   placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderM_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderF_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="dId" id="department_add_input">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_emp_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button type="button" class="btn btn-primary" id="EmpAddModalButton">添加</button>
                <button type="button" class="btn btn-success" id="Emp_batchdel_btn">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <table class="table table-striped" id="emps_table">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all"/>
                        </th>
                        <th>员工编号</th>
                        <th>员工姓名</th>
                        <th>员工性别</th>
                        <th>员工邮箱</th>
                        <th>部门编号</th>
                        <th>部门名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="row">
            <div class="col-md-4" id="page_info_area">

            </div>
            <div class="col-md-5 col-md-offset-3" id="page_nav_area">

            </div>
        </div>
    </div>
    <%----%>
</div>
<script>
    var totalRecord, currentPage;
    $(function () {
        to_page(1);

    })

    function to_page(PN) {
        $("#check_all").prop("checked",false)
        $.ajax({
            url: "${APP_PATH}/empsWithjson",
            data: "pageNum=" + PN,
            type: "GET",
            success: function (result) {
                console.log(result)
                //1、解析并显示员工数据
                build_emps_table(result);
                //2、解析并显示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        })
    }

    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");
        var firstPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("首页"));
        if (result.extend.pageInfo.pageNum == 1) {
            firstPageLi.addClass("disabled")
        } else {
            firstPageLi.click(function () {
                to_page(1)

            })
        }

        var prevpageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Previous").append($("<span></span>").append("&laquo;").attr("aria-hidden", "true")));
        if (!result.extend.pageInfo.hasPreviousPage) {
            prevpageLi.addClass("disabled")
        } else {
            prevpageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1)

            })
        }
        var nextPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").attr("aria-label", "Next").append($("<span></span>").append("&raquo;").attr("aria-hidden", "true")));
        if (result.extend.pageInfo.hasNextPage) {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1)
            })
        } else {
            nextPageLi.addClass("disabled")
        }
        var lastPageLi = $("<li></li>").append($("<a></a>").attr("href", "#").append("末页"));
        if (result.extend.pageInfo.pageNum == result.extend.pageInfo.pages) {
            lastPageLi.addClass("disabled")
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages)
            })
        }
        ul.append(firstPageLi)
            .append(prevpageLi);
        var navigatepageNums = result.extend.pageInfo.navigatepageNums;

        $.each(navigatepageNums, function (index, item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item))
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active")
            }
            numLi.click(function () {
                to_page(item)
            })
            ul.append(numLi)
        })
        ul.append(nextPageLi).append(lastPageLi);
        $("<nav></vav>").append(ul).appendTo("#page_nav_area")

    }

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前页" + result.extend.pageInfo.pageNum + "总共" + result.extend.pageInfo.pages + "总记录数" + result.extend.pageInfo.total)
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptIdTd = $("<td></td>").append(item.department.deptId)
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-xs edit_btn").attr("editId", item.empId).append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            var delBtn = $("<button></btton>").addClass("btn btn-success btn-xs del_btn").attr("editId", item.empId).append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptIdTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody")
        })
    }

    function reset_form(ele) {
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-success has-error");
        $(ele).find(".help-block").text("")
    }

    $('#EmpAddModalButton').click(function () {
        reset_form("#EmpAddModal form")
        getDepts("#department_add_input")
        $('#EmpAddModal').modal({
            backdrop: "static",
            keyboard: true
        })


    })

    function getDepts(ele) {
        $(ele).empty()
        $.ajax({
            url: "${APP_PATH}/getDepts",
            type: "GET",
            success: function (result) {
                var depts = result.extend.depts;
                $.each(depts, function (index, item) {
                    $("<option></option>").append(item.deptName).attr("value", item.deptId).appendTo(ele)
                })
            }
        })

    }

    $("#empName_add_input").change(function () {
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        var validateAddForm = validate_add_form("#empName_add_input", empName, regName, "用户名可以是2-5位中文或者6-16位英文和数字的组合");
        if (!validateAddForm) {
            $("#save_emp_btn").attr("validate", "error")
            return false;
        }
        var empName = this.value;
        $.ajax({
            url: "${APP_PATH}/checkuser",
            type: "GET",
            data: "empName=" + empName,
            success: function (result) {
                if (result.code == 200) {
                    $("#save_emp_btn").attr("validate", "error")
                    show_validate_msg("#empName_add_input", "fail", result.extend.result)
                } else {
                    show_validate_msg("#empName_add_input", "success", result.extend.result)
                }

            }
        })
    })
    $("#email_add_input").change(function () {
        var email = $("#email_add_input").val();
        var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var validateAddForm = validate_add_form("#email_add_input", email, regemail, "邮箱格式不正确")
        if (!validateAddForm) {
            $("#save_emp_btn").attr("validate", "error")
        }

    })
    $("#email_update_input").change(function () {
        var email = $("#email_update_input").val();
        var regemail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        var validateAddForm =validate_add_form("#email_update_input", email, regemail, "邮箱格式不正确")
        if (!validateAddForm) {
            $("#save_update_btn").attr("validate", "error")
        }
    })

    function validate_add_form(ele, eleValue, eleRule, msg) {
        //校验
        if (!eleRule.test(eleValue)) {
            //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合")
            /*  $("#empName_add_input").parent().addClass("has-error")
              $("#empName_add_input").next("span").append("用户名可以是2-5位中文或者6-16位英文和数字的组合")*/
            show_validate_msg(ele, "fail", msg)
            $("#save_emp_btn").attr("validate", "error")
            return false;
        } else {
            //$("#empName_add_input").parent().addClass("has-success")
            show_validate_msg(ele, "success", "")
            $("#save_emp_btn").attr("validate", "success")
        }
        /*var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)) {
            //alert("邮箱格式不正确");
            show_validate_msg("#email_add_input", "fail", "邮箱格式不正确")
            /!* $("#email_add_input").parent().addClass("has-error");
             $("#email_add_input").next("span").append("邮箱格式不正确")*!/
            return false;
        } else {
            show_validate_msg("#email_add_input", "success", "")
        }*/
        return true;

    }

    $("#save_emp_btn").click(function () {

        if ("error" == $("#save_emp_btn").attr("validate")) {
            return false;
        }
        $.ajax({
            url: "${APP_PATH}/emp",
            type: "POST",
            data: $("#EmpAddModal form").serialize(),
            success: function (result) {
                if (result.code == 100) {
                    $('#EmpAddModal').modal('hide')
                    to_page(totalRecord)
                } else if (result.code == 200) {
                    if (undefined != result.extend.errors.empName) {
                        show_validate_msg("#empName_add_input", "fail", result.extend.errors.empName)
                    }
                    if (undefined != result.extend.errors.email) {
                        show_validate_msg("#email_add_input", "fail", result.extend.errors.email)
                    }

                }
            }
        })
    })

    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error")
        $(ele).next("span").text("")
        if ("success" == status) {
            $(ele).parent().addClass("has-success")
        } else if ("fail" == status) {
            $(ele).parent().addClass("has-error")
        }
        $(ele).next("span").append(msg)
    }

    $(document).on("click", ".edit_btn", function () {

        getDepts("#department_update_input")
        $('#EmpUpdateModal').modal({
            backdrop: "static",
            keyboard: true
        })
        getEmp($(this).attr("editId"))
        $("#update_emp_btn").attr("empId", $(this).attr("editId"))

    })

    function getEmp(id) {
        $.ajax({
            url: "${APP_PATH}/emp/" + id,
            type: "GET",
            success: function (result) {
                console.log(result)
                if (result.code == 100) {
                    $("#empName_update_input").text(result.extend.emp.empName)
                    $("#email_update_input").val(result.extend.emp.email)
                    $("#empUpdateModal input[name=gender]").val([result.extend.emp.gender]);
                    $("#empUpdateModal select").val([result.extend.emp.dId]);
                }
            }
        })
    }

    $("#update_emp_btn").click(function () {
        if ("error" == $("#save_emp_btn").attr("validate")) {
            return false;
        }

        $.ajax({
            url: "${APP_PATH}/emp/" + $("#update_emp_btn").attr("empId"),
         /*   type: "POST",
            data: $("#EmpUpdateModal form").serialize() + "&_method=PUT",*/
            type: "PUT",
            data: $("#EmpUpdateModal form").serialize(),
            success: function (result) {
                console.log(result)
                if (result.code == 100) {
                    $('#EmpUpdateModal').modal('hide')
                    to_page(currentPage)
                } else if (result.code == 200) {
                    if (undefined != result.extend.errors.empName) {
                        show_validate_msg("#empName_update_input", "fail", result.extend.errors.empName)
                    }
                    if (undefined != result.extend.errors.email) {
                        show_validate_msg("#email_update_input", "fail", result.extend.errors.email)
                    }
                }
            }
        })
    })
    $(document).on("click",".del_btn",function () {
        var empName =$(this).parents("tr").find("td:eq(2)").text();
        var id =$(this).attr("editId")
        if(confirm("确定删除"+empName+"的信息么")){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        to_page(currentPage)
                    }
                }
            })
        }
    })
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"))

    })
    $(document).on("click",".check_item",function () {
        var flag =$(".check_item:checked").length == $(".check_item").length
        $("#check_all").prop("checked",flag);
    })
    $("#Emp_batchdel_btn").click(function () {
        if ($(".check_item:checked").length == 0){
            alert("请先选择待删除的数据")
            return false;
        }
        var empNames="",empIds="";
        $(".check_item:checked").each(function () {
            empNames+=$(this).parents("tr").find("td:eq(2)").text()+","
            empIds +=$(this).parents("tr").find("td:eq(1)").text()+"-"
        })
        empNames = empNames.substring(0,empNames.length-1);
        empIds = empIds.substring(0,empIds.length-1);
        if (confirm("确定要删除"+empNames+"信息么？")){
            $.ajax({
                url:"${APP_PATH}/emp/"+empIds,
                type:"DELETE",
                success:function (result) {
                    if (result.code == 100){
                        to_page(currentPage)
                    }
                }
            })
        }
    })
</script>


</body>
</html>
