<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/jamong.com/resources/css/category.css" />
<script type="text/javascript" src="/jamong.com/resources/js/category.js"></script>
 <div id=cat_empty oncontextmenu="return false" ondragstart="return false"
  onselectstart="return false">
  <div id=cat_title_name><strong>${cat_name}</strong></div>
   <div id=cat_writer_block>
    <div id=cat_writer_title><b>추천작가</b></div>
     <div id=cat_writer_list>
      <c:forEach var="cat" items="${mlist}">
       <a class=cat_writer_a align="center" href="/jamong.com/@${cat.mem_id}">
      	<div id=cat_writer_list1>
      	
       		<div id=cat_writer_face1>
        		<img class="cat_face_img" src="/jamong.com/resources/img/cat_writer_face1.jpg" alt="작가이미지" />
       		</div>
       		<div class=cat_writer_name><strong>${cat.mem_nickname}</strong></div>
       		<div id=cat_write_count>글:${cat.mem_article}</div>
       		<div id=cat_sub_count>구독자:${cat.mem_subscribe}</div>
      		 <div class=cat_writer_keyword_div>
      			<c:if test="${!empty cat.mem_fav1}">
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav1}</strong></button>
      		  	</c:if>
      		    <c:if test="${!empty cat.mem_fav2}">
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav2}</strong></button>
      		 	</c:if>
      		 	 <c:if test="${!empty cat.mem_fav3}">
      		 	<button class="cat_writer_keyword" ><strong>${cat.mem_fav3}</strong></button>
      		 	</c:if>
      		 </div>
      	</div>
       </a>
       </c:forEach>
     </div>
     
     <div class=cat_write_button>
      <button type="button" id="cat_write_button" class="cat_write_btn" onclick="location.href='#article';">Article</button>
      <button type="button" id="cat_book_button" class="cat_book_btn" onclick="location.href='#book';">Book</button>     	 
     </div>
   </div>
   
    <!-- 글 내용부분 -->
    <c:if test="${!empty blist}">
    <c:forEach var="blist" items="${blist}">
	 <c:if test="${!empty blist.bo_thumbnail}">
	<div class=cat_writing_block>
	 <div class=cat_writing>
	  <div class="cat_writing_img-div">
	   <img class="cat_writing_img" src="${blist.bo_thumbnail}" alt="글" />
	  </div>
	 <a class=cat_write_top href="/jamong.com/@${blist.memberVO.mem_id}/${blist.bo_no}">
	  <div class=cat_writing_top>
	  	<p class=cat_write_title>
	  	<strong>
	  	<c:if test="${fn:length(b.bo_title)>20}">
          ${fn:substring(blist.bo_title,0,20)}
         </c:if>
         <c:if test="${fn:length(b.bo_title)<20}">
          ${blist.bo_title}
         </c:if>
         </strong>
         </p>
	  	<span class=cat_story_cont>
		 <c:if test="${fn:length(blist.bo_cont)>100}">
          ${fn:substring(blist.bo_cont,0,100)}
         </c:if>
         <c:if test="${fn:length(blist.bo_cont)<100}">
          ${blist.bo_cont}
         </c:if>
		</span>
	  	<span class=cat_story_writer><i>by</i> ${blist.memberVO.mem_nickname}</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b>${blist.memberVO.mem_fav1}</b>
	   </button>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b>${blist.memberVO.mem_fav2}</b>	   
	   </button>
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b>${blist.memberVO.mem_fav3}</b>
	   </button>
	  </div>
	 </div>
	</div>
	  </c:if>
	 <c:if test="${empty blist.bo_thumbnail}">
	<div class=cat_writing_block>
	 <div class=cat_writing style="border-bottom: 1px solid #f57c68;">
	  <div class="cat_writing_img-div">
	  </div>
	 <a class=cat_write_top href="/jamong.com/@${blist.memberVO.mem_id}/${blist.bo_no}">
	  <div class=cat_writing_top>
	  	<p class=cat_write_title>
	  	<strong style="color:#333">
	  	<c:if test="${fn:length(blist.bo_title)>20}">
          ${fn:substring(blist.bo_title,0,20)}
         </c:if>
         <c:if test="${fn:length(blist.bo_title)<20}">
          ${blist.bo_title}
         </c:if>
         </strong>
         </p>
	  	<span class=cat_story_cont style="color:#333">
		 <c:if test="${fn:length(blist.bo_cont)>100}">
          ${fn:substring(blist.bo_cont,0,100)}
         </c:if>
         <c:if test="${fn:length(blist.bo_cont)<100}">
          ${blist.bo_cont}
         </c:if>
		</span>
	  	<span class=cat_story_writer style="color:#333"><i>by</i> ${blist.memberVO.mem_nickname}</span>
	  </div>
	</a>
	  <div class=cat_writing_bottom>
	   <c:if test="${!empty blist.memberVO.mem_fav1}">
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b style="color:#333">${blist.memberVO.mem_fav1}</b>
	   </button>
	   </c:if>
	   <c:if test="${!empty blist.memberVO.mem_fav2}">
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b style="color:#333">${blist.memberVO.mem_fav2}</b>	   
	   </button>
	   </c:if>
	   <c:if test="${!empty blist.memberVO.mem_fav3}">
	   <button class=cat_writing_button onclick="location.href='http://localhost:8018/jamong.com/search?result=post'">
	   <b style="color:#333">${blist.memberVO.mem_fav3}</b>
	   </button>
	   </c:if>
	  </div>
	 </div>
	</div>
	  </c:if>
	</c:forEach>
	  </c:if>
	  <c:if test="${empty blist}">
	  <div class=cat_writing_block>
	  <h3>해당 카테고리에 검색결과가 없습니다!</h3>
	  </div>
	  </c:if>
	
	<!-- 책부분 시작 -->
	<div class=cat_book_block style="display:none;">	
	<c:forEach begin="1" end="5" step="1" var="i">
	 <div class=cat_book onclick="location.href='/jamong.com/book_info'">
	   <img class="cat_book_img" src="/jamong.com/resources/img/out.jpg" alt="글" />
		<div class="cat_book_inner">
			<p class=cat_book_title><strong>숲에 소원을 빌어요.</strong></p>
			<span class=cat_story_writer>최하늘</span>
		</div>
		<span class=cat_inner_line></span>
		<span class=cat_jamong_book>Jamong Book</span>	 
	 </div>
	 </c:forEach>
	</div>	
   </div>
<%@ include file="../include/footer.jsp" %>