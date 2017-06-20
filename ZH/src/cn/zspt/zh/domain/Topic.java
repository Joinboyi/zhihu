package cn.zspt.zh.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

;

public class Topic { // 问题

	private int topic_id;
	private String topic_name;
	private String topic_summary;
	private Date topic_time;
	private int topic_pageviews;
	private Section section; // 多个问题对一个板块
	private Set<Reply> replys = new HashSet<Reply>(); // 一个问题对多个回答
	private User user; //多个问题对一个用户

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<Reply> getReplys() {
		return replys;
	}

	public void setReplys(Set<Reply> replys) {
		this.replys = replys;
	}

	public int getTopic_id() {
		return topic_id;
	}

	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}

	public String getTopic_name() {
		return topic_name;
	}

	public void setTopic_name(String topic_name) {
		this.topic_name = topic_name;
	}

	public String getTopic_summary() {
		return topic_summary;
	}

	public void setTopic_summary(String topic_summary) {
		this.topic_summary = topic_summary;
	}

	public Date getTopic_time() {
		return topic_time;
	}

	public void setTopic_time(Date topic_time) {
		this.topic_time = topic_time;
	}

	public int getTopic_pageviews() {
		return topic_pageviews;
	}

	public void setTopic_pageviews(int topic_pageviews) {
		this.topic_pageviews = topic_pageviews;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

}
