package model.dao;
 
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.DetailBean;
import model.MinorCategoryBean;
import model.Interface.IDAO;
import model.misc.HibernateUtil;

public class MinorCategoryBeanDAOHibernate implements IDAO<MinorCategoryBean> {
	public static Session session;
	public static SessionFactory factory;
	public static Transaction trx;

	public static void main(String[] args) {
	test();

	}

	private static void test() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		MinorCategoryBeanDAOHibernate dao = new MinorCategoryBeanDAOHibernate(factory);

		// Insert
		try {
			trx = dao.getSession().beginTransaction();
			String category = "男裝",item = "七分褲";
			MinorCategoryBean bean = new MinorCategoryBean(category,item);
			bean.setId(0);
 		  	MinorCategoryBean  insert = dao.insert(bean);
			System.out.println("insert" + insert);
			trx.commit();
		} catch (Exception e) {
			System.out.println("insert" + e.toString());

			trx.rollback();
		}

		
		// Select
		try {
			session = factory.getCurrentSession();
			trx = session.beginTransaction();
			MinorCategoryBean select = dao.select(2);
			System.out.println("select" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		
		// Update
		try {
			session = factory.getCurrentSession();
			trx = dao.getSession().beginTransaction();
			String category = "男裝",item = "西裝褲";

			MinorCategoryBean bean = new MinorCategoryBean(category,item);
			bean.setId(5);  
			MinorCategoryBean update = dao.update(bean);
			System.out.println("update" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		// delete
		try {
			session = factory.getCurrentSession();

			trx = dao.getSession().beginTransaction();
			Boolean delete = dao.delete(7);
			System.out.println("delete" + delete);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
		
	}

	public MinorCategoryBeanDAOHibernate(SessionFactory factory) {
		this.factory = factory;
 	}

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	 
	 
	public List<MinorCategoryBean> selectByPage(int page) {
		List<MinorCategoryBean> list = new LinkedList<MinorCategoryBean>();
		Query query = this.getSession().createQuery("from MinorCategoryBean");
		query.setFirstResult((page-1)*5);
		query.setMaxResults(5);
		list = query.list();
		return list;
	//	return this.getSession().createQuery("from MinorCategoryBean", MinorCategoryBean.class).getResultList();
	}

	@Override
	public List<MinorCategoryBean> select() {
		List<MinorCategoryBean> list = new LinkedList<MinorCategoryBean>();
		return this.getSession().createQuery("from MinorCategoryBean", MinorCategoryBean.class).getResultList();
	}
	 

	@Override
	public Boolean delete(int id) {
		MinorCategoryBean temp = select(id);

		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean delete(MinorCategoryBean bean) {
		MinorCategoryBean temp = select(bean);
		if (temp != null) {
			this.getSession().delete(bean);
			return true;

		} else {
			return false;
		}
	}
 
	@Override
	public MinorCategoryBean select(MinorCategoryBean bean) {
		if (bean != null) {
			bean = this.getSession().get(MinorCategoryBean.class, bean.getId());
		}
		return bean;
	
	}

	@Override
	public MinorCategoryBean select(int id) {
 	 return this.getSession().get(MinorCategoryBean.class, id);

	}

	public List<MinorCategoryBean> select(String category) {
		List<MinorCategoryBean> list = new LinkedList<MinorCategoryBean>();
		
 		return this.getSession().createQuery("from MinorCategoryBean where category='"+category+"'", MinorCategoryBean.class).getResultList();
		}
	
	public List<MinorCategoryBean> selectByCategory(String category) {
 		
 		return this.getSession()
 				.createQuery("from MinorCategoryBean where category=:category", MinorCategoryBean.class)
 				.setParameter("category", category)
 				.getResultList();
		}
	
	
	@Override
	public MinorCategoryBean insert(MinorCategoryBean bean) {
		MinorCategoryBean temp = select(bean);
		System.out.println("temp" + temp);

		if (temp == null) {
			this.getSession().save(bean);
			System.out.println("temp"+temp);

		}
		return bean;

	}

	@Override
	public MinorCategoryBean update(MinorCategoryBean bean) {
		MinorCategoryBean temp = select(bean.getId());
		if (temp != null)
		{
			temp.setCategory(bean.getCategory());
			temp.setItem(bean.getItem());
		}
 		return temp;
	}

	   
}
