package cn.zspt.zh.action;

import java.util.List;

import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserIndexAction extends ActionSupport {
	private List<Topic> topics;
	private ZHService zhService;

	public List<Topic> getTopics() {
		return topics;
	}

	public void setTopics(List<Topic> topics) {
		this.topics = topics;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String execute() {
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		if(user==null){
			return "login";
		}
		topics = zhService.findTopicByUser(user);
		return "success";
		
	}

}
