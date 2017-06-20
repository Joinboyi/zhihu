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
    <link href="css/css.css" rel="stylesheet">
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
    
    <script>
    $(function () {
      $('.readmore').readmore({
        speed: 200,
        maxHeight: 70,
        collapsedHeight: 100,
        moreLink: '<a href="#">阅读全文</a>',
        lessLink: '<a href="#">收起</a>'
      });
    });
    </script>
    
</head>
<body>
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
              <a href="zh_topicWrite"><span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 提问</a>
              <a href=""><span class="glyphicon glyphicon-education" aria-hidden="true"></span> 回答</a>
              <a href=""><span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 写文章</a>
              <a href="" class="pull-right ">草稿</a>
            </div>
          </div>
        </div>
        <s:iterator value="topics" status="row">
        <div class="col-md-12 border-shadow center-box2">
          <div class="col-md-12"> 
            <p class="center-box2-from">来自话题: ${section.section_name}</p>
            <h4>
              <img src="user_head_images/${user.user_head_image}" class="pull-left user-panel-img">
              ${user.user_name}<br />
              <p class="center-box2-p">${user.user_summary}</p>
    
            </h4>
            <a href="topicDetail.action?id=<s:property value='topic_id'/>" class="topic-name-a"><h3>${topic_name}</h3></a>
            <article class="readmore">
             ${topic_summary}
            </article>
            <div class="Questionfooter Questionfooter-marginleft"> <!--问题底部-->
                <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span> ${topic_pageviews}</button>
               <a href="topicDetail.action?id=<s:property value='topic_id'/>"><span class="glyphicon glyphicon-comment"></span> ${replys.size()}条回答</a>
               <a href="#"><span class=" glyphicon glyphicon-send"></span> 分享</a>
               <a href="#"><span class="glyphicon glyphicon-star"></span> 邀请回答</a>
               <a href="#"><span class="glyphicon glyphicon-flag"></span> 举报</a>
               <a href="#" class="glyphicon glyphicon-option-horizontal"> </a>
            </div> <!--问题底部-->
          </div>
        </div>
         </s:iterator>
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
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>