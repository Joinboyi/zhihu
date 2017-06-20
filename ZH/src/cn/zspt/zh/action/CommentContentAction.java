package cn.zspt.zh.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import cn.zspt.zh.domain.Comment;
import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;
import cn.zspt.zh.util.GeneralTools;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentContentAction extends ActionSupport {
	private HttpServletRequest request;
	private String result;
	private ZHService zhService;
	private Comment comment = new Comment();
	private int reply_id;
	private int bhf_user_id = 0;
	private String comment_content;

	public int getBhf_user_id() {
		return bhf_user_id;
	}

	public void setBhf_user_id(int bhf_user_id) {
		this.bhf_user_id = bhf_user_id;
	}

	public ZHService getZhService() {
		return zhService;
	}

	public void setZhService(ZHService zhService) {
		this.zhService = zhService;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public String execute() {
		System.out.println("reply_id:" + reply_id); //这条回答的ID
		System.out.println("bhf_user_id:" + bhf_user_id); //被回复人的ID
		System.out.println("comment_content:" + comment_content); //评论的内容
		User user = (User) ActionContext.getContext().getSession().get("user");

		if (bhf_user_id == 0) { // 如果不评论其他人 就评论回答问题的答主
			Reply reply = zhService.findReplyById(reply_id);
			User bhf_user1 = zhService.findUserById(reply.getUser().getUser_id());
			comment.setHf_user(user);
			comment.setBhf_user(bhf_user1);
			comment.setComment_content(comment_content);
			comment.setComment_time(new Timestamp(System.currentTimeMillis()));
			comment.setReply(reply);
			zhService.saveComment(comment);
		} else { // 如果与其他人评论 就获取其他人的ID回复

			Reply reply = zhService.findReplyById(reply_id);
			User bhf_user = zhService.findUserById(bhf_user_id);
			comment.setHf_user(user);
			comment.setBhf_user(bhf_user);
			comment.setComment_content(comment_content);
			comment.setComment_time(new Timestamp(System.currentTimeMillis()));
			comment.setReply(reply);
			zhService.saveComment(comment);
		}
		return "success";

	}

}
