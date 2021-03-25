<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 12355 제주특별시자치도 서귀포시 __ 신서로79길, (강정동, 인터넷 카페) -->
<hr id="z"/>
<c:forEach var="vo" items="${list}" >
	<li><sapn class="zCode">${vo.zipcode} </sapn><span class="addr">${vo.sido } ${vo.sigungu } <c:if test="${vo.um!=null}">${vo.um} </c:if>${vo.doro} ${vo.gibun1}<c:if test="${vo.gibun2!=0} ">-${vo.gibun2} </c:if> (${vo.dong} <c:if test="${vo.sibuild!=null} ">, ${vo.sibuild} </c:if>)</span></li>
</c:forEach>
<hr id="z"/>