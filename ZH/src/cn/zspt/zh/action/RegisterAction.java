package cn.zspt.zh.action;

import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	private User user;
	private ZHService zhService;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String execute() {	
		user.setUser_summary("这个人很懒，，什么都没留下");
        zhService.saveUser(user);      
		return "login";

	}
}
