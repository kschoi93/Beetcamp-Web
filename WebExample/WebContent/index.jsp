<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	$(function(){
		$("#slider").bxSlider({
			mode: 'horizontal'
			,sliderWidth:800
			,auto:false
			,captions:true
			,infiniteLoop : false
			,hideControlOnEnd : true
			
		})
		$("#navTab>li").hover(function(){	
			$(this).children("ul").css('display','flex');
			$(this).css("border-bottom","1px solid white");
		},function(){
			$(this).children("ul").css('display','none');
			$(this).css("border-bottom","none");
		});
		
		$("#selectAll").click(function(){
			if($("#selectAll").prop('checked')){
				$(".ckCheck").prop('checked',true);
			} else {
				$(".ckCheck").prop('checked',false);
			}
		})

	});
</script>
<section>
<div>
	<ul id="navTab">
		<li><a href="#">나의서울</a></li>
		<li><a href="#">전자우편</a></li>
		<li><a href="#">서울소개</a>
			<ul id="infoSeoul">
				<li><a href="#">시청안내</a></li>
				<li><a href="#">서울의상징</a></li>
				<li><a href="#">서울의역사</a></li>
				<li><a href="#">서울정보</a></li>
			</ul>
		</li>
		<li><a href="#">시민참여</a>
			<ul id="citizen">
				<li><a href="#">서울시민과의대화</a></li>
				<li><a href="#">시민의견</a></li>
				<li><a href="#">공모전</a></li>
			</ul>
		</li>
		<li><a href="#">청사안내</a>
			<ul id="hallInfo">
				<li><a href="#">조직도</a></li>
				<li><a href="#">시의회</a></li>
				<li><a href="#">자치구</a></li>
			</ul>
		</li>
	</ul>
</div>
<div>
<ul id="slider">
	<li><a href="https://mediahub.seoul.go.kr/archives/2001115"><img src="<%=request.getContextPath()%>/img/banner1.jpg" title="Seoul Music Festival"/></a></li>
	<li><a href="https://www.seoul.go.kr/coronaV/coronaStatus.do?menu_code=46"><img src="<%=request.getContextPath()%>/img/banner2.jpg" title="SIBAC 2019"/></a></li>
	<li><a href="https://news.seoul.go.kr/welfare/archives/526865"><img src="<%=request.getContextPath()%>/img/banner3.jpg" title="2019 서울전환도시 국제컨퍼런스"/></a></li>
	<li><a href="https://mediahub.seoul.go.kr/archives/2001008"><img src="<%=request.getContextPath()%>/img/banner4.jpg" title="2019 다다다 발표대회"/></a></li>
	<li><a href="https://mediahub.seoul.go.kr/archives/2001127"><img src="<%=request.getContextPath()%>/img/banner5.jpg" title="2019 서울인공지능챗본론"/></a></li>
	<li><a href="https://mediahub.seoul.go.kr/archives/2001139"><img src="<%=request.getContextPath()%>/img/banner6.jpg" title="서울차 없는 날"/></a></li>
	<li><a href="https://news.seoul.go.kr/env/archives/511792"><img src="<%=request.getContextPath()%>/img/banner7.jpg" title="Zero 제로페이 미국 캐나다 이벤트"/></a></li>
</ul>
</div>
<h1 id="titleValue">자유게시판</h1>
<input type="checkbox" id="selectAll" name="selectAll" value="전체선택"/>전체선택<br/>
	<ul id="boardList">
		<li></li>
		<li>번호</li>
		<li class="wordCut">제목</li>
		<li>작성자</li>
		<li>작성일</li>
		<li>조회수</li>
		
		<c:forEach var="vo" items="${lst}">
			<li><input type="checkbox" class="ckCheck"></li>
			<li>${vo.no }</li>
			<li class="wordCut"><a href="<%=request.getContextPath()%>/list.jsp?num=1">${vo.subject }</a></li>
			<li>${vo.userid }</li>
			<li>${vo.writedate }</li>
			<li>${vo.hit }</li>
		</c:forEach>
	</ul>
	
	<div id="pageTab">
		<ul id="page">
			<c:if test="${pageVO.pageNum>1}"><!-- 이전 페이지가 있을 때 '이전'을 표시한다 -->
				<li style="width:50px;"><a href="<%=request.getContextPath()%>/board/list.do?pageNum=${pageVO.pageNum-1}">prev</a></li>
			</c:if>
			<!-- 페이지 번호 1~5 or 6~10 or .... -->
			<c:forEach var="p" begin="${pageVO.startPageNum}" end="${pageVO.startPageNum+pageVO.onePageNum-1}">
				<c:if test="${p<=pageVO.totalPage }">
					<c:if test="${p==pageVO.pageNum }"><!-- 현재 페이지일때 -->
						<li style="font-weight:bold; color:red; background-color:pink;"><a href="<%=request.getContextPath()%>/board/list.do?pageNum=${p}">${p}</a></li> 
					</c:if>
					<c:if test="${p!=pageVO.pageNum }"><!-- 현재 페이지 아닐때 -->
						<li><a href="<%=request.getContextPath()%>/board/list.do?pageNum=${p}">${p}</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${pageVO.pageNum < pageVO.totalPage }">
				<li style="width:50px;"><a href="<%=request.getContextPath()%>/board/list.do?pageNum=${pageVO.pageNum+1}">next</a></li>
			</c:if>
		</ul>
	</div>
</section>