package model.dao;
 
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.DetailBean;
import model.Interface.IDAO;
import model.misc.HibernateUtil;

public class DetailBeanDAOHibernate implements IDAO<DetailBean> {
	public static Session session;
	public static SessionFactory factory;
	public static Transaction trx;

	public static void main(String[] args) {
	test();

	}

	private static void test() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		DetailBeanDAOHibernate dao = new DetailBeanDAOHibernate(factory);

		// Insert
		try {
			trx = dao.getSession().beginTransaction();
			DetailBean bean = new DetailBean();
 			String item = "上衣",color = "green",detail = "暖暖的",size ="XL",pics="",desc="暖暖的";
			int price = 81000;
			bean.setId(0);
 			bean.setItem(item);
			bean.setDetail(detail);
			bean.setColor(color);
			bean.setSize(size);
			bean.setPics(pics);
			bean.setPrice(price);
			bean.setProddesc(desc);
 	  
			DetailBean insert = dao.insert(bean);
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
			DetailBean select = dao.select(2);
			System.out.println("select" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		
		// Update
		try {
			session = factory.getCurrentSession();
			trx = dao.getSession().beginTransaction();
			DetailBean bean = new DetailBean();
			String item = "上衣",color = "green",detail = "暖暖的",size ="XL",pics="",desc="暖暖的";
			int price = 81000;
 			bean.setItem(item);
			bean.setDetail(detail);
			bean.setColor(color);
			bean.setSize(size);
			bean.setPics(pics);
			bean.setPrice(price);
			bean.setProddesc(desc);
  			DetailBean update = dao.update(bean);
			System.out.println("update" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

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

	public DetailBeanDAOHibernate(SessionFactory factory) {
		this.factory = factory;
 	}

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	 
	 
	@Override
	public List<DetailBean> select() {
		List<DetailBean> list = new LinkedList<DetailBean>();
		return this.getSession().createQuery("from DetailBean", DetailBean.class).getResultList();
	}

	public List<DetailBean> selectByPage(int pages)
	{
		List<DetailBean> list = null;
		Query query =	getSession().createQuery("from DetailBean");
		query.setFirstResult((pages-1)*5);
		query.setMaxResults(5);
		list =query.getResultList();
		return list;
		
		
	}
	 

	@Override
	public Boolean delete(int id) {
		DetailBean temp = select(id);

		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean delete(DetailBean bean) {
		DetailBean temp = select(bean);
		if (temp != null) {
			this.getSession().delete(bean);
			return true;

		} else {
			return false;
		}
	}
 
	@Override
	public DetailBean select(DetailBean bean) {
		if (bean != null) {
			bean = this.getSession().get(DetailBean.class, bean.getId());
		}
		return bean;
	
	}

	@Override
	public DetailBean select(int id) {
 	 return this.getSession().get(DetailBean.class, id);

	}

	@Override
	public DetailBean insert(DetailBean bean) {
		DetailBean temp = select(bean);
		System.out.println("temp" + temp);

		if (temp == null) {
			this.getSession().save(bean);
			System.out.println("temp"+temp);

		}
		return bean;

	}

	@Override
	public DetailBean update(DetailBean bean) {
		DetailBean temp = select(bean.getId());
		if (temp != null)
		{
			temp.setProd_id(bean.getProd_id());
			temp.setItem(bean.getItem());
			temp.setPics(bean.getPics());
			temp.setPrice(bean.getPrice());
			temp.setProddesc(bean.getProddesc());
			temp.setSize(bean.getSize());
			temp.setQty(bean.getQty());
			temp.setColor(bean.getColor());
			temp.setDetail(bean.getDetail());
		}
 		return temp;
	}

	   
}
