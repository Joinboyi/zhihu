package cn.zspt.zh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

public class LoginAction extends ActionSupport {
	private ZHService zhService;
	private String name;
	private String password;
	private String msg;
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String execute() {
		
		if(name==null&&password==null){
			msg=" ";
		}
		User user = zhService.verify(name, password);
		if (user == null) {
			msg = "用户名密码错误";
			return "login";
		} else {
			ActionContext.getContext().getSession().put("user", user);
			url = (String) ActionContext.getContext().getSession().get("latestUrl");
			if (url != null) {
				ActionContext.getContext().getSession().remove("latestUrl");
				return "back";
			}
			return "success";
		}

	}

}
