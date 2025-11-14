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
<c:url var="buildingListURL" value="/admin/building-list"/>
<c:url var="buildingAPI" value="/api/building"/>
<script>
    var buildingListUrl = "${pageContext.request.contextPath}/admin/building-list";
</script>

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
                                <div class="widget-main">
                                    <form:form id="listForm" modelAttribute="buildingSearch" action="${buildingListURL}" method="GET">
                                         <div class = "row">
                                        <div class="from-group">
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <label class="name">Tên tòa nhà</label>
<%--                                                    <input type="text" class="form-control" name="name" value="${buildingSearch.name}">--%>
                                                        <form:input path="name" class="form-control" />
                                                </div>
                                                <div class="col-xs-6">
                                                    <label class="name">Diện tích sàn</label>
<%--                                                    <input type="number" class="form-control" name="floorArea" value="${buildingSearch.floorArea}">--%>
                                                        <form:input path="floorArea" class="form-control" />
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-2">
                                                    <label class="name">Quận</label>
                                                    <form:select class="form-control" path="district">
                                                        <form:option value="">---Chọn Quận---</form:option>
                                                        <form:options items="${districts}"></form:options>
                                                    </form:select>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Phường</label>
                                                    <form:input path="ward" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="ward" value="${buildingSearch.ward}">--%>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">Đường</label>
                                                    <form:input path="street" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="street" value="${buildingSearch.street}">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-4">
                                                    <label class="name">Số tầng hầm</label>
                                                    <form:input path="numberOfBasement" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="numberOfBasement" value="${buildingSearch.numberOfBasement}">--%>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hướng</label>
                                                    <form:input path="direction" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="direction" value="${buildingSearch.direction}">--%>
                                                </div>
                                                <div class="col-xs-4">
                                                    <label class="name">Hạng</label>
                                                    <form:input path="level" class="form-control" />
<%--                                                    <input type="number" class="form-control" name="level" value="${buildingSearch.level}">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích từ</label>
                                                    <form:input path="areaFrom" class="form-control" />
<%--                                                    <input type="number" class="form-control" name="areaFrom" value="">--%>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Diện tích đến</label>
                                                    <form:input path="areaTo" class="form-control" />
<%--                                                    <input type="number" class="form-control" name="areaTo" value="">--%>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê từ</label>
                                                    <form:input path="rentPriceFrom" class="form-control" />
<%--                                                    <input type="number" class="form-control" name="rentPriceFrom" value="">--%>
                                                </div>
                                                <div class="col-xs-3">
                                                    <label class="name">Giá thuê đến</label>
                                                    <form:input path="rentPriceTo" class="form-control" />
<%--                                                    <input type="number" class="form-control" name="rentPriceTo" value="">--%>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">

                                                <div class="col-xs-5">
                                                    <label class="name">Tên quản lí</label>
                                                    <form:input path="managerName" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="managerName" value="">--%>
                                                </div>
                                                <div class="col-xs-5">
                                                    <label class="name">SĐT quản lí</label>
                                                    <form:input path="managerPhone" class="form-control" />
<%--                                                    <input type="text" class="form-control" name="managerPhoneNumber" value="">--%>
                                                </div>
                                                <div class="col-xs-2">
                                                    <label class="name">Nhân viên</label>
                                                    <form:select class="form-control" path="staffId">
                                                        <form:option value="">---Chọn nhân viên---</form:option>
                                                        <form:options items="${listStaffs}"/>

                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="col-xs-12">
                                                <div class="col-xs-6">
                                                    <form:checkboxes items="${typeCodes}" path="typeCode"/>
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
                                    </form:form>
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
                                <button class="btn btn-danger" title="Xóa tòa nhà" id="btnDeleteBuilding">
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
                        <table id="tableList" style="margin: 3em 0" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" name="checkList" value="" class="ace">
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
                            <c:forEach var="item" items="${buildingPage.content}">
                                <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" name="checkList" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>
                                <td>
                                    ${item.name}
                                </td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.brokerageFee}</td>
                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                            <i class="ace-icon glyphicon glyphicon-list"></i>
                                        </button>

                                        <a class="btn btn-xs btn-info" title="Sửa tòa nhà" href="/admin/building-edit-${item.id}">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>
                                        <button class="btn btn-xs btn-danger" title="Xóa tòa nhà" onclick="deleteBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>
                                    </div>

                                </td>
                            </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div><!-- /.span -->
                </div>
                <c:if test="${buildingPage.totalPages > 0}">
            <ul class="pagination">
                <%-- Nút Lùi (Previous) --%>
                <c:choose>
                    <c:when test="${buildingPage.first}">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                        <c:url var="prevPageUrl" value="/admin/building-list">
                            <c:param name="page" value="${buildingPage.number - 1}"/>
                            <c:param name="size" value="${buildingPage.size}"/>
                            <%-- Thêm TẤT CẢ filter param vào đây --%>
                            <c:param name="name" value="${buildingSearch.name}"/>
                            <c:param name="floorArea" value="${buildingSearch.floorArea}"/>
                            <c:param name="district" value="${buildingSearch.district}"/>
                            <c:param name="ward" value="${buildingSearch.ward}"/>
                            <c:param name="street" value="${buildingSearch.street}"/>
                            <c:param name="numberOfBasement" value="${buildingSearch.numberOfBasement}"/>
                            <c:param name="direction" value="${buildingSearch.direction}"/>
                            <c:param name="level" value="${buildingSearch.level}"/>
                            <c:param name="areaFrom" value="${buildingSearch.areaFrom}"/>
                            <c:param name="areaTo" value="${buildingSearch.areaTo}"/>
                            <c:param name="rentPriceFrom" value="${buildingSearch.rentPriceFrom}"/>
                            <c:param name="rentPriceTo" value="${buildingSearch.rentPriceTo}"/>
                            <c:param name="managerName" value="${buildingSearch.managerName}"/>
                            <c:param name="managerPhone" value="${buildingSearch.managerPhone}"/>
                            <c:param name="staffId" value="${buildingSearch.staffId}"/>
                            <%-- SỬA LẠI TYPECODE: Dùng vòng lặp --%>
                            <c:forEach var="type" items="${buildingSearch.typeCode}">
                                <c:param name="typeCode" value="${type}"/>
                            </c:forEach>
                        </c:url>
                        <li class="page-item"><a class="page-link" href="${prevPageUrl}">Previous</a></li>
                    </c:otherwise>
                </c:choose>

                <%-- Các nút số trang --%>
                <c:forEach var="i" begin="0" end="${buildingPage.totalPages - 1}">
                    <c:url var="pageUrl" value="/admin/building-list">
                        <c:param name="page" value="${i}"/>
                        <c:param name="size" value="${buildingPage.size}"/>
                        <%-- Tất cả các filter param (giống hệt ở trên) --%>
                        <c:param name="name" value="${buildingSearch.name}"/>
                        <c:param name="floorArea" value="${buildingSearch.floorArea}"/>
                        <c:param name="district" value="${buildingSearch.district}"/>
                        <c:param name="ward" value="${buildingSearch.ward}"/>
                        <c:param name="street" value="${buildingSearch.street}"/>
                        <c:param name="numberOfBasement" value="${buildingSearch.numberOfBasement}"/>
                        <c:param name="direction" value="${buildingSearch.direction}"/>
                        <c:param name="level" value="${buildingSearch.level}"/>
                        <c:param name="areaFrom" value="${buildingSearch.areaFrom}"/>
                        <c:param name="areaTo" value="${buildingSearch.areaTo}"/>
                        <c:param name="rentPriceFrom" value="${buildingSearch.rentPriceFrom}"/>
                        <c:param name="rentPriceTo" value="${buildingSearch.rentPriceTo}"/>
                        <c:param name="managerName" value="${buildingSearch.managerName}"/>
                        <c:param name="managerPhone" value="${buildingSearch.managerPhone}"/>
                        <c:param name="staffId" value="${buildingSearch.staffId}"/>
                        <%-- SỬA LẠI TYPECODE: Dùng vòng lặp --%>
                        <c:forEach var="type" items="${buildingSearch.typeCode}">
                            <c:param name="typeCode" value="${type}"/>
                        </c:forEach>
                    </c:url>

                    <c:choose>
                        <c:when test="${i == buildingPage.number}">
                            <li class="page-item active"><a class="page-link" href="${pageUrl}">${i + 1}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="${pageUrl}">${i + 1}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- Nút Tới (Next) --%>
                <c:choose>
                    <c:when test="${buildingPage.last}">
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when>
                    <c:otherwise>
                        <c:url var="nextPageUrl" value="/admin/building-list">
                            <c:param name="page" value="${buildingPage.number + 1}"/>
                            <c:param name="size" value="${buildingPage.size}"/>
                            <%-- Tất cả các filter param (giống hệt ở trên) --%>
                            <c:param name="name" value="${buildingSearch.name}"/>
                            <c:param name="floorArea" value="${buildingSearch.floorArea}"/>
                            <c:param name="district" value="${buildingSearch.district}"/>
                            <c:param name="ward" value="${buildingSearch.ward}"/>
                            <c:param name="street" value="${buildingSearch.street}"/>
                            <c:param name="numberOfBasement" value="${buildingSearch.numberOfBasement}"/>
                            <c:param name="direction" value="${buildingSearch.direction}"/>
                            <c:param name="level" value="${buildingSearch.level}"/>
                            <c:param name="areaFrom" value="${buildingSearch.areaFrom}"/>
                            <c:param name="areaTo" value="${buildingSearch.areaTo}"/>
                            <c:param name="rentPriceFrom" value="${buildingSearch.rentPriceFrom}"/>
                            <c:param name="rentPriceTo" value="${buildingSearch.rentPriceTo}"/>
                            <c:param name="managerName" value="${buildingSearch.managerName}"/>
                            <c:param name="managerPhone" value="${buildingSearch.managerPhone}"/>
                            <c:param name="staffId" value="${buildingSearch.staffId}"/>
                            <%-- SỬA LẠI TYPECODE: Dùng vòng lặp --%>
                            <c:forEach var="type" items="${buildingSearch.typeCode}">
                                <c:param name="typeCode" value="${type}"/>
                            </c:forEach>
                        </c:url>
                        <li class="page-item"><a class="page-link" href="${nextPageUrl}">Next</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </c:if>

            </div><!-- /.page-content -->
        </div>
</div><!-- /.main-container -->

<div class="modal fade" id="assignmentBuildingModal" role="dialog" style="font-family: 'Times New Roman', Times, serif;">
			<div class="modal-dialog">

			  <!-- Modal content-->
			  <div class="modal-content">
				<div class="modal-header">
				  <button type="button" class="close" data-dismiss="modal">&times;</button>
				  <h4 class="modal-title">Danh sách nhân viên</h4>
				</div>
				<div class="modal-body">
					<table style="margin: 3em 0 0;" class="table table-striped table-bordered table-hover" id="stafflist">
						<thead>
							<tr>
								<th class="center">Chọn</th>
								<th>Tên nhân viên</th>
							</tr>
						</thead>

						<tbody>
<%--							<tr>--%>
<%--								<td class="center">--%>
<%--									<input type="checkbox" id="checkbox_1" value="1">--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									Nguyễn Văn A--%>
<%--								</td>--%>

<%--							</tr>--%>
<%--							<tr>--%>
<%--								<td class="center">--%>
<%--									<input type="checkbox" id="checkbox_2" value="2">--%>
<%--								</td>--%>
<%--								<td>--%>
<%--									Nguyễn Văn B--%>
<%--								</td>--%>

<%--							</tr>--%>
						</tbody>
					</table>
					<input type="hidden" id="buildingId" name="buildingId" value="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="btnassignmentBuilding">Giao tòa nhà</button>
				  <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
				</div>
			  </div>

			</div>
		  </div>

<script>
    function assignmentBuilding(buildingId) {
        $('#assignmentBuildingModal').modal();
        loadStaff(buildingId);
        $('#buildingId').val(buildingId);
    }

    function loadStaff(buildingId) {
        $.ajax({
            url: "/api/building/" + buildingId + '/staffs',
            type: "GET",
            // data: JSON.stringify(data),
            // contentType:"application/json",
            dataType: "JSON",
            success: function(response) {
                var row = '';
                $.each(response.data, function (index, item){
                    row += '<tr>';
                    row += '<td class="text-center"><input type="checkbox" value= ' + item.staffId + ' id="checkbox_' + item.staffId + '" class = "check-box-element" ' +  item.checked + '/></td>';
                    row += '<td class="text-center">' + item.fullName + '</td>';
                    row += '</tr>';
                });
                $('#stafflist tbody').html(row);
                console.info("success");
            },
            error: function(response) {
                console.log("failed");
                window.location.href = "<c:url value="/admin/building-list?message=error"/>";
                console.log(response);
            }
        });
    }

    $('#btnassignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#stafflist').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
        if (data['staffs'] != '') {
            assign(data);
        }
        console.log("OK");
    });
    function assign(data) {
        $.ajax({
            url: "/api/building/" + 'assignment',
            type: "POST",
            data: JSON.stringify(data),
            contentType:"application/json",
            dataType: "JSON",
            success: function(response) {
                console.info("success");
                window.location.href = "/admin/building-list?status=success";
            },
            error: function(response) {
                console.log("failed");
                window.location.href = "/admin/building-list?message=error";
                console.log(response);
            }
        });
    }
    $('#btnSearchBuilding').click(function (e){
        e.preventDefault();
        $('#listForm').submit();
    });

    function deleteBuilding(id) {
        var buildingId = [id];
        deleteBuildings(buildingId);
    }

    $('#btnDeleteBuilding').click(function(e){
        e.preventDefault();
        var buildingIds = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        console.log("Các ID được chọn:", buildingIds);
        deleteBuildings(buildingIds);
    });
    function deleteBuildings(data) {
        $.ajax({
            type: "Delete",
            url: "${buildingAPI}/" + data,
            // data: JSON.stringify(data),
            // contentType:"application/json",
            //dataType: "JSON",
            dataType: "text",
            success: function(respond) {
                console.log("success");
                window.location.href = "/admin/building-list?status=success";
            },
            error: function(respond) {
                console.log("failed");
                console.log(respond);
                window.location.href = "/admin/building-list?message=error";
            }
        });
    }
</script>

</body>
</html>
