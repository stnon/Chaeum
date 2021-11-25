<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:forEach var="tmp" items="${clist }">
	<c:choose>
		<c:when test="${sessionScope.email ne tmp.send_nick }">
		<!-- 받은 메세지 -->
		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<a href="memberOne.do?other_email=${tmp.send_nick }">
				</a>
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
				<p>${tmp.send_nick}</p>
					<p>${tmp.content }</p>
					<span class="time_date"> ${tmp.send_time }</span>
				</div>
			</div>
		</div>
		</c:when>
		
		<c:otherwise>
		<!-- 보낸 메세지 -->
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>${tmp.content }</p>
				<span class="time_date"> ${tmp.send_time }</span>
			</div>
		</div>
		</c:otherwise>
	</c:choose>
</c:forEach>