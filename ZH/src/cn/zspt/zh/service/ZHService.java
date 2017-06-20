package cn.zspt.zh.service;

import java.util.List;

import cn.zspt.zh.domain.Comment;

import cn.zspt.zh.domain.Like;
import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.Section;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;

public interface ZHService {
	public User verify(String name, String password); // 登录验证

	public boolean registerVerify(String realname, String nickname);// 注册

	public List<Topic> findTopicByUser(User user); // 查找用户的所有问题'

	public Topic findTopicById(int id); // 根据ID查找问题
	
	public Reply findReplyById(int id); // 根据ID查找回答

	public Section findSectionById(int id); // 根据ID查找板块

	public User findUserById(int id); // 根据ID查找用户

	public void saveTopic(Topic topic); // 新建问题

	public List<Reply> findReplyByTopic(Topic topic); // 查找问题的所有回复

	public List<Topic> findHot5Topic(); // 查找浏览量最多的5个问题

	public void saveUser(User user); // 新镇用户
	
	public void saveSection(Section section); // 新镇板块

	public void saveReply(Reply reply);// 新镇回答
	
	public void deleteTopic(Topic topic); //删除问题
	
	public List<Comment> findCommentByReply(Reply reply);  //根据回答查询回复
	
	public void saveLike(Like like); // 点赞
	
	public Like findLike(int userId,int replyId);//查找是否点赞
	
	public List<Section> findSection(String str); //根据用户输入的字符串查找相应的名称

    public void updateUser(User user); //更新用户数据
    
    public void saveComment(Comment comment); //保存问题

}
