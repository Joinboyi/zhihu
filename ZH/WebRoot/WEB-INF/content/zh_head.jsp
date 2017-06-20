<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <nav class="navbar navbar-default navbar-fixed-top">
      <div class="col-md-1"></div>
      <div class="col-md-10">
      <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Hello!</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><img src="images/LOGO.png" class="nav-logo-style"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="indexAction.action">首页 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">发现</a></li>
            <li><a href="#">消息</a></li>
          </ul>
          <form class="navbar-form navbar-left">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="搜索你感兴趣的内容...">
            </div>
            <button type="submit" class="btn btn-primary">搜索</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="zh_topicWrite">提问</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.user_name}<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="userindexAction"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> 我的主页</a></li>
                <li><a href="#"><span class="glyphicon glyphicon glyphicon-envelope" aria-hidden="true"></span> 私信</a></li>
                <li><a href="#"><span class="glyphicon glyphicon glyphicon-cog" aria-hidden="true"></span> 设置</a></li>
                <li role="separator" class="divider"></li>
                <li><a href="logoutAction.action"><span class="glyphicon glyphicon glyphicon-off" aria-hidden="true"></span> 退出</a></li>
              </ul>
            </li>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
      </div>
    </nav>
    <!--导航栏结束-->