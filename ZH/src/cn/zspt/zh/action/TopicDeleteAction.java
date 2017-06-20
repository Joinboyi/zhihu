package cn.zspt.zh.action;

import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionSupport;

public class TopicDeleteAction extends ActionSupport {
	private int id;
	private ZHService zhService;
	private Topic topic;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public Topic getTopic() {
		return topic;
	}

	public void setTopic(Topic topic) {
		this.topic = topic;
	}
	
	public String execute(){
		topic = zhService.findTopicById(id);
		zhService.deleteTopic(topic);
		return SUCCESS;
		
	}

}
