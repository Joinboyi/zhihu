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
				<div class="post ">
					<div class="row">
						<div class="col-md-2  entry-date">
							<div class="pull-right">
								<span class="day"><s:date name="blog.createTime" format="dd" />
								</span><span class="month"><s:date name="blog.createTime" format="MM" />
								</span>

							</div>
							<a href="#" class="pull-right"><span
								class="glyphicon glyphicon-list-alt" /> </a>
						</div>

						<div class="entry-title col-md-10 ">
							<h2 class="title">
								<s:property value="blog.title" />
							</h2>
						</div>
						<!--END ENTRY-TITLE-->
					</div>
					<div class="row">
						<div class="col-md-2 entry-meta">
							<ul class="list-unstyled">
								<li><span>发布</span> <a href="searchBlog.action?keyword=${blog.user.nickname}"><s:property
											value="blog.user.nickname" /></a> 
								</li>
								<li><span>分类</span> <a href="#">标准</a>
								</li>
								<li><span>评论</span> <a href="#">7</a>
								</li>
								<s:if test="blog.user.id!=#session.user.id">
									<button class="btn btn-success" onclick="interest(${blog.user.id});"
										>关注</button>
									</s:if>
							</ul>
						</div>
						<div class="col-md-10 entry content">
							<div class="entry-media">
										<s:if test="blog.imgFileName!=null">
											<a href="#"><img src="blog_image/${blog.imgFileName}"
												width="577px" /> </a>
										</s:if>
									</div>
							<!--END ENTRY-MEDIA-->

							<p>
								<s:property value="blog.content" />
							</p>

						</div>
					</div>
				</div>


				<s:iterator value="comments">
					<div class="post ">
						<div class="row">
							<div class="col-md-2 entry-meta">
								<ul class="list-unstyled">
									<li><span>评论</span> <a href="searchBlog.action?keyword=${user.nickname}"><s:property
												value="user.nickname" /> </a>
									</li>
									<li><span>评论时间</span> <a href="#"><s:date
												name="commentTime" format="yyyy-MM-dd HH:mm" />
									</a>
									</li>

								</ul>
							</div>
							<div class="col-md-10 entry content">
								<div class="entry-media"></div>
								<!--END ENTRY-MEDIA-->

								<p>
									<s:property value="content" />
								</p>

							</div>
						</div>
					</div>
				</s:iterator>

				<div class="comment">

					<div class="row">
						<div class="col-md-2 entry-meta">
							<span> 进行评论</span>
						</div>
						<div class="col-md-10 entry content">
							<div class="entry-media"></div>
							<!--END ENTRY-MEDIA-->

							<s:form action="commentAction" theme="simple">
							 <div class="form-group">
								<s:textarea name="comment.content" cssClass="form-control"></s:textarea>
								<s:hidden name="comment.blog.id" value="%{id}" />
								</div>
								<s:submit value="评论" />
								
							</s:form>

						</div>

					</div>
				</div>
			</div>


			<%@ include file="foot.jsp"%>