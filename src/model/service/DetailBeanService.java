package model.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.dao.DetailBeanDAOHibernate;
import model.misc.HibernateUtil;

public class DetailBeanService {
	public static SessionFactory factory;
	public static Session session;
	
	public static void main(String[] args) {
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new DetailBeanDAOHibernate(factory);
		DetailBeanService service = new DetailBeanService(dao);
		Transaction tx = null;
		DetailBean bean = new DetailBean();
			String item = "上衣",color = "green",detail = "暖暖的",size ="XL",pics="",desc="暖暖的";
		
		try{
			tx = factory.getCurrentSession().beginTransaction();
			DetailBean select  = service.insert(bean);
			System.out.println("insert:"+select);
			tx.commit();
			}catch(Exception e)
			{
				tx.rollback();
			}	
			
			
//	 
	}
	
	public static Session getSession() {
		return factory.getCurrentSession();
	}
	
	public static DetailBeanDAOHibernate dao;
	public static Transaction trx;
	public DetailBeanService(DetailBeanDAOHibernate dao)
	{
		this.dao = dao;
	}
	
	
	public DetailBean insert(DetailBean bean)
	{
		return dao.insert(bean);
	}
	
	public DetailBean select(int id)
	{
		return dao.select(id);
	}
	
	public int Count()
	{
		return dao.select().size();
	}
	
	public DetailBean select(DetailBean bean)
	{
		return dao.select(bean);
	}
	
	public List<DetailBean> select()
	{
		return dao.select();
	}

	public List<DetailBean> selectByPages(int pages)
	{
		return dao.selectByPage(pages);
	}
	
	public DetailBean update(DetailBean bean) {
		return dao.update(bean);
	}
	public boolean delete(DetailBean bean) {
		return dao.delete(bean);
	}
	
	public boolean delete(int id) {
		return dao.delete(id);
	}
}
