/**
 * feed.jsp / feed.js
 */

$(document).ready(function(){

	$('#feed_type_new').click(function(){
		$('#feed_new_wrap').show();
		$('#feed_scrap_wrap').hide();
		$('#feed_type_new').addClass('view');
		$('#feed_type_scrap').removeClass('view');
	});

	$('#feed_type_scrap').click(function(){
		$('#feed_scrap_wrap').show();
		$('#feed_new_wrap').hide();
		$('#feed_type_scrap').addClass('view');
		$('#feed_type_new').removeClass('view');
	});
	
	$("#feed_btn_article").click(function(){
		$("#feed_scrap_article").css("display","block");
		$("#feed_scrap_book").css("display","none");
	});
	
	$("#feed_btn_book").click(function(){
		$("#feed_scrap_article").css("display","none");
		$("#feed_scrap_book").css("display","block");
	});
	
	$('.feed_scrap_sym_img').click(function(event){
			var symCon = confirm('해당 게시물의 공감을 취소하시겠습니까?');
			if(symCon){
				var bo_no = $(event.target).attr('data-no');
				$.ajax({
					type:"POST",
					url:"/jamong.com/sympathy_down/"+bo_no, 
					success: function (data) {
						if(data!=-1){
							$(event.target).parent().parent().parent().remove();
						}else{
							alert('로그인 유지시간이 만료되었습니다. \n'
									+'다시 로그인 하시기 바립니다.')
									window.location.replace("/jamong.com/login");
						}
					},
					error:function(){//비동기식 아작스로 서버디비 데이터를 못가져와서 에러가 발생했을 때 호출되는 함수이다.
						alert("data error");
					},
					complete:function(){
						var str = '';
						if($('.feed_scrap_sym_img').length==0){
							str += "<div class='feed_scrap_no_info'>"
								+ "<span>공감한 글이 없습니다.</span>"
								+ "</div>";
								$("#feed_scrap_article").html(str);
						}
					}
				});
			}
	});
	
	$('.feed_scrap_rec_img').click(function(event){
			var recCon = confirm('해당 게시물의 추천을 취소하시겠습니가?');
			if(recCon){
				var book_no = $(event.target).attr('data-no');
				$.ajax({
					type:"POST",
					url:"/jamong.com/book/recommend_down/"+book_no ,
					success:function(data){
						if(data!=-1){
							$(event.target).parent().parent().parent().remove();
						}else{
							alert("로그인 유지시간이 말료되었습니다 \n 다시 로그인 하시기 바랍니다");
							window.location.replace("/jamong.com/login/1");
						}
					},
					error:function(){
						alert("data error");
					},
					complete:function(){
						var str = '';
						if($('.feed_scrap_rec_img').length==0){
							str += "<div class='feed_scrap_no_info'>"
								+ "<span>추천한 책이 없습니다.</span>"
								+ "</div>";
								$("#feed_scrap_book").html(str);
						}
					}
				});
			}
	});
	
});

function FeedMouseUp(e){
	var wrapDiv = $(e.target)
	var feed_no = $(e.target).data("no");
	if(wrapDiv.hasClass("feed_new_cont_article")){
		wrapDiv.css("background-color","#FAFAFA");
		wrapDiv.children().children().next().children().next(".feed_new_icon").remove();
		$.ajax({
			type : "POST",
			data : {"feed_no" : feed_no},
			url : "/jamong.com/stateUp"
		});
	}
}
function FeedMouseOut(e){
	var wrapDiv = $(e.target)
	wrapDiv.css("background-color","#FFF");
}

function FeedMouseOn(e){
	var wrapDiv = $(e.target)
	if(wrapDiv.hasClass("feed_new_cont_article")){
		wrapDiv.css("background-color","#FAFAFA");
	}
}

function FeedDelete(e){
	var wrapDiv = $(e.target).parent();
	var feed_no = wrapDiv.data("no");
	$.ajax({
		type : "POST",
		data : {"feed_no":feed_no},
		url : "/jamong.com/feed/del",
		success : function(){
			wrapDiv.remove();
		}
	});
}





