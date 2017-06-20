package cn.zspt.zh.action;

import java.sql.Timestamp;

import cn.zspt.zh.domain.Section;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TopicWriteAction extends ActionSupport {
	private ZHService zhService;
	private Topic topic;
	private String Section_name;

	public String getSection_name() {
		return Section_name;
	}

	public void setSection_name(String section_name) {
		Section_name = section_name;
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
		User user = (User) ActionContext.getContext().getSession().get("user");
		Section section = new Section();
		section.setSection_name(Section_name);
        zhService.saveSection(section);
		topic.setUser(user);
		topic.setSection(section);
		topic.setTopic_time(new Timestamp(System.currentTimeMillis()));

		zhService.saveTopic(topic);
		return "success";
	}

}
