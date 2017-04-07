package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.Dispatcher;

import model.DetailBean;
import model.MinorCategoryBean;
import model.PrimaryCategoryBean;
import model.UserBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.MinorCategoryBeanDAOHibernate;
import model.dao.PrimaryCategoryBeanDAOHibernate;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;
import model.service.DetailBeanService;
import model.service.MinorCategoryBeanService;
import model.service.PrimaryCategoryBeanService;
import model.service.UserBeanService;

@WebServlet(urlPatterns = { "/pages/primary.controller" })
public class PrimaryCategoryServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private PrimaryCategoryBeanService service;

	@Override
	public void init() throws ServletException {
		service = new PrimaryCategoryBeanService(new PrimaryCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		request.setCharacterEncoding("UTF-8");
		String id_temp = request.getParameter("id");
		String category = request.getParameter("category");
		String prodName = request.getParameter("prodName");
		System.out.println(prodName+";"+category); 
		
 
		String prodaction = request.getParameter("prodaction");
		System.out.println("prodaction :" + prodaction);

		// 驗證資料
		Map<String, String> errors = new HashMap<String, String>();
		request.setAttribute("error", errors);

		int price = 0, id = 0;
		// 轉換資料
		if (id_temp != null) {
			try {
				id = Integer.valueOf(id_temp);
			} catch (Exception e) {
				errors.put("price", "Please enter id for Integer " + prodaction);
			}
		}

	 

		// 呼叫Model
		PrimaryCategoryBean bean = new PrimaryCategoryBean();
		// String item = "上衣",color = "green",detail = "暖暖的",size
		// ="XL",pics="",desc="暖暖的";
		if (prodaction != null && prodaction.equals("Insert"))
			bean.setId(0);
		else
			bean.setId(id);
		bean.setProdName(prodName);
		bean.setCategory(category);
	 

		// 根據Model執行結果導向View

		if (prodaction != null && prodaction.equals("Select")) {
			List<PrimaryCategoryBean> result = service.select();
			System.out.println("Select" + result);
			// ProductBean result = service.select(bean);
			request.setAttribute("select", result);
			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		//	request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Insert")) {
			PrimaryCategoryBean result = service.insert(bean);
			List<PrimaryCategoryBean> select = service.select();
			System.out.println("Select" + select);
			request.setAttribute("select", select);
			if (result == null) {
				errors.put("action", "Insert fail");
				request.getRequestDispatcher("maintain.jsp").forward(request, response);

			//	request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Update")) {
			if (bean != null) {
				PrimaryCategoryBean result = service.update(bean);
				if (result == null) {
					errors.put("action", "Update fail");
					PrimaryCategoryBean update = service.select(id);
					request.setAttribute("Update", update);
					System.out.println("here");
					request.getRequestDispatcher("maintain.jsp").forward(request, response);

					//request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
				} else {
					request.setAttribute("update", result);
					List<PrimaryCategoryBean> select = service.select();
					System.out.println("Select" + select);
					request.setAttribute("select", select);
				}
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

			//request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Delete")) {
			System.out.println("Delete ==>" + bean.getId());
			boolean result = service.delete(id);
			if (!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
				List<PrimaryCategoryBean> primary = service.select();
				System.out.println("Select" + primary);
				request.setAttribute("select", primary);
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

			//request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
		} else {
			errors.put("action", "Unknown Action:" + prodaction);
			List<PrimaryCategoryBean> select = service.select();
			request.setAttribute("select", select);
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

//			request.getRequestDispatcher("/pages/PrimaryCategory_display.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
