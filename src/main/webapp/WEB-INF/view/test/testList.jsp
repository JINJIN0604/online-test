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

            
              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header">시험문제</h5>
                
			                      	<form method="post" action="${pageContext.request.contextPath}/test/addTest" id="addTest">
				                      	<h6>퀴즈 추가</h6>
			                      		<div>
			                      			<p id="msg"></p>
	                      				</div>
										<div>
									      <label>제목</label>
	  									  <input type="text" name="testTitle" id="testTitle" >
	  									  
									      <label>날짜</label>
									      <input type="date" name="testDate" id="testDate">
									    </div>
									    <div>
									    	<button type="submit" id="addTestBtn">추가</button>
		                      		
		                   				 </div>
									</form>                
                
                
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>문제</th>
                        <th>등록일</th>
                        <th>삭제</th>                   
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
						<c:forEach var="t" items="${list}">
						                    <tr>
						                      <td>
						                        <div>
						                            <h6>
						                            	<a href="${pageContext.request.contextPath}/test/testOne?testNo=${t.testNo}">${t.testTitle}</a>
						                            </h6>
						                          </div>
						                      </td>
					                          <td>
						                       		<span>${t.testDate}</span>
						                      </td>
						                      <td>
						                          <a href="${pageContext.request.contextPath}/test/removeTest?testNo=${t.testNo}">삭제</a>
						                      </td>
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
    <script src="../resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="../resources/assets/vendor/js/bootstrap.js"></script>
    <script src="../resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="../resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="../resources/assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="../resources/assets/js/dashboards-analytics.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
