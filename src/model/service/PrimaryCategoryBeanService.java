package model.service;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.MinorCategoryBean;
import model.PrimaryCategoryBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.MinorCategoryBeanDAOHibernate;
import model.dao.PrimaryCategoryBeanDAOHibernate;
import model.misc.HibernateUtil;

public class PrimaryCategoryBeanService {
	public static SessionFactory factory;
	public static Session session;
	
	public static void main(String[] args) {
		Insert();	
	    Select();		
		}

	private static void Insert() {
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new PrimaryCategoryBeanDAOHibernate(factory);
		PrimaryCategoryBeanService service = new PrimaryCategoryBeanService(dao);
		
		Transaction tx = null;
		PrimaryCategoryBean bean = new PrimaryCategoryBean();
		String category="男裝",prodName ="redLine";
		bean.setCategory(category);
		bean.setProdName(prodName);
 		
		try{
			tx = factory.getCurrentSession().beginTransaction();
			bean.setId(0);
			PrimaryCategoryBean insert  = service.insert(bean);
			System.out.println("insert:"+insert);
			tx.commit();
			}catch(Exception e)
			{
				System.out.println("insert:"+e.getMessage());

				tx.rollback();
			}
	}
	
	public static void Select()
	{
		SessionFactory factory = new HibernateUtil().getSessionFactory();
		dao = new PrimaryCategoryBeanDAOHibernate(factory);
		PrimaryCategoryBeanService service = new PrimaryCategoryBeanService(dao);
		
		Transaction tx = null;
		try{
			tx = factory.getCurrentSession().beginTransaction();
 			List<PrimaryCategoryBean> select   = service.select();
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
	
	public static PrimaryCategoryBeanDAOHibernate dao;
	public static Transaction trx;
	public PrimaryCategoryBeanService(PrimaryCategoryBeanDAOHibernate dao)
	{
		this.dao = dao;
	}
	
	
	public static PrimaryCategoryBean insert(PrimaryCategoryBean  bean)
	{
		return dao.insert(bean);
	}
	
	public static PrimaryCategoryBean select(int id)
	{
		return dao.select(id);
	}
	
	
	public static PrimaryCategoryBean select(PrimaryCategoryBean bean)
	{
		return dao.select(bean);
	}
	
	public static List<PrimaryCategoryBean> select()
	{
		return dao.select();
	}
	
	public static List<String> selectCategory()
	{	List<String> result = new LinkedList<>();
	    for (PrimaryCategoryBean p: dao.select())
	    {
	    	result.add(p.getCategory());
	    }
		return result;
	}
	
	public static List<PrimaryCategoryBean> selectCategoryByProd(String prod)
	{
		List<PrimaryCategoryBean> result = new LinkedList<>();
	    return  dao.selectCategoryByProd(prod);
	    
		
	}

	public static PrimaryCategoryBean update(PrimaryCategoryBean bean) {
		return dao.update(bean);
	}
	public static boolean delete(PrimaryCategoryBean bean) {
		return dao.delete(bean);
	}
	
	public static boolean delete(int id) {
		return dao.delete(id);
	}
}
