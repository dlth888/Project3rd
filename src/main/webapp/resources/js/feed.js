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

	$('.feed_scrap_like_img').click(function(event){

		if($(event.target).css('background-color')=='rgb(255, 255, 255)'){
			$(event.target).css('background-color','RGB(245,124,104)');
		}else{
			$(event.target).css('background-color','rgb(255, 255, 255)');			
		}
	});
});

function FeedReading(e){
	if (e.target !== e.currentTarget) return;
	var wrapDiv = $(e.target)
	console.log(feed_no);

}

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







