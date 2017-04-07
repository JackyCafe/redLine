package model.dao;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
 
import model.UserBean;
import model.Interface.IDAO;
import model.misc.HibernateUtil;

public class UserBeanDAOHibernate implements IDAO<UserBean> {
	public static Session session;
	public static SessionFactory factory;
	public static Transaction trx;

	public static void main(String[] args) {
	//	test();

	}

	private static void test() {
		factory = HibernateUtil.getSessionFactory();
		session = factory.getCurrentSession();
		UserBeanDAOHibernate dao = new UserBeanDAOHibernate(factory);

		// Insert
		try {
			trx = dao.getSession().beginTransaction();
			UserBean bean = new UserBean();
			bean.setId(2);
			bean.setUser_Name("while");
			bean.setPassword("123456");
			bean.setEmail("lhm0531@gmail.com");
			bean.setAddress("台中市公益路");
			bean.setBirthday(new Date());
			bean.setProd_name("xxx");
			bean.setTel("04-1234567");
			bean.setMobile("0912-3456789");
			bean.setStyle(1);
			bean.setBrand_desc("Story");
 
			UserBean insert = dao.insert(bean);
			System.out.println("insert" + insert);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		
		// Select
		try {
			session = factory.getCurrentSession();
			trx = session.beginTransaction();
			UserBean select = dao.select(2);
			System.out.println("select" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		
		// Update
		try {
			session = factory.getCurrentSession();
			trx = dao.getSession().beginTransaction();
			UserBean bean = new UserBean();
			bean.setId(2);
			bean.setUser_Name("yello");
			bean.setPassword("123456");
			bean.setEmail("lhm0531@gmail.com");
			bean.setAddress("台中市公益路");
			bean.setBirthday(new Date());
			bean.setProd_name("xxx");
			bean.setTel("04-1234567");
			bean.setMobile("0912-3456789");
			bean.setStyle(1);
			bean.setBrand_desc("Story");
			UserBean update = dao.update(bean);
			System.out.println("update" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		// delete
		try {
			session = factory.getCurrentSession();

			trx = dao.getSession().beginTransaction();
			Boolean delete = dao.delete(2);
			System.out.println("delete" + delete);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
		
	}

	public UserBeanDAOHibernate(SessionFactory factory) {
		this.factory = factory;
 	}

	@Override
	public Session getSession() {
		return factory.getCurrentSession();
	}

	@Override
	public UserBean select(UserBean bean) {
		if (bean != null) {
			bean = this.getSession().get(UserBean.class, bean.getId());
		}
		return bean;
	}

	@Override
	public UserBean select(int id) {
		return this.getSession().get(UserBean.class, id);
	}

	@Override
	public List<UserBean> select() {
		List<UserBean> list = new LinkedList<UserBean>();
		return this.getSession().createQuery("from UserBean", UserBean.class).getResultList();
	}

	@Override
	public UserBean insert(UserBean bean) {
		UserBean temp = select(bean);
		System.out.println("temp" + temp);

		if (temp == null) {
			this.getSession().save(bean);
			System.out.println("temp"+temp);

		}
		return bean;
	}

	@Override
	public Boolean delete(int id) {
		UserBean temp = select(id);

		if (temp != null) {
			this.getSession().delete(temp);
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Boolean delete(UserBean bean) {
		UserBean temp = select(bean);
		if (temp != null) {
			this.getSession().delete(bean);
			return true;

		} else {
			return false;
		}
	}

	@Override
	public UserBean update(UserBean bean) {
		UserBean temp = select(bean);
		if (temp != null) {
			temp.setId(bean.getId());
			temp.setUser_Name(bean.getProd_name());
			temp.setPassword(bean.getPassword());
			temp.setEmail(bean.getEmail());
			temp.setAddress(bean.getAddress());
			temp.setBirthday(bean.getBirthday());
			temp.setProd_name(bean.getProd_name());
			temp.setTel(bean.getTel());
			temp.setMobile(bean.getMobile());
			temp.setStyle(bean.getStyle());
			temp.setBrand_desc(bean.getBrand_desc());
		}
		return temp;
	}

}
