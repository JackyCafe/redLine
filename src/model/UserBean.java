package model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import model.misc.HibernateUtil;

@Entity
@Table(schema = "redLine", name = "user"
, uniqueConstraints = @UniqueConstraint(columnNames = "prod_name"))
public class UserBean implements Serializable {
	@Id
	private int id;
	private String user_Name;
	private String password;
	private String email;
	private String address;
	private Date birthday;
	private String prod_name;
	private String tel;
	private String mobile;
	private int style;
	private String brand_desc;

	public static void main(String[] args) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		try {
			session.beginTransaction();
			session.getTransaction().commit();
			UserBean select = session.get(UserBean.class, 1);
			System.out.println("select " + select);
		} catch (Exception e) {
			session.getTransaction().rollback();

		}

	}

	public UserBean() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_Name() {
		return user_Name;
	}

	public void setUser_Name(String user_Name) {
		this.user_Name = user_Name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public int getStyle() {
		return style;
	}

	public void setStyle(int style) {
		this.style = style;
	}

	public String getBrand_desc() {
		return brand_desc;
	}

	public void setBrand_desc(String brand_desc) {
		this.brand_desc = brand_desc;
	}

	@Override
	public String toString() {
		return "UserBean [id=" + id + ", userName=" + user_Name + ", password=" + password + ", email=" + email
				+ ", address=" + address + ", birthday=" + birthday + ", prod_name=" + prod_name + ", tel=" + tel
				+ ", mobile=" + mobile + ", style=" + style + ", brand_desc=" + brand_desc + "]";
	}

}
