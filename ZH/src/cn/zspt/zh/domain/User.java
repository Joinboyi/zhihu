package cn.zspt.zh.domain;

import java.util.HashSet;
import java.util.Set;

public class User { // 用户

	private int user_id;

	private String user_account;

	private String user_name;

	private String user_password;

	private String user_head_image;

	private String user_summary;

	private Set<Section> sections = new HashSet<Section>(); // 多个用户对多个板块

	private Set<Topic> topics = new HashSet<Topic>(); // 一个用户对应多个问题

	private Set<Reply> replys = new HashSet<Reply>(); // 一个用户对应多个回答

	private Set<Comment> hf_comment; // 用户的多个评论

	private Set<Comment> bhf_comment; // 用户被别人评论的多条记录

	private Set<Like> likes;

	public Set<Like> getLikes() {
		return likes;
	}

	public void setLikes(Set<Like> likes) {
		this.likes = likes;
	}

	public Set<Comment> getHf_comment() {
		return hf_comment;
	}

	public void setHf_comment(Set<Comment> hf_comment) {
		this.hf_comment = hf_comment;
	}

	public Set<Comment> getBhf_comment() {
		return bhf_comment;
	}

	public void setBhf_comment(Set<Comment> bhf_comment) {
		this.bhf_comment = bhf_comment;
	}

	public Set<Reply> getReplys() {
		return replys;
	}

	public void setReplys(Set<Reply> replys) {
		this.replys = replys;
	}

	public Set<Topic> getTopics() {
		return topics;
	}

	public void setTopics(Set<Topic> topics) {
		this.topics = topics;
	}

	public Set<Section> getSections() {
		return sections;
	}

	public void setSections(Set<Section> sections) {
		this.sections = sections;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_head_image() {
		return user_head_image;
	}

	public void setUser_head_image(String user_head_image) {
		this.user_head_image = user_head_image;
	}

	public String getUser_summary() {
		return user_summary;
	}

	public void setUser_summary(String user_summary) {
		this.user_summary = user_summary;
	}

}
