package cn.zspt.zh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {

	@Override
	public String execute() {
		ActionContext.getContext().getSession().remove("user");
		return LOGIN;
	}

}
