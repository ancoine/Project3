<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="/common/taglib.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: anchu
  Date: 12/05/2025
  Time: 4:56 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="main-content " style="font-family: 'Times New Roman', Times, serif;">
  <div class="main-content-inner">
    <div class="breadcrumbs" id="breadcrumbs">
      <script type="text/javascript">
        try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
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
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
              <label class="lbl" for="ace-settings-navbar"> Fixed Navbar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
              <label class="lbl" for="ace-settings-sidebar"> Fixed Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs" />
              <label class="lbl" for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
              <label class="lbl" for="ace-settings-rtl"> Right To Left (rtl)</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
              <label class="lbl" for="ace-settings-add-container">
                Inside
                <b>.container</b>
              </label>
            </div>
          </div><!-- /.pull-left -->

          <div class="pull-left width-50">
            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-hover" />
              <label class="lbl" for="ace-settings-hover"> Submenu on Hover</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-compact" />
              <label class="lbl" for="ace-settings-compact"> Compact Sidebar</label>
            </div>

            <div class="ace-settings-item">
              <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-highlight" />
              <label class="lbl" for="ace-settings-highlight"> Alt. Active Item</label>
            </div>
          </div><!-- /.pull-left -->
        </div><!-- /.ace-settings-box -->
      </div><!-- /.ace-settings-container -->

      <div class="page-header">
        <h1>
          Thông tin tòa nhà
          <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            overview &amp; stats
          </small>
        </h1>
      </div><!-- /.page-header -->

    </div><!-- /.page-content -->

    <div class="row">
      <div class="col-xs-12">
        <form:form modelAttribute="buildingEdit" class="form-horizontal" role="form" id="form-edit" action="/admin/building-edit" method="GET" >
            <form:hidden path="id"/>
          <div class="form-group">
            <label class="col-xs-3 control-label">Tên Tòa Nhà(*)</label>
            <div class="col-xs-9">
              <form:input  class="form-control" path="name"/>
              <span class="error-message" style="color: red" id="nameError"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Quận(*)</label>
            <div class="col-xs-2">
             <form:select path="district"  class="form-control">
                                                    <form:option value=""> Chọn Quận </form:option>
                                                    <form:options items="${district}"/>


             </form:select>
              <span class="error-message" style="color: red" id="districtError"></span>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phường</label>
            <div class="col-xs-9">
             <form:input path="ward" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Đường</label>
            <div class="col-xs-9">
               <form:input path="street" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Kết Cấu</label>
            <div class="col-xs-9">
             <form:input path="structure" class="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Số Tầng Hầm</label>
            <div class="col-xs-9">
               <form:input path="numberOfBasement" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Diện Tích Sàn(*)</label>
            <div class="col-xs-9">
                <form:input path="floorArea" class="form-control"/>
                 <span class="error-message" style="color: red" id="floorAreaError"></span>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Hướng</label>
            <div class="col-xs-9">
              <form:input path="direction" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Hạng</label>
            <div class="col-xs-9">
              <form:input path="level" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Diện Tích Thuê(*)</label>
            <div class="col-xs-9">

               <form:input path="rentArea" class="form-control"/>
               <span class="error-message" style="color: red" id="rentAreaError"></span>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Giá Thuê(*)</label>
            <div class="col-xs-9">

              <form:input path="rentPrice" class="form-control"/>
               <span class="error-message" style="color: red" id="rentPriceError"></span>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Mô Tả Giá(*)</label>
            <div class="col-xs-9">

              <form:input path="rentPriceDescription" class="form-control"/>
               <span class="error-message" style="color: red" id="rentPriceDescriptionError"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phí Dịch Vụ</label>
            <div class="col-xs-9">

                <form:input path="serviceFee" class="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phí Ô Tô</label>
            <div class="col-xs-9">

              <form:input path="carFee" class="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phí Mô Tô</label>
            <div class="col-xs-9">

              <form:input path="motoFee" class="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phí Ngoài Giờ</label>
            <div class="col-xs-9">

              <form:input path="overtimeFee" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Tiền Điện</label>
            <div class="col-xs-9">

              <form:input path="electricityFee" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Tiền Nước</label>
            <div class="col-xs-9">

              <form:input path="waterFee" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Đặt Cọc</label>
            <div class="col-xs-9">

              <form:input path="deposit" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Thanh Toán</label>
            <div class="col-xs-9">

              <form:input path="payment" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Thời Gian Thuê(*)</label>
            <div class="col-xs-9">

              <form:input path="rentTime" class="form-control"/>
               <span class="error-message" style="color: red" id="rentTimeError"></span>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Thời Gian Trang Trí</label>
            <div class="col-xs-9">

              <form:input path="decorationTime" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Tên Quản Lý</label>
            <div class="col-xs-9">

              <form:input path="managerName" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">SDT Quản Lý</label>
            <div class="col-xs-9">

              <form:input path="managerPhone" class="form-control"/>

            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Loại Tòa Nhà</label>
            <div class="col-xs-9">
                <form:checkboxes path="typeCode" items="${typeCode}"/>
 <span class="error-message" style="color: red" id="typeCode"></span>
            </div>

          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Phí Môi Giới</label>
            <div class="col-xs-9">

                    <form:input path="brokerageFee" class="form-control"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">Ghi Chú</label>
            <div class="col-xs-9">

              <form:input path="note" class="form-control"/>

            </div>
          </div>
         <div class="form-group">
    <label class="col-xs-3 control-label">Hình đại diện</label>
    <input class="" type="file" id="uploadImage"/>
    <div class="col-xs-9">
        <c:if test="${not empty buildingEdit.image}">
            <c:set var="imagePath" value="/repository${buildingEdit.image}"/>
            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
        </c:if>
        <c:if test="${empty buildingEdit.image}">
            <img src="/common/admin/image/th.jpg" id="viewImage" width="300px" height="300px">
        </c:if>
    </div>
</div>
         <div class="form-group">
            <label class="col-xs-3 control-label"></label>
            <div class="col-xs-9">
            <c:if test="${not empty buildingEdit.id}">
             <button type="button" class="btn btn-warning" id="btnAddBuilding"> Cập Nhật </button>
            </c:if>
             <c:if test="${empty buildingEdit.id}">
             <button type="button" class="btn btn-primary" id="btnAddBuilding"> Thêm Tòa Nhà</button>
            </c:if>

              <a href="/admin/building-list">
                <button type="button" class="btn btn-danger"> Hủy Thao Tác</button>
              </a>

            </div>
          </div>
          </div>

        </form:form>
      </div>
    </div>
  </div>
</div><!-- /.main-content -->


<script>
  var imageBase64 = '';
  var imageName = '';

  function validateDataBuilding(json) {
    $('.error-message').text(''); // Xóa hết thông báo cũ
    let isValid = true;

    if (!json['name']) {
      $('#nameError').text('Tên Tòa Nhà Không Được Để Trống');
      isValid = false;
    }

    if (!json['district']) {
      $('#districtError').text('Quận Không Được Để Trống');
      isValid = false;
    }

    if (!json['typeCode'] || json['typeCode'].length === 0) {
      $('#typeCode').text('Loại Tòa Nhà Không Được Để Trống');
      isValid = false;
    }

    if (!json['floorArea']) {
      $('#floorAreaError').text('Diện Tích Sàn Không Được Để Trống');
      isValid = false;
    }

    if (!json['rentArea']) {
      $('#rentAreaError').text('Diện Tích Thuê Không Được Để Trống');
      isValid = false;
    }

    if (!json['rentPrice']) {
      $('#rentPriceError').text('Giá Thuê Không Được Để Trống');
      isValid = false;
    }
    if (!json['rentPriceDescription']) {
      $('#rentPriceDescriptionError').text('Mô Tả Giá Không Được Để Trống');
      isValid = false;
    }

    if (!json['rentTime']) {
      $('#rentTimeError').text('Thowfi Gian Thuê Không Được Để Trống');
      isValid = false;
    }

    return isValid;
  }


  $('#btnAddBuilding').click(function (e) {
    e.preventDefault();
    var formData = $('#form-edit').serializeArray();
    var json = {};
    var typeCode = [];

    $.each(formData, function (i, it) {
      if ('' !== it.value && null != it.value) {
        if (it.name == 'typeCode') {
          typeCode.push(it.value);
        } else {
         json['' + it.name + ''] = it.value;
        }
      }
      if (imageBase64 !== '') {
        json['imageBase64'] = imageBase64;
        json['imageName'] = imageName;
      }
    });

    json['typeCode'] = typeCode;
    var buildingId = json['id'];
    $('#loading_image').show();



    console.log('Dữ liệu chuẩn bị gửi:', json);
    var isValid = validateDataBuilding(json);
    if (!isValid) {
      $('#loading_image').hide();
      return;
    }
    addOrUpdateBuilding(json);
    openImage(this, "viewImage");
  });



  $('#uploadImage').change(function (event) {
    var reader = new FileReader();
    var file = $(this)[0].files[0];
    reader.onload = function(e){
      imageBase64 = e.target.result;
      imageName = file.name; // ten hinh khong dau, khoang cach. Dat theo format sau: a-b-c
    };
    reader.readAsDataURL(file);
    openImage(this, "viewImage");
  });


  function openImage(input, imageView) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#' +imageView).attr('src', reader.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }


  function addOrUpdateBuilding(json){
    $.ajax({
      type: 'POST',
      url: "/api/buildings",
      data: JSON.stringify(json),
      dataType: "json",
      contentType: "application/json",
      success: function(response){
        console.log('Thành Công');
        alert('Update Building');
        location.reload();
        window.location.href = "/admin/building-list";
      },
      error: function(response){
        console.log('Lỗi:', response);
        alert('Gửi dữ liệu thất bại');

      }
    });
  }
</script>

</body>
</html>
