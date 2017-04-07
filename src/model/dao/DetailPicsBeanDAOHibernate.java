package model.dao;
 
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.DetailBean;
import model.DetailPicsBean;
import model.Interface.IDAO;
import model.misc.HibernateUtil;

public class DetailPicsBeanDAOHibernate implements IDAO<DetailPicsBean> {
	public static Session session;
	public static SessionFactory factory;
	public static Transaction trx;

	public static void main(String[] args) {
	test();

	}

	private static void test() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		DetailPicsBeanDAOHibernate dao = new DetailPicsBeanDAOHibernate(factory);

		// Insert
		try {
			trx = dao.getSession().beginTransaction();
			DetailPicsBean bean = new DetailPicsBean();
 			String detail = "222",pics="暖暖的s";
 			bean.setId(0);
 			bean.setDetail(detail);
 			bean.setPics(pics);
  	  
			DetailPicsBean insert = dao.insert(bean);
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
			DetailPicsBean select = dao.select(1);
			System.out.println("select" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		
		// Update
		try {
			session = factory.getCurrentSession();
			trx = dao.getSession().beginTransaction();
			DetailPicsBean bean = new DetailPicsBean();
			String detail = "222",pics="ss暖暖的";
			bean.setId(1);
 			bean.setDetail(detail);
 			bean.setPics(pics);
   			DetailPicsBean update = dao.update(bean);
			System.out.println("update" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

 	}

	public DetailPicsBeanDAOHibernate(SessionFactory factory) {
		this.factory = factory;
 	}

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	 
	 
	@Override
	public List<DetailPicsBean> select() {
		List<DetailPicsBean> list = new LinkedList<DetailPicsBean>();
		return this.getSession().createQuery("from DetailPicsBean", DetailPicsBean.class).getResultList();
	}

	 

	@Override
	public Boolean delete(int id) {
		DetailPicsBean temp = select(id);

		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean delete(DetailPicsBean bean) {
		DetailPicsBean temp = select(bean);
		if (temp != null) {
			this.getSession().delete(bean);
			return true;

		} else {
			return false;
		}
	}
 
	@Override
	public DetailPicsBean select(DetailPicsBean bean) {
		if (bean != null) {
			bean = this.getSession().get(DetailPicsBean.class, bean.getId());
		}
		return bean;
	
	}

	@Override
	public DetailPicsBean select(int id) {
 	 return this.getSession().get(DetailPicsBean.class, id);

	}

	@Override
	public DetailPicsBean insert(DetailPicsBean bean) {
		DetailPicsBean temp = select(bean);
		System.out.println("temp" + temp);

		if (temp == null) {
			this.getSession().save(bean);
			System.out.println("temp"+temp);

		}
		return bean;

	}

	@Override
	public DetailPicsBean update(DetailPicsBean bean) {
		DetailPicsBean temp = select(bean.getId());
		if (temp != null)
		{
 			temp.setPics(bean.getPics());
 			temp.setDetail(bean.getDetail());
		}
 		return temp;
	}

	   
}
