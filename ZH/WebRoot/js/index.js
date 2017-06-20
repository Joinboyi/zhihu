$(document).ready(function(){
    //初始化文本编辑器
    var editor = new Simditor({
        //textarea的id
        textarea: $('#remark'),
        //工具条都包含哪些内容
        toolbar:['title','bold','italic','underline','table','color','ol','ul','image','hr'],
        //若需要上传功能，上传的参数设置。
        upload : {
                url : 'ImgUpload', //文件上传的接口地址
                params: null, //键值对,指定文件上传接口的额外参数,上传的时候随文件一起提交
                fileKey: 'fileDataFileName', //服务器端获取文件数据的参数名
                connectionCount: 3,
                leaveConfirm: '正在上传文件'
         },
		success: function(data) {
			alert(data);
		}
    });
});

jQuery(document).ready(function($) {
    $('.theme-login').click(function(){
      $('.theme-popover-mask').fadeIn(100);
      $('.theme-popover').slideDown(200);
    })
    $('.theme-poptit .close').click(function(){
      $('.theme-popover-mask').fadeOut(100);
      $('.theme-popover').slideUp(200);
    })
})

function Addlike(id){    
	$.getJSON("LikeAction?reply_id="+id,{},function(json){ 
		   alert(json.msg);
    if(json.msg=="点赞成功"){
	var like_num = $("#like_size"+id).html();//获取当前赞值
	like_num++;//赞值+1
	
	$("#like_state"+id).html("已赞");
	$("#"+id).addClass("disabled");
	
	$("#like_size"+id).html(like_num);
	$("#"+id).removeAttr("onclick"); 
    }else{
    $("#"+id).addClass("disabled");
    $("#"+id).removeAttr("onclick");
    }
	});  	
}

function findComment(id){
	$.ajax({ 
		    type: "POST", 	
			url: "commentView",
			data: {
				reply_id: id
			},
			dataType: "json",
			success: function(data){
				console.log(typeof data);
				data=eval('('+data+')');////////////////////eval生成json对象
				var commenthtml = "";
				for(var i=0;i<data.length;i++){
					var hf_user_name = String(data[i].hf_user_name);
					commenthtml += "<div class='comment-list'>";
					commenthtml += "<div class='comment-list-head'>";
					commenthtml += "<img src='"+data[i].user_head_image+"' class='comment-avatar'>";
					commenthtml += "<p>"+hf_user_name+"<span> "+data[i].bhf_user_name+"</span></p>";
					commenthtml += "<span>"+data[i].hf_time+"<span id='comment-a' onClick='hqComment(\""+hf_user_name+"\","+data[i].hf_user_id+")'>回复</span></span></div>";
					commenthtml += "<p class='comment-list-p'>"+data[i].comment_content+"</p>";
					commenthtml += "</div>";//<a href='#'><span class='glyphicon glyphicon-send'></span> 回复</a>
				}
				$("#commentH4").html(data.length+"条评论");
				$("#commentShuchu").html(commenthtml);
				$("#replyId").val(id);
			},
			error: function(jqXHR){
			   alert("发生错误：" + jqXHR.status);
			},
	});
}

function tjComment(){
  var commentContent = $("#commentContent").val();
  var replyId = $("#replyId").val();
  var bhfUserId = $("#bhfUserId").val();
  $.ajax({ 
	    type: "POST", 	
		url: "commentContent",
		data: {
			comment_content: commentContent,
			reply_id: replyId,
			bhf_user_id: bhfUserId
		},
		dataType: "json",
		success: function(data){
			console.log(typeof data);
			data=eval('('+data+')');////////////////////eval生成json对象
			findComment(replyId);
		},
		error: function(jqXHR){
		   alert("发生错误：" + jqXHR.status);
		},
});
  $("#commentContent").val("");
  $("#bhfUserId").val(0);
  $("#commentContent").attr("placeholder","评论");
  
};

function hqComment(name,id){
	 $("#commentContent").attr("placeholder","回复"+name+":");
	 $("#bhfUserId").val(id);
	 $("#commentContent").focus();
};
