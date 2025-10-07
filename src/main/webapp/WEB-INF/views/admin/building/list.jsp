<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/09/2025
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Danh sách tòa nhà</title>
</head>
<body>
<div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Trang chủ</a>
                    </li>
                    <li class="active">Quản lý tòa nhà</li>
                </ul><!-- /.breadcrumb -->

            </div>

            <div class="page-content">

<%--                <div class="page-header">--%>
<%--                    <h1>--%>
<%--                        Danh sách tòa nhà--%>
<%--                        <small>--%>
<%--                            <i class="ace-icon fa fa-angle-double-right"></i>--%>
<%--                            overview &amp; stats--%>
<%--                        </small>--%>
<%--                    </h1>--%>
<%--                </div><!-- /.page-header -->--%>

                <div class = "row">
                    <div class="col-xs-12">
                        <div class="widget-box">
                            <div class="widget-header">
                                <h5 class="widget-title">Tìm kiếm</h5>

                                <div class="widget-toolbar">


                                    <a href="#" data-action="collapse">
                                        <i class="ace-icon fa fa-chevron-up"></i>
                                    </a>

                                </div>
                            </div>

                            <div class="widget-body" style="font-family: 'Times New Roman', Times, serif;">
                                <div class="widget-main" id="listForm">
                                    <div class = "row">
                                        <div class="from-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="name">Tên tòa nhà</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-6">
                                                    <label class="name">Diện tích sàn</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label class="name">Quận</label>
                                                    <select class="form-control">
                                                        <option value="">---Chọn Quận---</option>
                                                        <option value="">Quận 1</option>
                                                        <option value="">Quận 2</option>
                                                        <option value="">Quận 3</option>
                                                        <option value="">Quận 4</option>
                                                    </select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Phường</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Đường</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Số tầng hầm</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hạng</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích từ</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích đến</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê từ</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê đến</label>
                                                    <input type="number" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-xs-12">

                                                <div class="col-xs-5">
                                                    <label class="name">Tên quản lí</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">SĐT quản lí</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                                <div class="col-xs-2">
                                                    <label class="name">Nhân viên</label>
                                                    <select class="form-control">
                                                        <option value="">---Chọn nhân viên---</option>
                                                        <option value="">Đàm Trần Hải Đăng</option>
                                                        <option value="">Trần Nam Khánh</option>
                                                        <option value="">Nguyễn Thành Đạt</option>
                                                        <option value="">Bùi Tấn Hợp</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox">Nội Thất
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox">Nguyên Căn
                                                    </label>
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox">Tầng Trệt
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <!-- <button class="btn btn-danger">Tìm kiếm</button> -->
                                                    <button type="button" class="btn btn-danger" id="btnSearchBuilding">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
                                                        </svg>
                                                        Tìm kiếm
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="pull-right">
                                <a href="/admin/building-edit">
                                    <button class="btn btn-info" title="Thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </a>
                                <button class="btn btn-danger" title="Xóa tòa nhà">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                        <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                        <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                        <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                    </svg>
                                </button>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- Bảng Danh Sách -->
                <div class="row">
                    <div class="col-xs-12">
                        <table id="simple-table" style="margin: 3em 0 0;" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên tòa nhà</th>
                                <th>Địa chỉ</th>
                                <th>Số tầng hầm</th>
                                <th>Tên quản lí</th>
                                <th>SĐT quản lí</th>
                                <th>D.Tích sàn</th>
                                <th>D.Tích trống</th>
                                <th>D.Tích thuê</th>
                                <th>Phí môi giới</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>
                                    ACM Building
                                </td>
                                <td>59 Phan Xích Long, Phường 2, Quận 1</td>
                                <td>3</td>
                                <td>Anh Nam-Chị Linh</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Expiring</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(1)">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                        <button class="btn btn-xs btn-danger">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>

                                </td>
                            </tr>
                            <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>
                                    Nam Giao Building
                                </td>
                                <td>59 Phan Xích Long, Phường 2, Quận 1</td>
                                <td>3</td>
                                <td>Anh Nam-Chị Linh</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Feb 12</td>
                                <td>Expiring</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(2)">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                        <button class="btn btn-xs btn-info">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </button>

                                        <button class="btn btn-xs btn-danger">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
            </div><!-- /.page-content -->
        </div>
</div><!-- /.main-container -->

<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
    }
    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#stafflist').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        console.log("OK");
    });
</script>

</body>
</html>
