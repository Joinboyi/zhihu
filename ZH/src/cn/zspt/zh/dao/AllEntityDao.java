package cn.zspt.zh.dao;

import java.io.Serializable;
import java.util.List;

public interface AllEntityDao<E> {
	public void save(E entity);
	public void delete(E entity);
	public void update(E entity);
	public List<E> find(String sql);
	public E get(Class<E> type,Serializable id);
	public List<E> findByPage(String sql,int pageNum,int start);
	public int getResultNum(String sql);
}
