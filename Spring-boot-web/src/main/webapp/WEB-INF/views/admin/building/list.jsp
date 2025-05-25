<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh Sách Tòa Nhà</title>
</head>
<body>

<div class="main-content" style="font-family: 'Times New Roman', Times, serif;">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
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
            <div class="ace-settings-container" id="ace-settings-container">


                <div class="ace-settings-box clearfix" id="ace-settings-box">
                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <div class="pull-left">
                                <select id="skin-colorpicker" class="hide">
                                    <option data-skin="no-skin" value="#438EB9">#438EB9</option>
                                    <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                                    <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                                    <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                                </select>
                            </div>
                            <span>&nbsp; Choose Skin</span>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                            <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                            <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                            <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                            <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                            <label class="lbl" for="ace-settings-add-container">
                                Inside
                                <b>.container</b>
                            </label>
                        </div>
                    </div><!-- /.pull-left -->

                    <div class="pull-left width-50">
                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover"/>
                            <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact"/>
                            <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
                        </div>

                        <div class="ace-settings-item">
                            <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight"/>
                            <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
                        </div>
                    </div><!-- /.pull-left -->
                </div><!-- /.ace-settings-box -->
            </div><!-- /.ace-settings-container -->

            <div class="page-header">
                <h1>
                    Danh sách tòa nhà
                    <small>
                        <i class="ace-icon fa fa-angle-double-right"></i>
                        overview &amp; stats
                    </small>
                </h1>
            </div><!-- /.page-header -->

        </div><!-- /.page-content -->
        <div class="hr hr-20 hr-double"></div>
        <div class="row">

            <div class="col-xs-12 ">
                <div class="widget-box">
                    <div class="widget-header">
                        <h4 class="widget-title">Tìm kiếm </h4>

                        <span class="widget-toolbar">


									<a href="/admin/building-list" data-action="reload">
										<i class="ace-icon fa fa-refresh"></i>
									</a>

									<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up"></i>
									</a>

									<a href="#" data-action="close">
										<i class="ace-icon fa fa-times"></i>
									</a>
								</span>
                    </div>

                    <div class="widget-body">
                        <div class="widget-main">
                            <form:form method="GET" id="listForm" action="/admin/building-list" modelAttribute="modelSearch">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <label> Tên tòa nhà </label>
<%--                                                <input type="text" id="name" name="name" placeholder="Tên tòa nhà " value="${modelSearch.name}"--%>
<%--                                                       class="form-control">--%>
                                                <form:input path="name" class="form-control"/>
                                            </div>
                                            <div class="col-xs-6">
                                                <label> Diện tích sàn </label>
<%--                                                <input type="number" id="floorArea" name="floorArea" value="${modelSearch.floorArea}"--%>
<%--                                                       placeholder="Diện tích sàn" class="form-control">--%>
                                                <form:input path="floorArea" class="form-control"/>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-2">
                                                <label> Quận </label>
                                                   <form:select path="district"  class="form-control">
                                                    <form:option value=""> Chọn Quận </form:option>
                                                    <form:options items="${district}"/>

                                                </form:select>

                                            </div>
                                            <div class="col-xs-5">
                                                <label> Phường </label>
                                                       <form:input path="ward" class="form-control"/>

                                            </div>
                                            <div class="col-xs-5">
                                                <label> Đường </label>
                                                       <form:input path="street" class="form-control"/>

                                            </div>

                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-4">
                                                <label>Số tầng hầm </label>
<%--                                                <input type="number" id="numberOfBasement" name="numberOfBasement" value="${modelSearch.numberOfBasement}"--%>
<%--                                                       placeholder="Số tầng hầm" class="form-control">--%>
                                                       <form:input path="numberOfBasement" class="form-control"/>

                                            </div>
                                            <div class="col-xs-4">
                                                <label> Hướng </label>
<%--                                                <input type="text" id="direction" name="direction" value="${modelSearch.direction}"--%>
<%--                                                       placeholder="Hướng" class="form-control">--%>
                                                       <form:input path="direction" class="form-control"/>

                                            </div>
                                            <div class="col-xs-4">
                                                <label> Hạng </label>
<%--                                                <input type="number" id="level" name="level" placeholder="Hạng" value="${modelSearch.level}"--%>
<%--                                                       class="form-control">--%>
                                                       <form:input path="level" class="form-control"/>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-3">
                                                <label>Diện tích từ </label>
<%--                                                <input type="number" id="rentAreaFrom" name="rentAreaFrom" value="${modelSearch.rentAreaFrom}"--%>
<%--                                                       placeholder="Diện tích từ" class="form-control">--%>
                                                       <form:input path="rentAreaFrom" class="form-control"/>

                                            </div>
                                            <div class="col-xs-3">
                                                <label>Diện tích đến </label>
<%--                                                <input type="number" id="rentAreaTo" name="rentAreaTo" value="${modelSearch.rentAreaTo}"--%>
<%--                                                       placeholder="Diện tích đến" class="form-control">--%>
                                                       <form:input path="rentAreaTo" class="form-control"/>

                                            </div>
                                            <div class="col-xs-3">
                                                <label>Giá thuê từ </label>
<%--                                                <input type="number" id="rentPriceFrom" name="rentPriceFrom" value="${modelSearch.rentPriceFrom}"--%>
<%--                                                       placeholder="Giá thuê từ" class="form-control">--%>
                                                       <form:input path="rentPriceFrom" class="form-control"/>

                                            </div>
                                            <div class="col-xs-3">
                                                <label>Giá thuê đến </label>
<%--                                                <input type="number" id="rentPriceTo" name="rentPriceTo" value="${modelSearch.rentPriceTo}"--%>
<%--                                                       placeholder="Gía thuê đến" class="form-control">--%>
                                                       <form:input path="rentPriceTo" class="form-control"/>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">

                                            <div class="col-xs-5">
                                                <label> Tên quản lý </label>
<%--                                                <input type="text" name="managerName" placeholder="Tên Quản Lý" value="${modelSearch.managerName}"--%>
<%--                                                       class="form-control">--%>
                                                       <form:input path="managerName" class="form-control"/>

                                            </div>
                                            <div class="col-xs-5">
                                                <label> SDT quản lý </label>
<%--                                                <input type="number" name="managerPhoneNumber" placeholder="Điện thoại quản lý"value="${modelSearch.managerPhoneNumber}"--%>
<%--                                                       class="form-control">--%>
                                                       <form:input path="managerPhone" class="form-control"/>

                                            </div>
                                            <div class="col-xs-2">
                                                <label> Chọn nhân viên </label>
                                                <form:select path="staffId"  class="form-control">
                                                    <form:option value=""> Chọn Nhân Viên </form:option>
                                                    <form:options items="${staffs}"/>

                                                </form:select>

                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class=" col-xs-12">
                                            <div class="col-xs-5">
                                           <form:checkboxes path="typeCode" items="${typeCode}"/>
                                            </div>

                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="col-xs-12">
                                            <div class="col-xs-6">
                                                <button type="button" class="btn btn-primary btn-sm"
                                                        id="btnSearchBuilding">
														<span
                                                                class="ace-icon fa fa-search icon-on-right bigger-110"></span>
                                                    Tìm kiếm
                                                </button>
                                            </div>

                                        </div>

                                    </div>

                                </div>
                            </form:form>

                        </div>
                    </div>


                </div>
                <div class="pull-right">
                    <a href="/admin/building-edit">
                        <button class="btn btn-app btn-success btn-xs" title="Thêm tòa nhà">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                                 class="bi bi-building-add" viewBox="0 0 16 16">
                                <path
                                        d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                <path
                                        d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                <path
                                        d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                            </svg>

                        </button>
                    </a>

                    <button class="btn btn-app btn-danger btn-xs" title="Xóa tòa nhà" id="btnDeleteBuilding">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-building-fill-dash" viewBox="0 0 16 16">
                            <path
                                    d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                            <path
                                    d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v7.256A4.5 4.5 0 0 0 12.5 8a4.5 4.5 0 0 0-3.59 1.787A.5.5 0 0 0 9 9.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .39-.187A4.5 4.5 0 0 0 8.027 12H6.5a.5.5 0 0 0-.5.5V16H3a1 1 0 0 1-1-1zm2 1.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3 0v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5m3.5-.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zM4 5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M7.5 5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm2.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5M4.5 8a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                        </svg>

                    </button>
                </div>
            </div><!-- /.span -->


        </div>
        <!-- Table list building -->
        <div class="row">
            <div class="col-xs-12">

                <div class="table-responsive">
                    <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                                   requestURI="${formUrl}" partialList="true" sort="external"
                                                   size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                                   id="tableList" pagesize="${model.maxPageItems}"
                                                   export="false"
                                                   class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                                   style="margin: 3em 0 1.5em;">
                        <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                        headerClass="center select-cell">
                                            <fieldset>
                                                <input type="checkbox" name="checkList" value="${tableList.id}"
                                                       id="checkbox_${tableList.id}" class="check-box-element"/>
                                            </fieldset>
                        </display:column>
                          <display:column headerClass="text-center" property="name" title="Tên Tòa Nhà"/>
                          <display:column headerClass="text-center" property="address" title="Địa Chỉ"/>
                          <display:column headerClass="text-center" property="numberOfBasement" title="Số Tầng Hầm"/>
                          <display:column headerClass="text-center" property="managerName" title="Tên Quản Lý"/>
                          <display:column headerClass="text-center" property="managerPhone" title="SDT Quản Lý"/>
                          <display:column headerClass="text-center" property="floorArea" title="Diện Tích Sàn"/>
                          <display:column headerClass="text-center" property="rentArea" title="Diện Tích Thuê"/>
                          <display:column headerClass="text-center" property="emptyArea" title="Diện Tích Trống"/>
                          <display:column headerClass="text-center" property="rentPrice" title="Giá Thuê"/>
                          <display:column headerClass="text-center" property="serviceFee" title="Phí Dịch Vụ"/>
                          <display:column headerClass="text-center" property="brokerageFee" title="Phí Mô Giới"/>
                          <display:column headerClass="col-actions"  title="Thao tác">


                          <div class="hidden-sm hidden-xs btn-group">
                                <button class="btn btn-xs btn-success" onclick="openAssignModal(${tableList.id})" title="Giao Tòa Nhà">
                                    <i class="ace-icon fa fa-check bigger-120"></i>
                                </button>

                                <a href="/admin/building-edit-${tableList.id}" class="btn btn-xs btn-info" title="Sửa Tòa Nhà">

                                    <i class="ace-icon fa fa-pencil bigger-120"></i>

                                 </a>

                                <button class="btn btn-xs btn-danger" title="Xóa Tòa Nhà" onclick="deleteBuilding(${tableList.id})">
                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                </button>


                            </div>
                          </display:column>

                    </display:table>

                </div>
            </div>
        </div>
    </div>
<%--                <table id="buildingList" class="table table-striped table-bordered table-hover">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th class="center">--%>
<%--                            <label class="pos-rel">--%>
<%--                                <input type="checkbox" class="ace">--%>
<%--                                <span class="lbl"></span>--%>
<%--                            </label>--%>
<%--                        </th>--%>
<%--                        <th>Tên Tòa Nhà</th>--%>
<%--                        <th>Địa Chỉ</th>--%>
<%--                        <th>Số Tầng Hầm</th>--%>
<%--                        <th>Tên Quản Lý</th>--%>
<%--                        <th>SDT Quản Lý</th>--%>
<%--                        <th>Diện Tích Sàn</th>--%>
<%--                        <th>Diện Tích Thuê</th>--%>
<%--                        <th>Diện Tích Trống</th>--%>
<%--                        <th>Giá Thuê</th>--%>
<%--                        <th>Phí Dịch Vụ</th>--%>
<%--                        <th>Phí Môi Giới</th>--%>
<%--                        <th>Thao Tác</th>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>

<%--                    <tbody>--%>
<%--                    <c:forEach var="building" items="${buildings}">--%>
<%--                         <tr>--%>
<%--                        <td class="center">--%>
<%--                            <label class="pos-rel">--%>
<%--                                <input type="checkbox" class="ace" id="idBuilding" value="${building.id}">--%>
<%--                                <span class="lbl"></span>--%>
<%--                            </label>--%>
<%--                        </td>--%>

<%--                        <td>${building.name}</td>--%>
<%--                        <td>${building.address}</td>--%>
<%--                        <td>${building.numberOfBasement}</td>--%>
<%--                        <td>${building.managerName}</td>--%>
<%--                        <td>${building.managerPhone}</td>--%>
<%--                        <td>${building.floorArea}</td>--%>
<%--                        <td>${building.rentArea}</td>--%>
<%--                        <td></td>--%>
<%--                        <td>${building.rentPrice}</td>--%>
<%--                        <td>${building.serviceFee}</td>--%>
<%--                        <td>${building.brokerageFee}</td>--%>
<%--                        </tr>--%>
<%--                            <div class="hidden-sm hidden-xs btn-group">--%>
<%--                                <button class="btn btn-xs btn-success" onclick="openAssignModal(${building.id})" title="Giao Tòa Nhà">--%>
<%--                                    <i class="ace-icon fa fa-check bigger-120"></i>--%>
<%--                                </button>--%>

<%--                                <a href="/admin/building-edit-${building.id}" class="btn btn-xs btn-info" title="Sửa Tòa Nhà">--%>

<%--                                    <i class="ace-icon fa fa-pencil bigger-120"></i>--%>

<%--                                 </a>--%>

<%--                                <button class="btn btn-xs btn-danger" title="Xóa Tòa Nhà" onclick="deleteBuilding(${building.id})">--%>
<%--                                    <i class="ace-icon fa fa-trash-o bigger-120"></i>--%>
<%--                                </button>--%>


<%--                            </div>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </c:forEach>--%>

<%--                    </tbody>--%>

<%--                </table>--%>

    <!-- Modal -->
    <div class="modal fade" id="assignmentBuildingModal" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Danh Sách Nhân Viên</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table id="staffList" class="table table-striped table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="center">
                                <label class="pos-rel">
                                    <input type="checkbox" class="ace">
                                    <span class="lbl"></span>
                                </label>
                            </th>
                            <th class="center">Tên Nhân Viên</th>
                        </tr>
                        </thead>

                        <tbody>


                        </tbody>

                    </table>
                    <input type="hidden" id="buildingId" value="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy thao tác</button>
                    <button type="button" class="btn btn-primary" id="btnAssignBuilding">Giao tòa nhà</button>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.main-contain -->


<script>
    function openAssignModal(buildingId) {
        $('#assignmentBuildingModal').modal();
        $('#buildingId').val(buildingId);
        loadStaff(buildingId);
    }
    function loadStaff(buildingId){
        $.ajax({
            type : "GET",
            url: "/api/buildings/" + buildingId + "/staffs",
            dataType: "json",
            success : function (response){
               var row = '';
               $.each(response.data, function (index,item){
                  row += '<tr>';
                   row += '<td class="center"> <input type="checkbox" value= ' + item.staffId + ' id="checkbox_' + item.staffId + '" class="center" ' + (item.checked ? 'checked' : '') + '/> </td>';
                   row += '<td class="center">' + item.fullName + ' </td>';
                  row += '</tr>';
               });
               $('#staffList tbody').html(row);
               console.log(row);
            },
            error : function (response){
                console.log("Looxi");
            }
        });
    }

    $('#btnAssignBuilding').click(function (e) {
        e.preventDefault();
        var json = {};
        json['buildingId'] = $('#buildingId').val();
        var staffIds = $("#staffList").find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();
        json['staffs'] = staffIds;
        console.log("okok")
        if(json['buildingId'] == ''){
            alert("id not null");
        }
        else{

            assignmentBuilding(json)
        }

    })
    $('#btnDeleteBuilding').click(function (e) {
        e.preventDefault();
        var buildingIds = $("#buildingList").find('tbody input[type=checkbox]:checked').map(function () {
            return $(this).val();
        }).get();

        if (buildingIds.length === 0) {
            alert('Không có tòa nhà nào được chọn!');
        } else {
            if (confirm('Bạn có chắc chắn muốn xóa các tòa nhà đã chọn?')) {
                deleteBuildings(buildingIds);
            }
        }
    });

    function deleteBuilding(id) {
        if (id == '') {
            alert('Khoonh thấy nhà');
        }
        else {
            if (confirm("Bạn có chắc chắn muốn xóa tòa nhà này?")) {
                deleteBuildings([id]); // Gửi dưới dạng mảng 1 phần tử
            }
        }
    }
    function deleteBuildings(ids) {
        //gui request xuống sever =>> ajax
        $.ajax({
            type: "DELETE",
            url: "/api/buildings",
            data: JSON.stringify(ids),
            dataType: "json",
            contentType: "application/json",
            success: function (response) {
                alert(response.message);
                location.reload();
            },
            error: function () {
                alert("Xóa thất bại.");
            }
        });
    }


    function assignmentBuilding(json) {
        //gui request xuống sever =>> ajax
        $.ajax({
            type: "POST",
            url: "/api/assignment",

            data: JSON.stringify(json),
            dataType:"json",
            contentType: "application/json",
            success: function (response) {
                console.log('Thành Công');

                alert(response.message);
                $('#assignmentBuildingModal').modal('hide');

            },
            error: function (response) {
                console.log('Lỗi');
                alert(response.message);
            }
        });
    }
      $('#btnSearchBuilding').click(function(e){
           e.preventDefault();
           $('#listForm').submit();
      });
</script>
</body>
</html>
