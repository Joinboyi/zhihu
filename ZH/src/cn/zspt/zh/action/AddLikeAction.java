package cn.zspt.zh.action;

import java.sql.Timestamp;

import org.apache.struts2.json.annotations.JSON;

import cn.zspt.zh.domain.Like;
import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddLikeAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	private String msg;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private ZHService zhService;
	private int reply_id;

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	@JSON(serialize = false)
	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String execute() {
		User user = (User) ActionContext.getContext().getSession().get("user");
		Reply reply = zhService.findReplyById(reply_id);
		if (zhService.findLike(user.getUser_id(), reply_id) == null) {
			Like like = new Like();
			like.setLike_time(new Timestamp(System.currentTimeMillis()));
			like.setUser(user);
			like.setReply(reply);
			msg = "点赞成功";
			zhService.saveLike(like);			
		} else
			msg="您已点过赞";
			return "success";
		
	}

}
