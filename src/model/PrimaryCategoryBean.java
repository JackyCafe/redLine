package model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.misc.HibernateUtil;

/**
 * PrimaryCategory generated by hbm2java
 */
@Entity
@Table(name = "primaryCategory", catalog = "redLine")
//, uniqueConstraints = @UniqueConstraint(columnNames = "category"))
public class PrimaryCategoryBean implements java.io.Serializable {

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Integer id;
	private String prodName;
	private String category;

	public static void main(String[] args) {
		Select();
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
			String prodName = "redLine";
			String category = "男裝";
			PrimaryCategoryBean bean = new PrimaryCategoryBean(prodName,category);

			tx = getSession().beginTransaction();
			getSession().save(bean);
 			tx.commit();
		} catch (Exception e) {
			System.out.println(e.toString());
			tx.rollback();
 		}
		
		
		
	}

	
	@Override
	public String toString() {
		return "PrimaryCategoryBean [id=" + id + ", prodName=" + prodName + ", category=" + category + "]";
	}

	private static void Select() {
		Transaction tx = null ;
		try {
			tx = getSession().beginTransaction();
			PrimaryCategoryBean select = getSession().get(PrimaryCategoryBean.class, 3);
			System.out.println("Select "+select );
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
 		}
	}
	

	
	
	public PrimaryCategoryBean() {
	}

	
	
	public PrimaryCategoryBean(String prodName, String category) {
		this.prodName = prodName;
		this.category = category;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "prod_name", nullable = false, length = 256)
	public String getProdName() {
		return this.prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	@Column(name = "category", unique = true, nullable = false, length = 45)
	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}
