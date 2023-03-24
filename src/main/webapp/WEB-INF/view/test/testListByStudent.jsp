<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

		<script>
			$(document).ready(function() {
			});
		</script>

</head>
<body>

	   <!-- SideNav -->
	   <h4>sidenav</h4>
		<c:import url="/WEB-INF/view/inc/sidenav.jsp"></c:import>
		<h4>navbar</h4>
		<!-- Navbar -->
		<c:import url="/WEB-INF/view/inc/navbar.jsp"></c:import>


			              <div>
			                <h6>시험문제</h6>
			              </div>

			            <form method="get" action="${pageContext.request.contextPath}/test/testListByStudent">
							<select name="rowPerPage">
								<option value="10">10
								<option value="20">20
								<option value="30">30
							</select>
							<button type="submit">검색</button>
						</form>
	                    <div>

			                <table>
			                  <thead>
			                    <tr>
			                      <th>시험</th>
			                      <th>날짜</th>
			                      <th>점수</th>
			                    </tr>
			                  </thead>
			                  <tbody>
				                  <c:forEach var="t" items="${list}">
				                    <tr>
				                      <td>
				                        <div>

				                            <h6>
				                            	<a href="${pageContext.request.contextPath}/test/testOneByStudent?testNo=${t.testNo}">${t.testTitle}</a>
				                            </h6>
				                          </div>
				                      </td>
			                          <td>
			                       		<span>${t.testDate}</span>
				                      </td>
				                    </tr>
			                    </c:forEach>
			                  </tbody>
			                </table>
			              </div>

	
		          <!-- 페이징 -->
		          <div class="pagination-container">
			          <ul class="pagination pagination-primary pagination-sm justify-content-center">
			          	<li class="page-item">
					        <a class="page-link" href="${pageContext.request.contextPath}/test/testListByStudent?currentPage=${currentPage-1}" aria-label="Previous">
					          <span aria-hidden="true">
					          	<span class="material-icons">
									keyboard_arrow_left
								</span>
							</span>
				          </a>
				        </li>
				        <c:forEach var="i" begin="${beginPage}" end="${endPage}" step="1">
							<li class="page-item active">
						      <a class="page-link" href="${pageContext.request.contextPath}/test/testListByStudent?currentPage=${i}">${i}</a>
						    </li>
						</c:forEach>
					    <li class="page-item">
					        <a class="page-link" href="${pageContext.request.contextPath}/test/testListByStudent?currentPage=${currentPage+1}" aria-label="Previous">
					          <span aria-hidden="true">
					          	<span class="material-icons">
									keyboard_arrow_right
								</span>
							</span>
					        </a>
					     </li>
					  </ul>
				  </div>
		     

</body>
</html>