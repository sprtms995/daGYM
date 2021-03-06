<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="${contextPath }/resources/css/event.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="../common/header.jsp"/>
 <jsp:include page="sideMenu.jsp"/>
<div class="container event m-5" id="container">

	<ul class="tabType1">
		<li><a href="list">진행중 이벤트</a></li>
		<li class="on"><a href="end-list">종료된 이벤트</a></li>
	</ul>
	
				<c:choose>
			<c:when test="${empty eventList }">
				<tr><td colspan="6">존재하는 게시글이 없습니다.</td></tr>
			</c:when>
			<c:otherwise>
			
				<c:forEach var="event" items="${eventList }">
					<a href="${event.boardNo}?cp=${pInfo.currentPage}">
					<div class="view">
						<div class="thumb">
	               				<c:forEach items="${thList}" var="th">
	               					<c:if test="${th.parentBoardNo == event.boardNo}">
	               						<c:set var="src" value="${contextPath}${th.filePath}/${th.fileChangeName}"/>
	               						<img src="${src}">
	               					</c:if>
	               					
	               				</c:forEach>
							</div>
							<p class="ing" > 종료</p>
							<p class="tit">${event.boardTitle }</p>
							<fmt:formatDate var='startDate' value="${event.startDate}" pattern="yy-MM-dd" />
							<fmt:formatDate var='endDate' value="${event.endDate}" pattern="yy-MM-dd" />
							<p class="date">${startDate } ~ ${endDate }</p>
					</div>
					</a>
				</c:forEach>
				
			</c:otherwise>
		</c:choose>
	
	<hr>
	
	<div class="my-4">
		<c:set var="url" value="${contextPath}/event/end-list?cp="></c:set>
        	<ul class="pagination">
            	<c:if test="${pInfo.currentPage > pInfo.pagingBarSize }">	
	                <li>
	                	<!-- 맨 처음으로(<<) -->
	                    <a class="page-link text-primary" href="${url}1">&lt;&lt;</a>
	                </li>
	                
	                <li>
	                	<!-- 이전으로(<) -->
	                	<!-- prev 생성 식 : (현재 페이지 - 1) / 페이징바 사이즈(10) * 10 -->
	                	<!-- fmt태그를 이용한 소수점 제거 -->
	                	<fmt:parseNumber var="operand1" value="${(pInfo.currentPage -1)/pInfo.pagingBarSize}" integerOnly="true"/>
	                	<c:set var="prev" value="${operand1 * pInfo.pagingBarSize}"></c:set>
                   		<a class="page-link text-primary" href="${url}${prev}">&lt;</a>
	                </li>
                </c:if>
                
                <!-- 10개의 페이지 목록 -->
                <c:forEach var="p" begin="${pInfo.startPage }" end="${pInfo.endPage }">
                	<c:choose>
                		<c:when test="${p == pInfo.currentPage}">
            				<li><a class="page-link">${p }</a></li>
                		</c:when>
                		<c:otherwise>
		               		<li>
<%-- 		               			<a class="page-link text-primary" href="${pInfo.boardType }?cp=${p}">${p}</a> --%>
		               			<a class="page-link text-primary" href="${url}${p}">${p}</a>
		                	</li>
                		</c:otherwise>
					</c:choose>               
                </c:forEach>
                <!-- 다음 페이지로(>) -->
                <!-- next 생성 식 : (현재 페이지 + 9) / 10 * 10 + 1 -->
                <c:if test="${pInfo.maxPage > pInfo.endPage}">
	                <li>
	                	<fmt:parseNumber var="operand2" value="${(pInfo.currentPage + pInfo.pagingBarSize - 1)/pInfo.pagingBarSize} " integerOnly="true"/>
	                	<c:set var="next" value="${operand2 * pInfo.pagingBarSize + 1 }"/>
						<a class="page-link text-primary" href="${url}${next}">&gt;</a>
	                </li>
	                
	                <!-- 맨 끝으로(>>) -->
	                <li>
	                    <a class="page-link text-primary" href="${url}${pInfo.maxPage}">&gt;&gt;</a>
	                </li>
                </c:if>
            </ul>
        </div>	     
</div>
<%@ include file="../common/footer.jsp" %>

<script>
$(function(){
	$("#list-table td").on("click", function(){
		// 글번호
		var boardNo = $(this).parent().children().eq(0).text();
		
		var boardUrl = "${contextPath}/board/${pInfo.boardType}/"+boardNo + "?cp=${pInfo.currentPage}";
		
		
		// @pathValue 방식 : 구분되어야 하는 리소스를 호출하는 url로 사용
		
		location.href = boardUrl;
	});
});

$(".view").on("mouseenter",function(){
	
	$(this).parent().css("cursor", "pointer");
});
</script>
</body>
</html>