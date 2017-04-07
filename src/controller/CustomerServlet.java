package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserBean;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;
import model.service.UserBeanService;
  

@WebServlet(
		urlPatterns={"/pages/customer.controller"}
)
public class CustomerServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private UserBeanService service;
	@Override
	public void init() throws ServletException {
		service = new UserBeanService(
				new UserBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	}
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//接收資料
		request.setCharacterEncoding("UTF-8");
		
		String temp1 = request.getParameter("id");
		System.out.println("temp1:"+temp1);
		String user_Name = request.getParameter("user_Name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		System.out.println("address"+address);
		String temp2 = request.getParameter("birthday");
		String prod_name= request.getParameter("prod_name");
		String tel = request.getParameter("tel");
		String mobile = request.getParameter("mobile");
		String temp3 = request.getParameter("style");
		System.out.println("style"+temp3);

		String brand_desc = request.getParameter("brand_desc");
		System.out.println("brand_desc"+brand_desc);
		String prodaction = request.getParameter("prodaction");
  		
//驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);
		
		if(prodaction!=null) {
			if(prodaction.equals("Insert") ||
					prodaction.equals("Update") || prodaction.equals("Delete")) {
				if(temp1==null || temp1.length()==0) {
					errors.put("id", "Please enter Id for "+prodaction);
				}
			}
		}
		
//轉換資料
		int id = 0;
		if(temp1!=null && temp1.length()!=0) {
			try {
				id = Integer.parseInt(temp1);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("id", "Id must be an integer");
			}
		}
		 
		int style = 0;
		if(temp3!=null && temp3.length()!=0) {
			try {
				style = Integer.parseInt(temp3);
			} catch (NumberFormatException e) {
				e.printStackTrace();
				errors.put("style", "style must be an integer");
			}
		}
	
		
		
		java.util.Date birthday = null;
		if(temp2!=null && temp2.length()!=0) {
			try {
				birthday = sFormat.parse(temp2);
			} catch (ParseException e) {
				e.printStackTrace();
				errors.put("make", "Make must be a date of YYYY-MM-DD");
			}
		}
	 	
		if(errors!=null && !errors.isEmpty()) {
			request.getRequestDispatcher(
					"/pages/Register.jsp").forward(request, response);
			return;
		}

//呼叫Model
		UserBean bean = new UserBean();
		bean.setId(id);
		bean.setUser_Name(user_Name);
		bean.setPassword(password);
		bean.setEmail(email);
		bean.setAddress(address);
		bean.setBirthday(birthday);
		bean.setProd_name(prod_name);
		bean.setTel(tel);
		bean.setMobile(mobile);
		bean.setStyle(style);
		bean.setBrand_desc(brand_desc);

		System.out.println("Insert :" +prodaction);	

		
//根據Model執行結果導向View
		if(prodaction!=null && prodaction.equals("Select")) {
			List<UserBean> result = service.select( );
//			ProductBean result = service.select(bean);
			request.setAttribute("select", result);
			request.getRequestDispatcher(
					"/pages/display.jsp").forward(request, response);
		} else if(prodaction!=null && prodaction.equals("Insert")) {
			UserBean result = service.insert(bean);
			System.out.println("Insert"+result);
			if(result==null) {
				errors.put("action", "Insert fail");
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher(
					"/pages/Register.jsp").forward(request, response);
		} else if(prodaction!=null && prodaction.equals("Update")) {
			UserBean result = service.update(bean);
			if(result==null) {
				errors.put("action", "Update fail");
			} else {
				request.setAttribute("update", result);
			}
			request.getRequestDispatcher(
					"/pages/Register.jsp").forward(request, response);
		} else if(prodaction!=null && prodaction.equals("Delete")) {
			boolean result = service.delete(bean.getId());
			System.out.println("delete"+result);
			if(!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
			}
			request.getRequestDispatcher(
					"/pages/Register.jsp").forward(request, response);
		} else  {
			errors.put("action", "Unknown Action:"+prodaction);
			request.getRequestDispatcher(
					"/pages/Register.jsp").forward(request, response);
		}

		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
