package cn.zspt.zh.dao.support;

import java.io.Serializable;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.zspt.zh.dao.AllEntityDao;

public class AllEntityDaoSupport<E> extends HibernateDaoSupport implements
		AllEntityDao<E> {

    public void setSuperSessionFactory(SessionFactory sessionFactory) {
    	super.setSessionFactory(sessionFactory);
    }
	
	public void delete(E entity) {
		super.getHibernateTemplate().delete(entity);
	}

	public List<E> find(String sql) {
		return super.getHibernateTemplate().find(sql);
	}

	public void save(E entity) {
		super.getHibernateTemplate().save(entity);
	}

	public void update(E entity) {
		super.getHibernateTemplate().update(entity);
	}

	public E get(Class<E> type, Serializable id) {
		return super.getHibernateTemplate().get(type, id);
	}

	public List<E> findByPage(String sql,int pageNum,int start) {		
		return super.getSession(true).createQuery(sql).setMaxResults(pageNum).setFirstResult(start).list();
	}

	public int getResultNum(String sql) {
		int index=sql.indexOf("from");		
		Long l = (Long)super.getSession(true).createQuery("select count(*) " +sql.substring(index)).uniqueResult();
		System.out.println("select count(*) " +sql.substring(index));
		return l.intValue();
	}

	
	
}
