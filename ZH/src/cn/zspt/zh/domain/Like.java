package cn.zspt.zh.domain;

import java.util.Date;

public class Like {
	private int like_id;
	private User user;
	private Reply reply;
	private Date like_time;

	public int getLike_id() {
		return like_id;
	}

	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Reply getReply() {
		return reply;
	}

	public void setReply(Reply reply) {
		this.reply = reply;
	}

	public Date getLike_time() {
		return like_time;
	}

	public void setLike_time(Date like_time) {
		this.like_time = like_time;
	}

}
