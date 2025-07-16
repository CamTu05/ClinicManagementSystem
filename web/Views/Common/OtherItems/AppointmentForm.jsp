<%-- 
    Document   : AppointmentForm
    Created on : Jul 8, 2025, 1:33:18 PM
    Author     : admin
--%>

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
                        <form id="appointment" class="clearfix" name="appointment-form" action="https://st.ourhtmldemo.com/new/Hospitals/inc/sendmail.php" method="post">
                            <div style="margin-bottom: 30px">
                                <textarea style="border-color:#f0f0f0; width: 690px; max-width: 100%; padding:15px" maxlength="400" name="description" rows="4" placeholder="Nhập mô tả triệu chứng..."></textarea>
                            </div>
                            <div class="single-box mar-right-30">    
                                <div class="input-box">
                                    <div class="input-box">  
                                        <select id="serviceSelect" class="selectmenu" required name="service">
                                            <option value="" selected disabled>-- Chọn dịch vụ khám --</option>
                                            <option>Cardiology</option>
                                            <option>Pulmonology</option>
                                            <option>Gynecology</option>
                                            <option>Neurology</option>
                                            <option>Urology</option>
                                            <option>Gastrology</option>
                                            <option>Pediatrician</option>
                                            <option>Laboratory</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="input-box">
                                    <select id="doctorSelect" class="selectmenu" required name="doctor" disabled>
                                        <option value="" selected disabled>-- Chọn bác sĩ --</option>
                                        <option>Marc Parcival</option>
                                        <option>Alen Bailey</option>
                                        <option>Basil Andrew</option>
                                        <option>Giles Franklin</option>
                                        <option>Edgar Denzil</option>
                                        <option>Garfield Feris</option>
                                    </select>  
                                </div>
                            </div>
                            <div class="single-box">    
                                <div class="input-box">
                                    <input id="dateSelect" type="text" name="date" placeholder="-- Chọn ngày khám --" id="datepicker" required disabled>
                                    <div class="icon-box">
                                        <i class="fa fa-angle-down" aria-hidden="true"></i>
                                    </div>
                                </div>       
                                <div class="input-box">  
                                    <select id="shiftSelect" class="selectmenu" required name="shift" disabled>
                                        <option value="" selected disabled>-- Chọn buổi --</option>
                                        <option>Buổi sáng</option>
                                        <option>Buổi chiều</option>
                                    </select>  
                                </div>
                            </div>
                            <button class="thm-btn bgclr-1" type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>    
                        </form> 

                        <!--                        <div class="form-overlay" id="formOverlay">
                                                    <div class="overlay-message">
                                                        <i class="fa fa-lock"></i> Cần đăng nhập để đặt lịch
                                                    </div>
                                                </div>-->

                    </div> 

                </div>
            </div>
        </div>
    </div>
</section>
<!--End call to action area-->

<script>
    // Khi chọn dịch vụ, gọi đến DoctorByService để lấy danh sách bác sĩ theo dịch vụ
    $('#serviceSelect').on('change', function () {
        const serviceId = $(this).val();

        // Reset các phần chọn phía sau
        $('#doctorSelect').html('<option value="" selected disabled>-- Chọn bác sĩ --</option>').prop('disabled', true);
        $('#dateSelect').val('').prop('disabled', true);
        $('#shiftSelect').html('<option value="" selected disabled>-- Chọn buổi --</option>').prop('disabled', true);

        if (serviceId) {
            $.get('DoctorByService', {serviceId}, function (data) {
                const doctors = JSON.parse(data);
                let html = '<option value="" selected disabled>-- Chọn bác sĩ --</option>';
                doctors.forEach(d => {
                    html += `<option value="${d.id}">${d.fullname}</option>`;
                });
                $('#doctorSelect').html(html).prop('disabled', false);
            });
        }
    });

    // Khi chọn bác sĩ, enable ô chọn ngày
    $('#doctorSelect').on('change', function () {
        $('#dateSelect').val('').prop('disabled', false);
        $('#shiftSelect').html('<option value="" selected disabled>-- Chọn buổi --</option>').prop('disabled', true);
    });

    // Khi chọn ngày, gửi AJAX đến ShiftServlet để lấy buổi còn trống
    $('#dateSelect').on('change', function () {
        const doctorId = $('#doctorSelect').val();
        const date = $(this).val();

        $('#shiftSelect').html('<option value="">-- Chọn buổi --</option>').prop('disabled', true);

        if (doctorId && date) {
            $.get('ShiftServlet', {doctorId, date}, function (data) {
                const shifts = JSON.parse(data); // ["morning", "afternoon"]
                let html = '<option value="">-- Chọn buổi --</option>';
                if (shifts.includes("morning"))
                    html += '<option value="morning">Sáng (7h-11h)</option>';
                if (shifts.includes("afternoon"))
                    html += '<option value="afternoon">Chiều (13h-17h)</option>';
                $('#shiftSelect').html(html).prop('disabled', false);
            });
        }
    });

    // Giới hạn ngày: từ hôm nay đến 14 ngày sau
    const today = new Date();
    const maxDay = new Date();
    maxDay.setDate(today.getDate() + 14);
    document.getElementById('dateSelect').min = today.toISOString().split('T')[0];
    document.getElementById('dateSelect').max = maxDay.toISOString().split('T')[0];
</script>