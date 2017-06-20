package cn.zspt.zh.action;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.json.annotations.JSON;

import cn.zspt.zh.domain.Comment;
import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;
import cn.zspt.zh.util.GeneralTools;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommentViewAction extends ActionSupport {
	private HttpServletRequest request;
	private String result;

	private List<Comment> comments;
	private Reply reply;
	private ZHService zhService;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	private int reply_id;
	
	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public int getReply_id() {
		return reply_id;
	}

	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
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
		System.out.println(reply_id);
		reply = zhService.findReplyById(reply_id);
		comments = zhService.findCommentByReply(reply);
		
		JSONArray commentsJson = new JSONArray();
		try {
			// 获取数据
			System.out.println(reply_id);
			for(int i=0;i<comments.size();i++){
				System.out.println("comments"+comments.get(i).getComment_id());
				JSONObject jo = new JSONObject();
				jo.put("hf_user_id", comments.get(i).getHf_user().getUser_id());
                jo.put("hf_user_name", comments.get(i).getHf_user().getUser_name());
                jo.put("user_head_image", comments.get(i).getHf_user().getUser_head_image());
                String user_name = judgeUser(comments.get(i).getBhf_user().getUser_name(),comments.get(i).getHf_user().getUser_name());
                jo.put("bhf_user_name", user_name);
                GeneralTools generalTools =new GeneralTools();
                String hftime = generalTools.DateDifference2(comments.get(i).getComment_time());
                System.out.println("hftime="+hftime);
                jo.put("hf_time", hftime);
                jo.put("comment_content", comments.get(i).getComment_content());
                commentsJson.add(jo);
			}
			
//			JSONObject json = JSONObject.fromObject(commentsJson);// 将map对象转换成json类型数据
			JSONArray json = JSONArray.fromObject(commentsJson);
			result = json.toString();// 给result赋值，传递给页面
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";

	}

	private String judgeUser(String bhf_user_name,String hf_user_name) {
		String hf_name = "";
		String replyUserName = reply.getUser().getUser_name();
		if((!hf_user_name.equals(bhf_user_name))&(!hf_user_name.equals(replyUserName))&(!bhf_user_name.equals(replyUserName))){
			hf_name = " 回复 "+bhf_user_name;
		}else if((bhf_user_name.equals(replyUserName))&(!hf_user_name.equals(replyUserName))){
			hf_name = " 回复 "+bhf_user_name+"(作者)";
		}else if((hf_user_name.equals(replyUserName))&(!bhf_user_name.equals(replyUserName))){
			hf_name = "(作者) 回复 "+bhf_user_name;
		}else if((hf_user_name.equals(replyUserName))&(bhf_user_name.equals(replyUserName))){
			hf_name = "(作者)";
		}
		System.out.println(hf_name);
		return hf_name;
	}

}
