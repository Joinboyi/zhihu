package cn.zspt.zh.service.impl;

import java.util.List;

import cn.zspt.zh.dao.CommentDao;
import cn.zspt.zh.dao.LikeDao;
import cn.zspt.zh.dao.ReplyDao;
import cn.zspt.zh.dao.SectionDao;
import cn.zspt.zh.dao.TopicDao;
import cn.zspt.zh.dao.UserDao;
import cn.zspt.zh.domain.Comment;
import cn.zspt.zh.domain.Like;
import cn.zspt.zh.domain.Reply;
import cn.zspt.zh.domain.Section;
import cn.zspt.zh.domain.Topic;
import cn.zspt.zh.domain.User;
import cn.zspt.zh.service.ZHService;

public class ZHServiceImpl implements ZHService {
	private UserDao userDao;
	private SectionDao sectionDao;
	private TopicDao topicDao;
	private ReplyDao replyDao;
	private CommentDao commentDao;
	private LikeDao likeDao;

	public LikeDao getLikeDao() {
		return likeDao;
	}

	public void setLikeDao(LikeDao likeDao) {
		this.likeDao = likeDao;
	}

	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public SectionDao getSectionDao() {
		return sectionDao;
	}

	public void setSectionDao(SectionDao sectionDao) {
		this.sectionDao = sectionDao;
	}

	public TopicDao getTopicDao() {
		return topicDao;
	}

	public void setTopicDao(TopicDao topicDao) {
		this.topicDao = topicDao;
	}

	public ReplyDao getReplyDao() {
		return replyDao;
	}

	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	public User verify(String name, String password) {
		String hql = "from User u where u.user_account='" + name
				+ "' and user_password='" + password + "'";
		List<User> users = userDao.find(hql);
		if (users.size() == 1)
			return users.get(0);
		else
			return null;
	}

	public boolean registerVerify(String realname, String nickname) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Topic> findTopicByUser(User user) {
		String sql = "select t from Topic t inner join fetch t.user u where u.id="
				+ user.getUser_id() + " order by t.topic_time desc";
		return topicDao.find(sql);
	}

	public Topic findTopicById(int id) {
		return topicDao.get(Topic.class, id);
	}

	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.get(User.class, id);
	}

	public Section findSectionById(int id) {
		return sectionDao.get(Section.class, id);
	}

	public void saveTopic(Topic topic) {
		topicDao.save(topic);
	}

	public List<Reply> findReplyByTopic(Topic topic) {
		String sql = "select r from Reply r inner join fetch r.user inner join fetch r.topic  t where t.id="
				+ topic.getTopic_id() + " order by r.reply_time desc";
		return replyDao.find(sql);
	}

	public List<Topic> findHot5Topic() {
		String sql = "select t from Topic t  inner join fetch t.section inner join fetch t.user  order by t.topic_pageviews desc ";
		return this.topicDao.find(sql);
	}

	public List<Comment> findCommentByReply(Reply reply) {
		String sql = "select c from Comment c  inner join fetch c.reply r where r.id="
				+ reply.getReply_id() + " order by c.comment_time desc ";
		return this.commentDao.find(sql);
	}

	public void saveUser(User user) {
		userDao.save(user);

	}

	public void saveReply(Reply reply) {
		replyDao.save(reply);

	}

	public void deleteTopic(Topic topic) {
		topicDao.delete(topic);
	}

	public Reply findReplyById(int id) {
		return replyDao.get(Reply.class, id);
	}

	public void saveLike(Like like) {
	   likeDao.save(like);
		
	}

	public Like findLike(int userId, int replyId) {
		List<Like> likes=likeDao.find("from Like l where l.reply.reply_id="+replyId+" and l.user.user_id="+userId);
		if(likes.size()==1){
			return likes.get(0);
		}else 
			return null;
		
		
	}

	public List<Section> findSection(String str) {
	String sql="select s from Section s where s.section_name like '%"+str+"%' ";
		return sectionDao.find(sql);
	}

	public void saveSection(Section section) {
		sectionDao.save(section);
		
	}

	public void updateUser(User user) {
		userDao.update(user);
		
	}

	public void saveComment(Comment comment) {
		commentDao.save(comment);
		
	}


	

}
