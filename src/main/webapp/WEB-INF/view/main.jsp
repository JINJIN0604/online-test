<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- beautify ignore:start -->
<html
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="resources/assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <title>LMS | 학습관리시스템</title>
	
	<!-- css -->
	<c:import url="/WEB-INF/view/inc/css.jsp"></c:import>
	
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
              <div class="row">
                <div class="col-lg-12 mb-4 order-0">
                  <div class="card">
                    <div class="d-flex align-items-end row">
                      <div class="col-sm-4">
                        <div class="card-body">
                          <h5 class="card-title text-primary">Congratulations John! 🎉</h5>
                          <p class="mb-4">
                            You have done <span class="fw-bold">72%</span> more sales today. Check your new badge in
                            your profile.
                          </p>

                          <a href="javascript:;" class="btn btn-sm btn-outline-primary">View Badges</a>
                        </div>
                      </div>
                      <div class="col-sm-5 text-center text-sm-left">
                        <div class="card-body pb-0 px-0 px-md-4">
                          <img
                            src="../assets/img/illustrations/man-with-laptop-light.png"
                            height="140"
                            alt="View Badge User"
                            data-app-dark-img="illustrations/man-with-laptop-dark.png"
                            data-app-light-img="illustrations/man-with-laptop-light.png"
                          />
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
            
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">정보처리기사</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>제목</th>
                        <th>등록일</th>
						<c:if test="${loginTeacher != null}"></c:if>                       
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
						<c:forEach var="t" items="${list}">
							<tr>
								<td>
									<div>
										<h6>${t.testTitle}</h6>
									</div>
								</td>
								<td>
									<span>${t.testDate}</span>
								</td>
								<c:if test="${loginTeacher != null}">
									<td>
										<a href="${pageContext.request.contextPath}/test/testOne?testNo=${t.testNo}">
											Edit
										</a>
									</td>
								</c:if>
							</tr>
					 	</c:forEach>
					</tbody>
				  </table>                    
              	</div>
              </div>
             </div>
              
              <!--/ Basic Bootstrap Table -->            
            
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
    </div>
    <!-- / Layout wrapper -->


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="resources/assets/vendor/js/bootstrap.js"></script>
    <script src="resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="resources/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
