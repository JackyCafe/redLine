package model.service;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.UserBean;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;

public class UserBeanService {
	UserBeanDAOHibernate dao;

	public static void main(String[] args) {
		Session session = HibernateUtil.createSessionFactoty().getCurrentSession();
		UserBeanDAOHibernate dao = new UserBeanDAOHibernate(HibernateUtil.createSessionFactoty());
		UserBeanService service = new UserBeanService(dao);
		Transaction trx = null;

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

		// insert
		try {
			dao  = new UserBeanDAOHibernate(HibernateUtil.createSessionFactoty());
			trx = dao.getSession().beginTransaction();

			UserBean insert = service.insert(bean);
			System.out.println("insert ==>" + insert);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		// select
		try {
			session = HibernateUtil.createSessionFactoty().getCurrentSession();
			dao  = new UserBeanDAOHibernate(HibernateUtil.createSessionFactoty());
			trx = dao.getSession().beginTransaction(); 
			UserBean select = service.insert(bean);
			System.out.println("select ==>" + select);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}

		// update
		try {
			session = HibernateUtil.createSessionFactoty().getCurrentSession();
			dao  = new UserBeanDAOHibernate(HibernateUtil.createSessionFactoty());
			trx = dao.getSession().beginTransaction(); 
		
			bean.setPassword("654321");
			UserBean update = service.update(bean);
			System.out.println("update ==>" + update);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
		
		// delete
		try {
			session = HibernateUtil.createSessionFactoty().getCurrentSession();
			dao  = new UserBeanDAOHibernate(HibernateUtil.createSessionFactoty());
			trx = dao.getSession().beginTransaction(); 
		
 			Boolean delete = service.delete(bean.getId());
			System.out.println("delete ==>" + delete);
			trx.commit();
		} catch (Exception e) {
			trx.rollback();
		}
				
		
	}

	public UserBeanService(UserBeanDAOHibernate dao) {
		this.dao = dao;
	}

	public UserBean insert(UserBean bean) {
		return dao.insert(bean);
	}

	public UserBean select(int id) {
		return dao.select(id);
	}
	
	public List<UserBean> select()
	{
		return dao.select();
	}

	public Boolean delete(int id) {
		return dao.delete(id);
	}

	public UserBean update(UserBean bean) {
		return dao.update(bean);
	}

}
