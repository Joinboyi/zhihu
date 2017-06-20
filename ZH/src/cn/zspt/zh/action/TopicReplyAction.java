package cn.zspt.zh.action;

import java.sql.Timestamp;

import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TopicReplyAction extends ActionSupport {
	private Reply reply;
	private ZHService zhService;
	private int Topic_id;
	
	public int getTopic_id() {
		return Topic_id;
	}

	public void setTopic_id(int topic_id) {
		Topic_id = topic_id;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String execute() {
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		Topic topic=zhService.findTopicById(Topic_id);
		reply.setUser(user);
		reply.setTopic(topic);
		reply.setReply_time(new Timestamp(System.currentTimeMillis()));
		zhService.saveReply(reply);
		
	
		return SUCCESS;

	}

}
