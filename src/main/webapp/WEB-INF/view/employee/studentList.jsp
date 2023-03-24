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
                <h5 class="card-header">학생 리스트</h5>
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>삭제</th>
                      </tr>
	 				<c:forEach var="t" items="${list}">
						<tr>
							<td>${t.teacherId}</td>
							<td>${t.teacherName}</td>
							<td>
								<a href="${pageContext.request.contextPath}/employee/removeTeacher?teacherNo=${t.teacherNo}"><i class="bx bx-trash me-1"></i></a>
							</td>
						</tr>
					</c:forEach>	                      
                   </thead>
                  </table> 
                  <br>
		<form method="get" action="${pageContext.request.contextPath}/employee/teacherList">
			<input type="text" name="searchWord">
			<button type="submit">이름검색</button>
		</form> 
				        <!-- 페이징 -->
			          	<div class="pagination-container">
	 						<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=1&searchWord=${searchWord}">처음</a>
								<c:if test="${currentPage > 1}">		
									<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
								</c:if>	
					        	<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
					        		<c:if test="${i == currentPage}">
								      <a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${i}&searchWord=${searchWord}">${i}</a>	    
									</c:if>
					        		<c:if test="${i != currentPage}">
								      <a  href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < lastPage}">		
									<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>	
								</c:if>	
							<a href="${pageContext.request.contextPath}/employee/teacherList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
					  	</div>		                                    
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