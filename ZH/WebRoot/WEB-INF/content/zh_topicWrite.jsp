<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome.min.css">
  <title>发现-之乎</title>
    <!-- Bootstrap -->
    <link rel="shortcut icon" href="images/tubiao.ico" />    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!--文本编辑引用-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/readmore.js"></script>
    
</head>
<body>
<script type="text/javascript">
function findSection(){
 var str = $("#SectionName").val();
$.ajax({ 
		    type: "POST", 	
			url: "findSection",
			data: {
				str: str
             },
			dataType: "json",
			success: function(data){
				console.log(typeof data);
				data=eval('('+data+')');////////////////////eval生成json对象
			if(data.length>0){	
				var categoryStr = "";
				for(var i=0;i<data.length;i++){	
					categoryStr += "<option value='"+data[i].section_name+"'>";
				}
				$("#category").html(categoryStr);
				}else{
				alert("没有找到相应");
				}
			},
			error: function(jqXHR){
			   alert("发生错误：" + jqXHR.status);
			},
	});

}
</script>
  <%@ include file="zh_head.jsp"%>
    <!--内容-->
    <div id="center">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="center-lord"><!--我将内容固定为10格，若想占满屏幕宽度请在这个DIV以外建立-->
      <!--左主内容开始-->
      <div class="col-md-8">
        <div class="col-md-12 border-shadow center-box1">
          <div class="col-md-12 user-panel">
            <img src="user_head_images/${sessionScope.user.user_head_image}" class="pull-left user-panel-img">
            <div class="col-md-10 user-panel-menu">
              <a href=""><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 提问</a>
              <a href=""><span class="glyphicon glyphicon-education" aria-hidden="true"></span> 回答</a>
              <a href=""><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 写文章</a>
              <a href="" class="pull-right ">草稿</a>
            </div>
          </div>
        </div>
        <s:form role="form" action="topicWrite.action">
        <div class="col-md-12 border-shadow center-box2">
          <input type="text" name="topic.topic_name" class="form-control" placeholder="问题标题">
          <!--文本编辑器-->
          <div  class="remark-margin-top">
            <strong>问题说明（可选）：</strong>
            <textarea id="remark" name="topic.topic_summary" placeholder="这里输入内容" autofocus></textarea>
          </div>
          <!--文本编辑器-->
          <strong class="remark-margin-top">选择话题：</strong>
          <div class="input-group">
            <span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></span>
            <input type="text" id="SectionName" name="Section_name" class="form-control" list="category" placeholder="话题越精准，越容易让相关领域专业人士看到你的问题" onchange="findSection()">
            <datalist id="category"> 
          	</datalist>
          </div>
          <h5 class="checkbox-margin-top"><input type="checkbox"> 匿名 <span class="pull-right"><button type="button" class="btn btn-default">取消</button><button type="submit" class="btn btn-primary btn-left-bottom">提交</button></span></h5>
        </div>
        </s:form>
      </div>
      <!--左主内容结束-->
      <!--右栏目开始-->
      <div class="col-md-4">
        <div class="col-md-12 border-shadow right-nav-box1">
          <ul class="list-group">
            <li class="list-group-item">
              <span class="badge">14</span>
              <span class="glyphicon glyphicon-bookmark" aria-hidden="true"></span> 我的收藏
            </li>
            <li class="list-group-item">
              <span class="badge">4</span>
              <span class="glyphicon glyphicon-check" aria-hidden="true"></span> 我关注的问题
            </li>
            <li class="list-group-item">
              <span class="badge">1</span>
              <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 邀请我回答的问题
            </li>
          </ul>
          <hr />
          <ul class="list-group">
            <li class="list-group-item">
              <span class="badge">2</span>
              <span class="glyphicon glyphicon-list" aria-hidden="true"></span> 公共编辑动态
            </li>
            <li class="list-group-item">
              <span class="badge">1</span>
              <span class="glyphicon glyphicon-home" aria-hidden="true"></span> 社区服务中心
            </li>
          </ul>
        </div>
        <div class="col-md-12 border-shadow right-nav-box2">
          <div class="list-group">
            <a href="#" class="list-group-item active zhihu-live-bgk"><strong>之乎Live</strong><small class="pull-right">查看全部</small></a>
            <a href="#" class="list-group-item"><img src="images/01.png" class="zhihu-live-img"> 男生如何变帅？</a>
            <a href="#" class="list-group-item"><img src="images/01.png" class="zhihu-live-img"> 如何评价当前（2017年）的腾讯？</a>
            <a href="#" class="list-group-item"><img src="images/01.png" class="zhihu-live-img"> 你有什么有趣的「撩」或者「被撩」的经历吗？</a>
          </div>
        </div>
      </div>
      <!--右栏目结束-->
    </div>
    <div class="col-md-1"></div>
    </div>
    <!--内容结束-->
    <!--页脚-->
    <div class="col-md-12"></div>
    <!--页脚结束-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!--文本编辑引用-->
    <link rel="stylesheet" type="text/css" href="css/simditor.css" />
    <script type="text/javascript" src="js/index.js"></script> 
    <script type="text/javascript" src="js/module.js"></script>
    <script type="text/javascript" src="js/hotkeys.js"></script>
    <script type="text/javascript" src="js/uploader.js"></script>
    <script type="text/javascript" src="js/simditor.js"></script>
    <script type="text/javascript" src="js/simditor-dropzone.js"></script>
  </body>
</html>