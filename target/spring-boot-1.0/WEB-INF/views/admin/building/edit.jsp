<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/09/2025
  Time: 11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
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
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <select class="form-control" name="districtId" id="districtId">
                                        <option value="">---Chọn Quận---</option>
                                        <option value="1">Quận 1</option>
                                        <option value="2">Quận 2</option>
                                        <option value="3">Quận 3</option>
                                        <option value="4">Quận 4</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="ward" name="ward" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="street" name="street" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Kết cấu</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="structure" name="structure" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="floorArea" name="floorArea" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="direction" name="direction" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="level" name="level" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="rentArea" name="rentArea" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="rentPrice" name="rentPrice" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí dịch vụ</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="serviceFee" name="serviceFee" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ô tô</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="carFee" name="carFee" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí mô tô</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí ngoài giờ</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tiền điện</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đặt cọc</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thanh toán</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời hạn thuê</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Thời gian trang trí</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Tên quản lý</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">SĐT quản lý</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phí môi giới</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="number" id="name" name="name" >
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="noi-that">Nội thất
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="nguyen-can">Nguyên căn
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="tang-tret">Tầng trệt
                                    </label>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Ghi chú</label>
                                <div class="col-xs-9">
                                    <input class="form-control" type="text" id="name" name="name" >
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
                                    <span id="file-name">Không có tệp nào được chọn</span>

                                    <!-- khung hiển thị ảnh -->
                                    <div style="margin-top:10px;">
                                        <img id="preview" src="" alt="Preview"
                                             style="max-width:200px; max-height:200px; border:1px solid #ccc; display:none;">
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
                                        }
                                        reader.readAsDataURL(input.files[0]);
                                    } else {
                                        fileNameSpan.textContent = "Không có tệp nào được chọn";
                                        preview.src = "";
                                        preview.style.display = "none";
                                    }
                                }
                            </script>
                            <div class="form-group">
                                <label class="col-xs-3"></label>
                                <div class="col-xs-9">
                                    <button class="btn btn-primary" id="btnAddBuilding">Thêm tòa nhà</button>
                                    <button class="btn btn-primary">Hủy thao tác</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->
</div><!-- /.main-container -->
</body>
</html>
