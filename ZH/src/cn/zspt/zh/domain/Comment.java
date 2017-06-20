package cn.zspt.zh.domain;

import java.util.Date;

public class Comment { // 评论
	private int comment_id;
	private String comment_content;
	private Date comment_time;
	private Reply reply; // 该评论所在的回答
	private User hf_user; // 评论用户
	private User bhf_user; // 被回复用户

	public User getBhf_user() {
		return bhf_user;
	}

	public void setBhf_user(User bhf_user) {
		this.bhf_user = bhf_user;
	}

	public User getHf_user() {
		return hf_user;
	}

	public void setHf_user(User hf_user) {
		this.hf_user = hf_user;
	}

	public int getComment_id() {
		return comment_id;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public Date getComment_time() {
		return comment_time;
	}

	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

}
