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
  <title>我的之乎</title>
    <!-- Bootstrap -->
    <link rel="shortcut icon" href="images/tubiao.ico" />    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!--文本编辑引用-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="js/readmore.js"></script>
    
    <script>  
	 function click_Image() 
     { 
        $('#fileInput').click(); 
     }
     function Upload_Image() 
     { 
        $('#fileForm').submit();
        alert("上传成功");
   
     }
    </script>
    
</head>
<body>
  <%@ include file="zh_head.jsp"%>
    <!--内容-->
    <div id="center">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="center-lord"><!--我将内容固定为10格，若想占满屏幕宽度请在这个DIV以外建立-->
    <!--用户资料-->
      <s:form id="fileForm" style="display:none;" action="UserHeadImageUpdate.action" theme="simple" enctype="multipart/form-data">
     <s:file name="fileInput" id="fileInput" onChange="Upload_Image()" type="file"/>
      </s:form>
    <div class="col-md-12">
      <div class="col-md-12 border-shadow user-index-box1">
        <div class="col-md-12 user-panel">
         
        <img src="user_head_images/${sessionScope.user.user_head_image}" onclick="click_Image()" class="pull-left user-index-img"></img>
          
          <div class="user-index-zl">
            <h3 class="user-index-zl-h2">${sessionScope.user.user_name}<span class="user-index-zl-h3-span">${sessionScope.user.user_summary}</span></h2>
            <p class="user-index-zl-p">暂无个人资料</p>
          </div>
        </div>
      </div>
    </div>
    <!--用户资料-->
      <!--左主内容开始-->
      <div class="col-md-8">
        <div class="col-md-12 border-shadow center-box2">
         <s:iterator value="topics" status="row">
          <div class="col-md-12"> 
            <p class="center-box2-from">来自话题： ${section.section_name}</p>
            <h4>
              <img src="user_head_images/${user.user_head_image}" class="pull-left user-panel-img">${user.user_name}<br />
              <p class="center-box2-p">${user.user_summary}</p>
            </h4>
             <a href="topicDetail.action?id=<s:property value='topic_id'/>" class="topic-name-a"><h3>${topic_name}</h3></a>
            <article class="readmore">
              ${topic_summary}
            </article>
            <div class="Questionfooter Questionfooter-marginleft"> <!--问题底部-->
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span> ${topic_pageviews}</button>
               <a href="topicDetail.action?id=<s:property value='topic_id'/>"><span class="glyphicon glyphicon-comment"></span> ${replys.size()}条评论</a>
               <a href="#"><span class=" glyphicon glyphicon-send"></span> 分享</a>
               <a href="#"><span class="glyphicon glyphicon-star"></span> 邀请回答</a>
               <a href="#"><span class="glyphicon glyphicon-flag"></span> 举报</a>
               <a href="topicDelete.action?id=<s:property value='topic_id'/>"><span class="glyphicon glyphicon-trash"></span> 删除</a>
               <a href="#" class="glyphicon glyphicon-option-horizontal"> </a>
            </div> <!--问题底部-->
          </div>
          </s:iterator>
        </div>
      </div>
      <!--左主内容结束-->
      <!--右栏目开始-->
      <div class="col-md-4 user-index-right">
        <div class="col-md-12 border-shadow right-nav-box1">
          <ul class="list-group">
            <li class="list-group-item">
              <span class="badge">1</span>
              <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> 赞同的回答
            </li>
            <li class="list-group-item">
              <span class="badge">4</span>
              <span class="glyphicon glyphicon-send" aria-hidden="true"></span> 我的回答
            </li>
            <li class="list-group-item">
              <span class="badge">4</span>
              <span class="glyphicon glyphicon-question-sign" aria-hidden="true"></span> 我的提问
            </li>
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
            <li class="list-group-item">
              <span class="badge">100000+</span>
              个人主页被浏览量
            </li>
          </ul>
          <hr />
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
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>


</body>
</html>