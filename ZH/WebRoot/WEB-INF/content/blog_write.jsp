<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html lang="en">

<%@ include file="head.jsp"%>

<!--blog-->
<div class="blog">
	<div class="container">

		<div class="divider-border"></div>
		<div class="row ">
			<div class="col-md-9">
				<s:form action="blogWrite.action" theme="simple"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="exampleInputEmail1">博文标题</label>
						<s:textfield cssClass="form-control" id="exampleInputEmail1"
							name="blog.title" placeholder="博文标题" />
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">博文正文</label>
						<s:textarea cssClass="form-control" id="exampleInputPassword1" 
							placeholder="正文" name="blog.content" />
							
					</div>
					<div class="form-group">
						<label for="exampleInputFile">请选择博文图片</label>
						<s:file name="fileInput" />
					</div>

					<button type="submit" class="btn btn-default">发布</button>
				</s:form>

			</div>

<%@ include file="foot.jsp"%>