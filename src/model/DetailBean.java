package model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.misc.HibernateUtil;

@Entity
@Table(schema = "redLine", name = "Detail"
 )
public class DetailBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
 	private String item;
 	private String prod_id;
	private String detail;
	private String pics;
	private String qty;
	private Integer price;
	private String size;
	private String color;
	private String proddesc;
 
	public static void main(String[] args) {
		Insert();
	}
	
	public static Session getSession()
	{
		return HibernateUtil.getSessionFactory().getCurrentSession();
	}
	private static void Insert()
	{
		Transaction tx = null ;
		try {
			String item = "上衣",color = "green",detail = "暖暖的",size ="XL",pics="",desc="公道價";
			int price = 82000; 
			DetailBean bean = new DetailBean();
			bean.setDetail(detail);
			bean.setItem(item);
			bean.setPics(pics);
			bean.setSize(size);
			bean.setColor(color);
			bean.setPrice(price);
			bean.setProddesc(desc);

			tx = getSession().beginTransaction();
			getSession().save(bean);
 			tx.commit();
		} catch (Exception e) {
			tx.rollback();
 		}
		 
	}

	
	public DetailBean() {

	}
	
	

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getProd_id() {
		return prod_id;
	}

	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getProddesc() {
		return proddesc;
	}

	public void setProddesc(String proddesc) {
		this.proddesc = proddesc;
	}

	@Override
	public String toString() {
		return "DetailBean [id=" + id + ", item=" + item + ", prod_id=" + prod_id + ", detail=" + detail + ", pics="
				+ pics + ", qty=" + qty + ", price=" + price + ", size=" + size + ", color=" + color + ", proddesc="
				+ proddesc + "]";
	}

}
