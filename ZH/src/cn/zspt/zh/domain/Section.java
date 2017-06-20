package cn.zspt.zh.domain;

import java.util.HashSet;
import java.util.Set;

public class Section { // 板块
	private int section_id;
	private String section_name;
	private String section_summary;
	private Set<Topic> topics = new HashSet<Topic>(); // 一个板块对多个话题
	private Set<User> users = new HashSet<User>(); // 多个板块对多个用户

	public int getSection_id() {
		return section_id;
	}

	public void setSection_id(int section_id) {
		this.section_id = section_id;
	}

	public String getSection_name() {
		return section_name;
	}

	public void setSection_name(String section_name) {
		this.section_name = section_name;
	}

	

	public Set<Topic> getTopics() {
		return topics;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public String getSection_summary() {
		return section_summary;
	}

	public void setSection_summary(String section_summary) {
		this.section_summary = section_summary;
	}

}
