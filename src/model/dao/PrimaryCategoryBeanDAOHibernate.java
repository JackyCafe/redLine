package model.dao;
 
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.MinorCategoryBean;
import model.PrimaryCategoryBean;
import model.Interface.IDAO;
import model.misc.HibernateUtil;

public class PrimaryCategoryBeanDAOHibernate implements IDAO<PrimaryCategoryBean> {
	public static Session session;
	public static SessionFactory factory;
	public static Transaction trx;

	public static void main(String[] args) {
	test();

	}

	private static void test() {
		

		Insert( );
		Select( );
 		Update( );
 		Delete( );
		
	}

	private static void Insert() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		PrimaryCategoryBeanDAOHibernate dao = new PrimaryCategoryBeanDAOHibernate(factory);
		// Insert
		try {
			trx = dao.getSession().beginTransaction();
			String prodName = "redLine",category = "男裝2";
			PrimaryCategoryBean bean = new PrimaryCategoryBean(prodName,category);
			bean.setId(0);
			PrimaryCategoryBean  insert = dao.insert(bean);
			System.out.println("insert" + insert);
			trx.commit();
		} catch (Exception e) {
			System.out.println("insert" + e.toString());

			trx.rollback();
		}
	}

	private static void Select() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		PrimaryCategoryBeanDAOHibernate dao = new PrimaryCategoryBeanDAOHibernate(factory);
		// Select
		try {
			session = factory.getCurrentSession();
			trx = session.beginTransaction();
			List<PrimaryCategoryBean> select = dao.select();
			System.out.println("select" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
	}

	private static void Update() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		PrimaryCategoryBeanDAOHibernate dao = new PrimaryCategoryBeanDAOHibernate(factory);
		// Update
		try {
			session = factory.getCurrentSession();
			trx = dao.getSession().beginTransaction();
			String category = "男裝",prodName = "redLine";

			PrimaryCategoryBean bean = new PrimaryCategoryBean(prodName,category);
			bean.setId(1);  
			PrimaryCategoryBean update = dao.update(bean);
			System.out.println("update" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
	}

	private static void Delete() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		PrimaryCategoryBeanDAOHibernate dao = new PrimaryCategoryBeanDAOHibernate(factory);
		// delete
		try {
			session = factory.getCurrentSession();

			trx = dao.getSession().beginTransaction();
			Boolean delete = dao.delete(1);
			System.out.println("delete" + delete);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
	}

	public PrimaryCategoryBeanDAOHibernate(SessionFactory factory) {
		this.factory = factory;
 	}

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	 
	 
	@Override
	public List<PrimaryCategoryBean> select() {
		List<MinorCategoryBean> list = new LinkedList<MinorCategoryBean>();
		return this.getSession().createQuery("from PrimaryCategoryBean", PrimaryCategoryBean.class).getResultList();
	}

	 

	@Override
	public Boolean delete(int id) {
		PrimaryCategoryBean temp = select(id);

		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean delete(PrimaryCategoryBean bean) {
		PrimaryCategoryBean temp = select(bean);
		if (temp != null) {
			this.getSession().delete(bean);
			return true;

		} else {
			return false;
		}
	}
 
	@Override
	public PrimaryCategoryBean select(PrimaryCategoryBean bean) {
		if (bean != null) {
			bean = this.getSession().get(PrimaryCategoryBean.class, bean.getId());
		}
		return bean;
	
	}

	@Override
	public PrimaryCategoryBean select(int id) {
 	 return this.getSession().get(PrimaryCategoryBean.class, id);

	}

	public List<PrimaryCategoryBean> selectCategoryByProd (String prod)
	{
		return this.getSession()
				.createQuery("from PrimaryCategoryBean where prod_name=:param", PrimaryCategoryBean.class)
				.setParameter("param", prod)
				.getResultList();

	}
	
	@Override
	public PrimaryCategoryBean insert(PrimaryCategoryBean bean) {
		PrimaryCategoryBean temp = select(bean);
 
		if (temp == null) {
			this.getSession().save(bean);
 
		}
		return bean;

	}

	@Override
	public PrimaryCategoryBean update(PrimaryCategoryBean bean) {
		PrimaryCategoryBean temp = select(bean.getId());
		if (temp != null)
		{
			temp.setProdName(bean.getProdName()); 
			temp.setCategory(bean.getCategory()); 
		}
 		return temp;
	}

	   
}
