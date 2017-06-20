<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>发现-之乎</title>
    <!-- Bootstrap -->
    <link rel="shortcut icon" href="images/tubiao.ico" />    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/Question.css" rel="stylesheet">
</head>
<body>
<%@ include file="zh_head.jsp"%>
    <!--内容-->
    <div id="center">
    <div class="col-md-1"></div>
    <div class="col-md-10" id="center-lord"><!--我将内容固定为10格，若想占满屏幕宽度请在这个DIV以外建立-->
      <!--左主内容开始--><!--问题内容-->
      <div class="col-md-8">
        <div class="col-md-12 border-shadow QuestionBox">
        <div class="QuestionTopic">
          <div class="Qtopic"><s:property value="topic.section.section_name" /></div>
        </div>
            <div class="QuestionTitle"><s:property value="topic.topic_name" /></div><!--问题标题-->
      <div class="Questioncontent"><!--问题内容-->
         ${topic.topic_summary}
</div>
        <div class="Questionfooter"> <!--问题底部-->
       <a href="#" class=" glyphicon glyphicon-send"><span>分享</span></a>
       <a href="#" class="glyphicon glyphicon-star"><span>邀请回答</span></a>
       <a href="#" class="glyphicon glyphicon-flag"><span>举报</span></a>
      <a href="#" class="glyphicon glyphicon-option-horizontal"> </a>
      
        </div>
        </div>
        <div class="col-md-12 border-shadow List-Answer"> <!--回答列表-->
        <div class="list-header"> <!--回答列表头部-->
        <h4><s:property value="replys.size()"/>个回答</h4>
    <div class="popver" >
    <div class="dropdown">
    <a id="dLabel" type="button" data-toggle="dropdown" class="glyphicon glyphicon-resize-vertical" aria-haspopup="true"  aria-expanded="false">
    默认排序
     </a>
    <ul class="dropdown-menu" aria-labelledby="dLabel">
      <li><a href="#">按时间排序</a></li>
     </ul>
     </div>
        </div>
        </div>
          <s:iterator value="replys">
        <div class="Answer">  <!--回答1-->
        <div class="Authorinfo">
        <div class="userimg"><img src="user_head_images/${user.user_head_image}"></div>
        <div class="Autorinfo-content">
        <div class="AuthorName"> ${user.user_name}</div>
         <div class="Author-Signature">${user.user_summary}</div>
        </div>
        </div>
        <div class="AnswerContent">
            ${reply_content}
        </div>
         <div class="Questionfooter"> <!--回答底部-->
         
       <button type="button" class="btn btn-default like_btn" id="${reply_id}" onclick="return Addlike(this.id)"><span id="like_state${reply_id}">点赞</span><span id="like_size${reply_id}">${likes.size()}</span></button>
       <a href="JavaScript:findComment(${reply_id})" class="glyphicon glyphicon-comment theme-login"><span> ${comments.size()}条评论</span></a>
       <a href="#"><span class=" glyphicon glyphicon-send"></span> 分享</a>
       <a href="#"><span class="glyphicon glyphicon-star"></span> 邀请回答</a>
       <a href="#"><span class="glyphicon glyphicon-flag"></span> 举报</a>
       <a href="#" class="glyphicon glyphicon-option-horizontal"> </a>		
        </div>

        </div>
        </s:iterator>
        
         
      
        </div> <!--回答列表结束-->
        <s:if test="replys.size()!=0">
        <div class="col-md-12 border-shadow more">
        <a>更多</a>
        </div>
        </s:if>
        <div class="col-md-12 border-shadow AnswerAdd">
          <!--文本编辑器-->
        <div class="Authorinfo">
        <div class="userimg"><img src="user_head_images/${sessionScope.user.user_head_image}"></div>
        <div class="Autorinfo-content">
        <div class="AuthorName">${sessionScope.user.user_name}</div>
         <div class="Author-Signature">${sessionScope.user.user_summary}</div>
        </div>
        </div>
         <s:form role="form" action="topicReply.action">
          <div class="text">
            <textarea id="remark" placeholder="这里输入内容" name="reply.reply_content" autofocus></textarea>
			<s:hidden name="Topic_id" value="%{topic.topic_id}"></s:hidden>
             <div class="submitAnswerbutton"><button type="submit" class="btn btn-primary">提交回答</button></div>
          </div>
          </s:form>
          <!--文本编辑器-->

        </div>
      </div>
      <!--左主内容结束-->
      <!--右栏目开始-->
      <div class="col-md-4">
        <div class="col-md-12 border-shadow QuestionSide1">
         <!--浏览次数与观众者-->
          <div class="Question-follow-status">
          <div class="seenumber"><p class="follower">被浏览</p><p class="follwernumb"><s:property value="topic.topic_pageviews" /></p></div> 
           <div class="follow"><p class="follower">关注者</p><p class="follwernumb">1815</p></div>
          </div>
           <!--关注问题与回答问题-->
            <div class="QuestionButton">
          <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-heart"></span> 关注问题</button>
          <button type="button" class="btn btn-default"><span class="glyphicon glyphicon-pencil"></span> 写回答</button>
          </div>
          </div>
           <!--相关问题-->
        <div class="col-md-12 border-shadow QuestionSide2">
          <div class="similarQuestion-header"><h4>相关问题</h4></div>
          <div class="similarQuestion-list">
          <div class="similarQuestion"><a href="#">在金融公司做 IT 是什么感觉？</a><span>119 个回答</span></div>
          <div class="similarQuestion"><a href="#">为什么计算机能读懂 1 和 0 ？</a><span>166 个回答</span></div>
          <div class="similarQuestion"><a href="#">有线鼠标会被无线鼠标取代吗？</a><span>1711个回答</span></div>
          <div class="similarQuestion"><a href="#">怎样算是「风骚」的代码</a><span>94 个回答</span></div>
          <div class="similarQuestion"><a href="#">如何向没有计算机基础的人解释 API 接口是什么？</a><span>19 个回答</span></div>
          </div>
         </div>
      </div>
     
      <!--右栏目结束-->
    </div>
   <!--弹出评论框-->
    <div class="theme-popover">
     <div class="theme-poptit">
          <a href="javascript:;" title="关闭" class="close">×</a>
          <h4 id="commentH4"></h4>
     </div>
     <div class='theme-popbod dform'>
		 <div id="commentShuchu">
		     
	     </div>
	 </div>
	 <div class="input-group comment-input">
         <input type="text" class="form-control" id="commentContent" aria-label="..." placeholder="评论内容">
         <input type="text" id="replyId" style="display:none" value="">
         <input type="text" id="bhfUserId" style="display:none" value="">
         <div class="input-group-btn">
           <button class="btn btn-default" type="button" onClick="tjComment()">评论</button>
         </div>
       </div>
    </div>
    <div class="theme-popover-mask"></div>
    
    <!--弹出评论框结束-->
    <div class="col-md-1"></div>
    </div>
    <!--内容结束-->
    <!--页脚-->
    <div class="col-md-12"></div>
    <!--页脚结束-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <!--文本编辑引用-->
    <link rel="stylesheet" type="text/css" href="css/simditor.css" />
    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/module.js"></script>
    <script type="text/javascript" src="js/hotkeys.js"></script>
    <script type="text/javascript" src="js/uploader.js"></script>
    <script type="text/javascript" src="js/simditor.js"></script>
   
</body>
</html>
