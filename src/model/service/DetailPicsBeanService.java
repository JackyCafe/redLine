package model.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.DetailPicsBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.DetailPicsBeanDAOHibernate;
import model.misc.HibernateUtil;

public class DetailPicsBeanService {
	public static SessionFactory factory;
	public static Session session;
	
	public static void main(String[] args) {
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new DetailPicsBeanDAOHibernate(factory);
		DetailPicsBeanService service = new DetailPicsBeanService(dao);
		Transaction tx = null;
		DetailPicsBean bean = new DetailPicsBean();
		String detail = "222",pics="x暖x暖x的";
		bean.setDetail(detail);
		bean.setPics(pics);
		bean.setId(1);
		
		try{
		
			tx = factory.getCurrentSession().beginTransaction();
		//	DetailPicsBean select  = service.insert(bean);
			DetailPicsBean select  = service.update(bean);
			System.out.println("insert:"+select);
			tx.commit();
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
				tx.rollback();
			}	
			
			
//	 
	}
	
	public static Session getSession() {
		return factory.getCurrentSession();
	}
	
	public static DetailPicsBeanDAOHibernate dao;
	public static Transaction trx;
	public DetailPicsBeanService(DetailPicsBeanDAOHibernate dao)
	{
		this.dao = dao;
	}
	
	
	public DetailPicsBean insert(DetailPicsBean bean)
	{
		return dao.insert(bean);
	}
	
	public DetailPicsBean select(int id)
	{
		return dao.select(id);
	}
	
	public DetailPicsBean select(DetailPicsBean bean)
	{
		return dao.select(bean);
	}
	
	public List<DetailPicsBean> select()
	{
		return dao.select();
	}

	public DetailPicsBean update(DetailPicsBean bean) {
		return dao.update(bean);
	}
	public boolean delete(DetailPicsBean bean) {
		return dao.delete(bean);
	}
	
	public boolean delete(int id) {
		return dao.delete(id);
	}
}
