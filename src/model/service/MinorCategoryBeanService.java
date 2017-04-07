package model.service;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.MinorCategoryBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.MinorCategoryBeanDAOHibernate;
import model.misc.HibernateUtil;

public class MinorCategoryBeanService {
	public static SessionFactory factory;
	public static Session session;
	
	public static void main(String[] args) {
		Insert();	
	    Select();		
		}

	private static void Insert() {
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new MinorCategoryBeanDAOHibernate(factory);
		MinorCategoryBeanService service = new MinorCategoryBeanService(dao);
		
		Transaction tx = null;
		MinorCategoryBean bean = new MinorCategoryBean();
		String category="男裝",item ="牛仔褲";
		bean.setCategory(category);
		bean.setItem(item);
 		
		try{
			tx = factory.getCurrentSession().beginTransaction();
			bean.setId(0);
			MinorCategoryBean insert  = service.insert(bean);
			System.out.println("insert:"+insert);
			tx.commit();
			}catch(Exception e)
			{
				System.out.println("insert:"+e.getMessage());

				tx.rollback();
			}
	}
	
	
	public static int Count()
	{
	  return dao.select().size();
	}
	
	public static void Select()
	{
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new MinorCategoryBeanDAOHibernate(factory);
		MinorCategoryBeanService service = new MinorCategoryBeanService(dao);
		
		Transaction tx = null;
		try{
			tx = factory.getCurrentSession().beginTransaction();
 			List<MinorCategoryBean> select   = service.select();
			System.out.println("Select:"+select);
			tx.commit();
			}catch(Exception e)
			{
				System.out.println("insert:"+e.getMessage());

				tx.rollback();
			}

		
		
	}
	
	
	
	public static Session getSession() {
		return factory.getCurrentSession();
	}
	
	public static MinorCategoryBeanDAOHibernate dao;
	public static Transaction trx;
	public MinorCategoryBeanService(MinorCategoryBeanDAOHibernate dao)
	{
		this.dao = dao;
	}
	
	
	public static MinorCategoryBean insert(MinorCategoryBean  bean)
	{
		return dao.insert(bean);
	}
	
	public static MinorCategoryBean select(int id)
	{
		return dao.select(id);
	}
	
	public static MinorCategoryBean select(MinorCategoryBean bean)
	{
		return dao.select(bean);
	}
	
	public static List<MinorCategoryBean> selectByCategory(String category)
	{
	 	return dao.selectByCategory(category);
		
	}
	
	public static List<MinorCategoryBean> SelectByPage(int page)
	{
		return dao.selectByPage(page);

	}
	
	public static List<MinorCategoryBean> select()
	{
		return dao.select();
	}

	public static MinorCategoryBean update(MinorCategoryBean bean) {
		return dao.update(bean);
	}
	public static boolean delete(MinorCategoryBean bean) {
		return dao.delete(bean);
	}
	
	public static boolean delete(int id) {
		return dao.delete(id);
	}
}
