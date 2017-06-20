package cn.zspt.zh.action;

import java.util.List;

import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.service.ZHService;

public class TopicDetailAction {
	private int id;
	private ZHService zhService;
	private Topic topic;
	private List<Reply> replys;

	public List<Reply> getReplys() {
		return replys;
	}

	public void setReplys(List<Reply> replys) {
		this.replys = replys;
	}

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

	public String execute() {
		topic = zhService.findTopicById(id);
		replys=zhService.findReplyByTopic(topic);
		
		return "success";
	}

}
