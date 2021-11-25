<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<%@include file="include/meta.jsp" %>


<script>
	function setClassName() {
		document.getElementById('sizeSide').className = 'sidebar-toggle-display';
	}
</script>

<body id=sizeSide class="sidebar-hidden ">

<div class="container-scroller">
	<!-- 상단바 -->
	<%@include file="include/navbar.jsp" %>
	
	<div class="container-fluid page-body-wrapper">
		
		<c:if test="${user.email !=null && (user.rank == '관리자' || user.rank == '마스터 관리자')}"> 
			<%@include file="include/sidebar.jsp" %>
			<script>setClassName();</script>
		<!-- 관리자용 왼쪽 사이드바 -->
		
		</c:if>

		
		
		<div class="main-panel">
			<!-- contentPage가 없을 경우 -->
			<c:set var="contentPage" value="${param.contentPage}"/>
				<c:if test="${contentPage==null}">	
					<jsp:include page="main_temp.jsp" />
				</c:if>
				<c:if test="${contentPage!=null}">	
					<jsp:include page="${contentPage}" />
				</c:if>
			<%@include file="include/footer.jsp" %>
		</div>
		
  	</div>
  
  
</div>
<%@include file="include/plugin.jsp" %>
</body>
</html>