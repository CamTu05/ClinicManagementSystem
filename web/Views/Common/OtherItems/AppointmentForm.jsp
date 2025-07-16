<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Start call to action area-->
<section id="appointment-form" class="callto-action-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="inner-content">
                    <div class="title-box text-center">
                        <span class="flaticon-calendar"></span>
                        <h2>Đặt lịch khám</h2>    
                    </div>
                    <div class="form-holder clearfix">
                        <form id="appointment" class="clearfix" name="appointment-form" method="post">
                            <div style="margin-bottom: 30px">
                                <textarea style="border-color:#f0f0f0; width: 690px; max-width: 100%; padding:15px" maxlength="400" name="description" rows="4" placeholder="Nhập mô tả triệu chứng..."></textarea>
                            </div>
                            <div class="single-box mar-right-30">    
                                <div class="input-box">
                                    <div class="input-box">  
                                        <select id="serviceSelect" class="selectmenu" required name="service">
                                            <option value="" selected disabled>-- Chọn dịch vụ khám --</option>
                                            <c:forEach var="service" items="${sessionScope.services}">
                                                <option value="${service.id}">${service.serviceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-box">
                                    <select id="doctorSelect" class="selectmenu" required name="doctor" disabled>
                                        <option value="" selected disabled>-- Chọn bác sĩ --</option>
                                    </select>  
                                </div>
                            </div>
                            <div class="single-box">    
                                <div class="input-box">
                                    <input id="dateSelect" type="date" name="date" placeholder="-- Chọn ngày khám --" required disabled>
                                    <div class="icon-box">
                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                    </div>
                                </div>       
                                <div class="input-box">  
                                    <select id="shiftSelect" class="selectmenu" required name="shift" disabled>
                                        <option value="" selected disabled>-- Chọn buổi --</option>
                                    </select>  
                                </div>
                            </div>
                            <button class="thm-btn bgclr-1" type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>    
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End call to action area-->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function () {
    // Khi chọn dịch vụ
    $('#serviceSelect').on('change', function () {
        const serviceId = $(this).val();
        console.log('Selected service ID:', serviceId);

        // Reset
        $('#doctorSelect').html('<option value="" selected disabled>-- Chọn bác sĩ --</option>').prop('disabled', true);
        $('#dateSelect').val('').prop('disabled', true);
        $('#shiftSelect').html('<option value="" selected disabled>-- Chọn buổi --</option>').prop('disabled', true);

        if (serviceId) {
            $.get('DoctorByService', {serviceId: serviceId}, function (data) {
                console.log('Raw data received:', data);
                
                let doctors;
                try {
                    if (typeof data === 'string') {
                        doctors = JSON.parse(data);
                    } else {
                        doctors = data;
                    }
                } catch (e) {
                    console.error('JSON parse error:', e);
                    alert('Lỗi xử lý dữ liệu');
                    return;
                }
                
                console.log('Parsed doctors:', doctors);
                
                if (!Array.isArray(doctors) || doctors.length === 0) {
                    console.log('No doctors found');
                    $('#doctorSelect').html('<option value="" selected disabled>-- Không có bác sĩ --</option>');
                    return;
                }

                let html = '<option value="" selected disabled>-- Chọn bác sĩ --</option>';
                
                for (let i = 0; i < doctors.length; i++) {
                    const doctor = doctors[i];
                    console.log('Processing doctor:', doctor);
                    
                    // Lấy id và name
                    const doctorId = doctor.id;
                    const doctorName = doctor.fullname || doctor.name || 'Bác sĩ ' + doctor.id;
                    
                    console.log('Doctor ID:', doctorId, 'Name:', doctorName);
                    
                    if (doctorId) {
                        html += '<option value="' + doctorId + '">' + doctorName + '</option>';
                    }
                }
                
                console.log('Final HTML:', html);
                $('#doctorSelect').html(html).prop('disabled', false);
                
            }).fail(function (xhr, status, error) {
                console.error('AJAX error:', error);
                console.error('Response:', xhr.responseText);
                alert('Không thể tải danh sách bác sĩ');
            });
        }
    });

    // Các event khác giữ nguyên...
    $(document).on('change', '#doctorSelect', function () {
        const doctorId = $(this).val();
        console.log('Doctor selected:', doctorId);
        $('#dateSelect').val('').prop('disabled', false);
        $('#shiftSelect').html('<option value="" selected disabled>-- Chọn buổi --</option>').prop('disabled', true);
    });

    $(document).on('change', '#dateSelect', function () {
        const doctorId = $('#doctorSelect').val();
        const date = $(this).val();

        $('#shiftSelect').html('<option value="">-- Chọn buổi --</option>').prop('disabled', true);

        if (doctorId && date) {
            $.get('AvailableShifts', {doctorId: doctorId, date: date}, function (data) {
                let shifts;
                if (typeof data === 'string') {
                    shifts = JSON.parse(data);
                } else {
                    shifts = data;
                }

                let html = '<option value="">-- Chọn buổi --</option>';
                shifts.forEach(shift => {
                    const shiftText = shift === 'Sáng' ? 'Sáng (7h-11h)' : 'Chiều (13h-17h)';
                    html += '<option value="' + shift + '">' + shiftText + '</option>';
                });
                $('#shiftSelect').html(html).prop('disabled', false);
            });
        }
    });

    // Giới hạn ngày
    const today = new Date();
    const maxDay = new Date();
    maxDay.setDate(today.getDate() + 14);
    document.getElementById('dateSelect').min = today.toISOString().split('T')[0];
    document.getElementById('dateSelect').max = maxDay.toISOString().split('T')[0];
});
</script>

