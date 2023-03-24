<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!-- beautify ignore:start -->
<html

  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../resources/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <title>LMS | 학습관리시스템</title>    
    
 	<!-- css -->
	<c:import url="/WEB-INF/view/inc/css2.jsp"></c:import>   
 </head>

  <body>
  	   <!-- SideNav -->
	   <h4>sidenav</h4>
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
		<h4>navbar</h4>
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>  
  
  
  
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        
        <!-- Menu -->
		<c:import url="/WEB-INF/view/inc/menu.jsp"></c:import>         
		<!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
		
		
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/nav.jsp"></c:import>  

          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">

              <!-- Basic Layout & Basic with Icons -->
              <div class="row">
                <!-- Basic Layout -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">사원등록</h5>
                    </div>
                    <div class="card-body">
                      <form method="post" action="${pageContext.request.contextPath}/employee/addEmp">
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">아이디</label>
                          <div class="col-sm-10">
                            <input type="text" class="form-control" id="empId" name="empId">
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-company">패스워드</label>
                          <div class="col-sm-10">
                            <input
                              type="text"
                              name="empPw"
                              class="form-control"
                              id="basic-default-company"
                            />
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-default-name">이름</label>
                          <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName">
                          </div>
                        </div>                        
                        
                         <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
			</div>
            </div>
            </div>
            <!-- / Content -->            
 			
 			<!-- footer -->
			<c:import url="/WEB-INF/view/inc/footer.jsp"></c:import>
	
            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
   
    <!-- / Layout wrapper -->
    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="../resources/assets/vendor/js/bootstrap.js"></script>
    <script src="../resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>