<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">

<%@ include file="head.jsp"%>
<script type="text/javascript">
function interest(id){
	$.getJSON("interestAdd?id="+id,{},function(json){ 
		alert(json.message);
	}); 
}
</script>
<!--blog-->
<div class="blog">
	<div class="container">

		<div class="divider-border"></div>

		<div class="row ">

			<div class="col-md-9">
				<s:iterator value="blogs" status="row">
					<div class="post ">
						<div class="row">
							<div class="col-md-2  entry-date">
								<div class="pull-right">
									<span class="day"><s:date name="createTime" format="dd" />
									</span><span class="month"><s:date name="createTime"
											format="MM" /> </span>

								</div>
								<a href="#" class="pull-right"><span
									class="glyphicon glyphicon-list-alt" /> </a>
							</div>

							<div class="entry-title col-md-10 ">
								<h2 class="title">
									<!-- <s:property value="title" /> -->
									${title}
								</h2>
							</div>
							<!--END ENTRY-TITLE-->
						</div>
						<div class="row">
							<div class="col-md-2 entry-meta">
								<s:if test="user.photo!=''&&user.photo!=null">
								<img src="person_image/${user.photo}"	width="50px" />
								</s:if>
								<ul class="list-unstyled">
									<li><span>发布</span> <a href="searchBlog.action?keyword=${user.nickname}"><s:property
												value="user.nickname" /> </a></li>
									<li><span>分类</span> <a href="#">标准</a></li>
									<li><span>评论</span> <a href="#">7</a></li>
									<s:if test="user.id!=#session.user.id">
									<button class="btn btn-success" onclick="interest(${user.id});"
										>关注</button>
									</s:if>
								</ul>
							</div>
							<div class="col-md-10 entry content">
								<div class="col-md-10 entry content">
									<div class="entry-media">
										<s:if test="imgFileName!=null">
											<a href="#"><img src="blog_image/${imgFileName}"
												width="577px" /> </a>
										</s:if>
									</div>
									<!--END ENTRY-MEDIA-->
									<!--END ENTRY-MEDIA-->

									<p>
										<s:property value="content.substring(0,100)" />
									</p>
									<p>
										<a href="blogDetail.action?id=<s:property value='id'/>"
											class="more-link">详细 &rarr;</a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</s:iterator>
				<s:if test="#session.page!=null">
					<nav>
						<ul class="pager">
							<li><a href="indexAction.action?page=1 ">首页</a>
							</li>
							<s:if test="!#session.page.isHasPrevious()">
								<li class="disabled"><a>上页</a>
								</li>
							</s:if>
							<s:else>
								<li><a
									href="indexAction.action?page=<s:property value='#session.page.previousPage'/>">上页</a>
								</li>
							</s:else>


							<s:if test="!#session.page.isHasNext()">
								<li class="disabled"><a>下页</a>
								</li>
							</s:if>
							<s:else>
								<li><a
									href="indexAction.action?page=<s:property value='#session.page.nextPage'/> ">下页</a>
								</li>
							</s:else>

							<li><a
								href="indexAction.action?page=<s:property value='#session.page.totalPages'/> ">末页</a>
							</li>
						</ul>
					</nav>
				</s:if>
			</div>

			<%@ include file="foot.jsp"%>