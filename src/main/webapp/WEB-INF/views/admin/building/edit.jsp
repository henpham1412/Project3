<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/09/2025
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
<div class="main-content" id="main-container">
    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        Dashboard
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div><!-- /.page-header -->

                <div class = "row">
                    <div class="col-xs-12">
                    </div>
                </div>
                <div class = "row" style="font-family: 'Times New Roman', Times, serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" method="GET">
                         <div class="col-xs-12">
                        <form class="form-horizontal" role="form" >
                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:input class="form-control" path="name"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                     <form:select class="form-control" path="district">
                                        <form:option value="">---Chọn Quận---</form:option>
                                        <form:options items="${districts}"></form:options>
                                    </form:select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="ward" name="ward" >--%>
                                        <form:input class="form-control" path="ward"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="street" name="street" >--%>
                                    <form:input class="form-control" path="street"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Kết cấu</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="structure" name="structure" >--%>
                                    <form:input class="form-control" path="structure"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement" >--%>
                                    <form:input class="form-control" path="numberOfBasement"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="floorArea" name="floorArea" >--%>
                                    <form:input class="form-control" path="floorArea"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="direction" name="direction" >--%>
                                    <form:input class="form-control" path="direction"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="level" name="level" >--%>
                                    <form:input class="form-control" path="level"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="rentArea" name="rentArea" >--%>
                                    <form:input class="form-control" path="rentArea"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="rentPrice" name="rentPrice" >--%>
                                    <form:input class="form-control" path="rentPrice"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription" >--%>
                                    <form:input class="form-control" path="rentPriceDescription"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="serviceFee" name="serviceFee" >--%>
                                    <form:input class="form-control" path="serviceFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="carFee" name="carFee" >--%>
                                    <form:input class="form-control" path="carFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                    <form:input class="form-control" path="motoFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                        <form:input class="form-control" path="overtimeFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                        <form:input class="form-control" path="electricityFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                        <form:input class="form-control" path="deposit"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                        <form:input class="form-control" path="payment"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời hạn thuê</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="name" name="name" >--%>
                                        <form:input class="form-control" path="rentTime"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="name" name="name" >--%>
                                        <form:input class="form-control" path="decorationTime"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="name" name="name" >--%>
                                    <form:input class="form-control" path="managerName"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="name" name="name" >--%>
                                    <form:input class="form-control" path="managerPhone"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="number" id="name" name="name" >--%>
                                    <form:input class="form-control" path="brokerageFee"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <form:checkboxes items="${typeCodes}" path="typeCode"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
<%--                                    <input class="form-control" type="text" id="name" name="name" >--%>
                                        <form:input class="form-control" path="note"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hình đại diện</label>
                                <div class="col-xs-9">
                                    <!-- input file -->
                                    <input
                                            type="file"
                                            id="avatar"
                                            name="avatar"
                                            accept="image/*"
                                            style="display: none;"
                                            onchange="previewImage(event)"
                                    >
                                    <!-- button giả lập -->
                                    <label for="avatar"
                                           style="display: inline-block; width: 80px; height: 28px; border-radius: 3px; background: #007bff; color: #fff; text-align: center; line-height: 28px; font-size: 11px; font-weight: 600; cursor: pointer; margin-bottom: 5px;">
                                        Chọn tệp
                                    </label>
                                    <span id="file-name">

                                        <c:choose>
                                            <c:when test="${not empty buildingEdit.imageName}">
                                                ${buildingEdit.imageName} </c:when>
                                            <c:otherwise>
                                                Không có tệp nào được chọn
                                            </c:otherwise>
                                        </c:choose>

                                    </span>

                                    <!-- khung hiển thị ảnh -->
                                    <div style="margin-top:10px;">
                                        <img id="preview"
                                         src="${not empty buildingEdit.imageBase64 ? buildingEdit.imageBase64 : ''}"
                                         alt="Preview"
                                         style="max-width:200px; max-height:200px; border:1px solid #ccc;
                                                display:${not empty buildingEdit.imageBase64 ? 'block' : 'none'};">

                                    </div>
                                </div>
                            </div>

                            <script>
                                function previewImage(event) {
                                    const input = event.target;
                                    const fileNameSpan = document.getElementById("file-name");
                                    const preview = document.getElementById("preview");

                                    if (input.files && input.files[0]) {
                                        fileNameSpan.textContent = input.files[0].name;
                                        const reader = new FileReader();
                                        reader.onload = function(e) {
                                            preview.src = e.target.result;
                                            preview.style.display = "block";
                                            avatarBase64 = e.target.result;
                                        }
                                        reader.readAsDataURL(input.files[0]);
                                    } else {
                                        fileNameSpan.textContent = "Không có tệp nào được chọn";
                                        preview.src = "";
                                        preview.style.display = "none";
                                        avatarBase64 = null;
                                    }
                                }
                            </script>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Cập nhật tòa nhà</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button type="button" class="btn btn-primary" id="btnAddOrUpdateBuilding">Thêm mới tòa nhà</button>
                                    <button type="button" class="btn btn-primary" id="btnCancel">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>
                        <form:hidden path="id" id="buildingId"/>

                        </form>
                    </div>
                    </form:form>

                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
<script>
    var avatarBase64 = null;
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#listForm').serializeArray();
        $.each(formData, function(i, v){
            if (v.name != 'typeCode') {
                data["" + v.name + ""] = v.value;
            }
            else {
                typeCode.push(v.value);
            }
        });
        data['typeCode'] = typeCode;

        if (avatarBase64) {
            data['imageBase64'] = avatarBase64;
        }

        if (typeCode != "") {
            addOrUpdateBuilding(data);
        } else {
            window.location.href = "<c:url value="/admin/building-edit?typeCode=require"/>";
        }
        // call api
    });
    function addOrUpdateBuilding(data) {
        $.ajax({
            type: "POST",
            url: "${buildingAPI}",
            data: JSON.stringify(data),
            contentType:"application/json",
            dataType: "JSON",
            success: function(respond) {
                console.log("success");
            },
            error: function(respond) {
                console.log("failed");
                console.log(respond);
            }
            });
    };
    $('#btnCancel').click(function (){
        window.location.href = "/admin/building-list";
    });
</script>
</body>
</html>
