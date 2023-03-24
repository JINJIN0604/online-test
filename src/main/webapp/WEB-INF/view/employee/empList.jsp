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
                <h5 class="card-header">직원 리스트</h5>
        				<form method="get" action="${pageContext.request.contextPath}/employee/empList">
					<input type="text" name="searchWord" placeholder="사원 이름 검색">
					<button type="submit" class="btn btn-sm btn-primary">검색</button>
                	<a href="${pageContext.request.contextPath}/employee/addEmp" class="btn btn-sm btn-secondary">사원등록</a>
				</form>          
                
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>삭제</th>
                      </tr>
	 				<c:forEach var="e" items="${list}">
						<tr>
							<td>${e.empId}</td>
							<td>${e.empName}</td>
							<td>
								<a href="${pageContext.request.contextPath}/employee/removeEmp?empNo=${e.empNo}"><i class="bx bx-trash me-1"></i></a>
							</td>
						</tr>
					</c:forEach>	                      
                   </thead>
        
                  </table>
	
				        <!-- 페이징 -->
			          	<div class="pagination-container">
	 						<a href="${pageContext.request.contextPath}/employee/empList?currentPage=1&searchWord=${searchWord}">처음</a>
								<c:if test="${currentPage > 1}">		
									<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage-1}&searchWord=${searchWord}">이전</a>
								</c:if>	
					        	<c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
					        		<c:if test="${i == currentPage}">
								      <a href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&searchWord=${searchWord}">${i}</a>	    
									</c:if>
					        		<c:if test="${i != currentPage}">
								      <a  href="${pageContext.request.contextPath}/employee/empList?currentPage=${i}&searchWord=${searchWord}">${i}</a>
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < lastPage}">		
									<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${currentPage+1}&searchWord=${searchWord}">다음</a>	
								</c:if>	
							<a href="${pageContext.request.contextPath}/employee/empList?currentPage=${lastPage}&searchWord=${searchWord}">마지막</a>
					  	</div>
					</div>                 
                  
                  
                  
         
                  
                  <br><br>
                         <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center pagination-sm">
                            <li class="page-item prev">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="tf-icon bx bx-chevrons-left"></i
                              ></a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">1</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">2</a>
                            </li>
                            <li class="page-item active">
                              <a class="page-link" href="javascript:void(0);">3</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">4</a>
                            </li>
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0);">5</a>
                            </li>
                            <li class="page-item next">
                              <a class="page-link" href="javascript:void(0);"
                                ><i class="tf-icon bx bx-chevrons-right"></i
                              ></a>
                            </li>
                          </ul>
                        </nav>                 
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->

              <hr class="my-5" />

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
