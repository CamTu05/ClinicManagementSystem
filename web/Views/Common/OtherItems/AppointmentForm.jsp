<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Start call to action area-->
<style>
    #message-container {
        margin-bottom: 20px;
    }
    
    .alert {
        padding: 15px;
        margin-bottom: 15px;
        border-radius: 4px;
        position: relative;
        font-size: 14px;
        line-height: 1.5;
    }
    
    .alert-success {
        color: #155724;
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
    }
    
    .alert-error {
        color: #721c24;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
    }
    
    .alert-close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
        color: inherit;
        opacity: 0.7;
    }
    
    .alert-close:hover {
        opacity: 1;
    }
    
    .alert i {
        margin-right: 8px;
    }
</style>

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
    <!-- Hiển thị message ở đây -->
    <div id="message-container">
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <span class="alert-close" onclick="this.parentElement.style.display='none';">&times;</span>
                <i class="fa fa-check-circle"></i>
                <strong>Thành công!</strong> ${successMessage}
            </div>
        </c:if>

        <c:if test="${not empty errorMessage}">
            <div class="alert alert-error">
                <span class="alert-close" onclick="this.parentElement.style.display='none';">&times;</span>
                <i class="fa fa-exclamation-circle"></i>
                <strong>Lỗi!</strong> ${errorMessage}
            </div>
        </c:if>
    </div>
    
    <form id="appointment" class="clearfix" name="appointment-form" method="post" action="CreateAppointment">
        <div style="margin-bottom: 30px">
            <textarea style="border-color:#f0f0f0; width: 690px; max-width: 100%; padding:15px" maxlength="400" name="description" rows="4" placeholder="Nhập mô tả triệu chứng..."></textarea>
        </div>
        <div class="single-box mar-right-30">    
            <div class="input-box">
                <select id="serviceSelect" class="selectmenu" required name="service">
                    <option value="" selected disabled>-- Chọn dịch vụ khám --</option>
                    <c:forEach var="service" items="${sessionScope.services}">
                        <option value="${service.id}">${service.serviceName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="input-box">
                <select id="doctorSelect" class="selectmenu" required name="doctor" disabled>
                    <option value="" selected disabled>-- Chọn bác sĩ --</option>
                </select>  
            </div>
        </div>
        <div class="single-box">    
            <div class="input-box">
                <select id="dateSelect" class="selectmenu" name="date" required disabled>
                    <option value="" selected disabled>-- Chọn ngày khám --</option>
                </select>
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
<script>
    // Auto hide alert after 5 seconds
    setTimeout(function() {
        const alerts = document.querySelectorAll('#message-container .alert');
        alerts.forEach(function(alert) {
            alert.style.display = 'none';
        });
    }, 5000);
    
    // Hide message when form is submitted
    document.getElementById('appointment').addEventListener('submit', function() {
        const messageContainer = document.getElementById('message-container');
        if (messageContainer) {
            messageContainer.style.display = 'none';
        }
    });
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
// Prevent multiple initialization
if (typeof window.appointmentFormInitialized === 'undefined') {
    window.appointmentFormInitialized = true;
    
    $(document).ready(function () {
        // ===== CONFIGURATION =====
        
        // Initialize selectmenu AFTER all other configurations
        let selectmenuInitialized = false;
        
        $.ajaxSetup({
            cache: false,
            timeout: 10000
        });
        
        // Loading flags to prevent multiple requests
        let loadingStates = {
            doctors: false,
            dates: false,
            shifts: false
        };
        
        // ===== UTILITY FUNCTIONS =====
        
        // Safe element selector
        function safeSelect(selector) {
            const element = $(selector);
            if (element.length === 0) {
                console.warn('Element not found:', selector);
                return $();
            }
            return element;
        }
        
        // Initialize selectmenu properly
        function initializeSelectmenu() {
            if ($.fn.selectmenu && !selectmenuInitialized) {
                $('.selectmenu').selectmenu({
                    width: 'auto',
                    change: function(event, ui) {
                        // Trigger change event on original select
                        $(this).trigger('change');
                    }
                });
                selectmenuInitialized = true;
                console.log('Selectmenu initialized');
            }
        }
        
        // Reset all dependent fields
        function resetAllFields() {
            resetDoctorSelect();
            resetDateSelect();
            resetShiftSelect();
            console.log('All fields reset');
        }
        
        // Reset specific selects with selectmenu support
        function resetDoctorSelect() {
            const $select = safeSelect('#doctorSelect');
            if ($select.length) {
                $select.empty()
                    .append('<option value="" selected disabled>-- Chọn bác sĩ --</option>')
                    .prop('disabled', true);
                
                // Refresh selectmenu if initialized
                if (selectmenuInitialized && $select.selectmenu) {
                    try {
                        $select.selectmenu('refresh');
                    } catch (e) {
                        console.warn('Could not refresh doctor selectmenu:', e);
                    }
                }
            }
        }
        
        function resetDateSelect() {
            const $select = safeSelect('#dateSelect');
            if ($select.length) {
                $select.empty()
                    .append('<option value="" selected disabled>-- Chọn ngày khám --</option>')
                    .prop('disabled', true);
                
                // Refresh selectmenu if initialized
                if (selectmenuInitialized && $select.selectmenu) {
                    try {
                        $select.selectmenu('refresh');
                    } catch (e) {
                        console.warn('Could not refresh date selectmenu:', e);
                    }
                }
            }
        }
        
        function resetShiftSelect() {
            const $select = safeSelect('#shiftSelect');
            if ($select.length) {
                $select.empty()
                    .append('<option value="" selected disabled>-- Chọn buổi --</option>')
                    .prop('disabled', true);
                
                // Refresh selectmenu if initialized
                if (selectmenuInitialized && $select.selectmenu) {
                    try {
                        $select.selectmenu('refresh');
                    } catch (e) {
                        console.warn('Could not refresh shift selectmenu:', e);
                    }
                }
            }
        }
        
        // Update select with proper selectmenu handling
        function updateSelectWithAnimation(selectId, html, disabled = false) {
            const $select = safeSelect(selectId);
            if (!$select.length) return;
            
            // Update the select element
            $select.empty().html(html).prop('disabled', disabled);
            
            // Refresh selectmenu if initialized
            if (selectmenuInitialized && $select.selectmenu) {
                try {
                    $select.selectmenu('refresh');
                    if (disabled) {
                        $select.selectmenu('disable');
                    } else {
                        $select.selectmenu('enable');
                    }
                } catch (e) {
                    console.warn('Could not refresh selectmenu:', e);
                }
            }
        }
        
        // Show loading state with selectmenu support
        function showLoadingState(selectId, message) {
            const $select = safeSelect(selectId);
            if ($select.length) {
                $select.empty()
                    .append('<option value="" selected disabled>-- ' + message + ' --</option>')
                    .prop('disabled', true);
                
                // Refresh selectmenu if initialized
                if (selectmenuInitialized && $select.selectmenu) {
                    try {
                        $select.selectmenu('refresh');
                        $select.selectmenu('disable');
                    } catch (e) {
                        console.warn('Could not refresh selectmenu:', e);
                    }
                }
            }
        }
        
        // Show error state with selectmenu support
        function showErrorState(selectId, message) {
            const $select = safeSelect(selectId);
            if ($select.length) {
                $select.empty()
                    .append('<option value="" selected disabled>-- ' + message + ' --</option>')
                    .prop('disabled', false);
                
                // Refresh selectmenu if initialized
                if (selectmenuInitialized && $select.selectmenu) {
                    try {
                        $select.selectmenu('refresh');
                        $select.selectmenu('enable');
                    } catch (e) {
                        console.warn('Could not refresh selectmenu:', e);
                    }
                }
            }
        }
        
        // Parse JSON safely
        function parseJsonData(data) {
            try {
                return typeof data === 'string' ? JSON.parse(data) : data;
            } catch (e) {
                console.error('JSON parse error:', e);
                return null;
            }
        }
        
        // Generate timestamp for cache busting
        function getTimestamp() {
            return new Date().getTime();
        }
        
        // Validate form data
        function validateForm() {
            const service = safeSelect('#serviceSelect').val();
            const doctor = safeSelect('#doctorSelect').val();
            const date = safeSelect('#dateSelect').val();
            const shift = safeSelect('#shiftSelect').val();
            
            if (!service || !doctor || !date || !shift) {
                alert('Vui lòng điền đầy đủ thông tin');
                return false;
            }
            return true;
        }
        
        // ===== EVENT HANDLERS =====
        
        // Service selection handler
        function handleServiceChange() {
            const serviceId = $(this).val();
            console.log('Selected service ID:', serviceId);
            
            // Reset all dependent fields
            resetAllFields();
            
            if (!serviceId || loadingStates.doctors) {
                return;
            }
            
            loadingStates.doctors = true;
            showLoadingState('#doctorSelect', 'Đang tải...');
            
            $.get('DoctorByService', {
                serviceId: serviceId,
                _t: getTimestamp()
            })
            .done(function (data) {
                console.log('Raw doctor data:', data);
                
                const doctors = parseJsonData(data);
                if (doctors === null) {
                    showErrorState('#doctorSelect', 'Lỗi xử lý dữ liệu');
                    return;
                }
                
                console.log('Parsed doctors:', doctors);
                
                if (!Array.isArray(doctors) || doctors.length === 0) {
                    updateSelectWithAnimation('#doctorSelect', 
                        '<option value="" selected disabled>-- Không có bác sĩ --</option>', true);
                    return;
                }
                
                let html = '<option value="" selected disabled>-- Chọn bác sĩ --</option>';
                doctors.forEach(doctor => {
                    const doctorId = doctor.id;
                    const doctorName = doctor.fullname || doctor.name || 'Bác sĩ ' + doctor.id;
                    
                    if (doctorId) {
                        html += '<option value="' + doctorId + '">' + doctorName + '</option>';
                    }
                });
                
                updateSelectWithAnimation('#doctorSelect', html, false);
            })
            .fail(function (xhr, status, error) {
                console.error('Error loading doctors:', error);
                showErrorState('#doctorSelect', 'Không thể tải danh sách bác sĩ');
            })
            .always(function() {
                loadingStates.doctors = false;
            });
        }
        
        // Doctor selection handler
        function handleDoctorChange() {
            const doctorId = $(this).val();
            console.log('Selected doctor ID:', doctorId);
            
            resetDateSelect();
            resetShiftSelect();
            
            if (!doctorId || loadingStates.dates) {
                return;
            }
            
            loadingStates.dates = true;
            showLoadingState('#dateSelect', 'Đang tải...');
            
            $.get('DoctorSchedule', {
                doctorId: doctorId,
                _t: getTimestamp()
            })
            .done(function (data) {
                console.log('Raw schedule data:', data);
                
                const availableDates = parseJsonData(data);
                if (availableDates === null) {
                    showErrorState('#dateSelect', 'Lỗi xử lý dữ liệu lịch');
                    return;
                }
                
                if (!Array.isArray(availableDates) || availableDates.length === 0) {
                    updateSelectWithAnimation('#dateSelect', 
                        '<option value="" selected disabled>-- Bác sĩ không có lịch --</option>', true);
                    return;
                }
                
                let html = '<option value="" selected disabled>-- Chọn ngày khám --</option>';
                availableDates.forEach(dateInfo => {
                    html += '<option value="' + dateInfo.date + '">' + dateInfo.displayName + '</option>';
                });
                
                updateSelectWithAnimation('#dateSelect', html, false);
            })
            .fail(function (xhr, status, error) {
                console.error('Error loading schedule:', error);
                showErrorState('#dateSelect', 'Không thể tải lịch làm việc');
            })
            .always(function() {
                loadingStates.dates = false;
            });
        }
        
        // Date selection handler
        function handleDateChange() {
            const doctorId = safeSelect('#doctorSelect').val();
            const date = $(this).val();
            
            resetShiftSelect();
            
            if (!doctorId || !date || loadingStates.shifts) {
                return;
            }
            
            loadingStates.shifts = true;
            showLoadingState('#shiftSelect', 'Đang tải...');
            
            $.get('AvailableShifts', {
                doctorId: doctorId,
                date: date,
                _t: getTimestamp()
            })
            .done(function (data) {
                console.log('Raw shift data:', data);
                
                const shifts = parseJsonData(data);
                if (shifts === null) {
                    showErrorState('#shiftSelect', 'Lỗi xử lý dữ liệu');
                    return;
                }
                
                let html = '<option value="" selected disabled>-- Chọn buổi --</option>';
                if (Array.isArray(shifts)) {
                    shifts.forEach(shift => {
                        const shiftText = shift === 'Sáng' ? 'Sáng (7h-11h)' : 'Chiều (13h-17h)';
                        html += '<option value="' + shift + '">' + shiftText + '</option>';
                    });
                }
                
                updateSelectWithAnimation('#shiftSelect', html, false);
            })
            .fail(function (xhr, status, error) {
                console.error('Error loading shifts:', error);
                showErrorState('#shiftSelect', 'Không thể tải ca làm việc');
            })
            .always(function() {
                loadingStates.shifts = false;
            });
        }
        
        // Form submission handler
        function handleFormSubmit(e) {
            e.preventDefault();
            
            if (!validateForm()) {
                return false;
            }
            
            const formData = {
                service: safeSelect('#serviceSelect').val(),
                doctor: safeSelect('#doctorSelect').val(),
                date: safeSelect('#dateSelect').val(),
                shift: safeSelect('#shiftSelect').val(),
                description: $('textarea[name="description"]').val()
            };
            
            console.log('Form submitted with data:', formData);
            
            // Submit form normally or via AJAX
            this.submit();
        }
        
        // ===== BIND EVENTS =====
        
        // Unbind existing events first to prevent duplicates
        $(document).off('change', '#serviceSelect')
                   .off('change', '#doctorSelect')
                   .off('change', '#dateSelect')
                   .off('submit', '#appointment');
        
        // Initialize selectmenu first
        initializeSelectmenu();
        
        // Bind events - use selectmenuchange for selectmenu elements
        if (selectmenuInitialized) {
            $('#serviceSelect').on('selectmenuchange', handleServiceChange);
            $('#doctorSelect').on('selectmenuchange', handleDoctorChange);
            $('#dateSelect').on('selectmenuchange', handleDateChange);
        } else {
            // Fallback to regular change events
            $(document).on('change', '#serviceSelect', handleServiceChange);
            $(document).on('change', '#doctorSelect', handleDoctorChange);
            $(document).on('change', '#dateSelect', handleDateChange);
        }
        
        $(document).on('submit', '#appointment', handleFormSubmit);
        
        console.log('Appointment form initialized successfully');
    });
}
</script>

