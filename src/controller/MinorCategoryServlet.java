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
import model.UserBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.MinorCategoryBeanDAOHibernate;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;
import model.service.DetailBeanService;
import model.service.MinorCategoryBeanService;
import model.service.UserBeanService;

@WebServlet(urlPatterns = { "/pages/minor.controller" })
public class MinorCategoryServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private MinorCategoryBeanService service;

	@Override
	public void init() throws ServletException {
		service = new MinorCategoryBeanService(new MinorCategoryBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		request.setCharacterEncoding("UTF-8");
		String id_temp = request.getParameter("id");
		String category = request.getParameter("category");
		String item = request.getParameter("item");
		 

 
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
		MinorCategoryBean bean = new MinorCategoryBean();
		// String item = "上衣",color = "green",detail = "暖暖的",size
		// ="XL",pics="",desc="暖暖的";
		if (prodaction != null && prodaction.equals("Insert"))
			bean.setId(0);
		else
			bean.setId(id);
		bean.setItem(item);
		bean.setCategory(category);
	 

		// 根據Model執行結果導向View

		if (prodaction != null && prodaction.equals("Select")) {
			List<MinorCategoryBean> result = service.select();
			System.out.println("Select" + result);
			// ProductBean result = service.select(bean);
			request.setAttribute("minor", result);
			request.getRequestDispatcher("/pages/maintain.jsp").forward(request, response);

//			request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Insert")) {
			MinorCategoryBean result = service.insert(bean);
			List<MinorCategoryBean> minor = service.select();
			System.out.println("Select" + minor);
			request.setAttribute("minor", minor);
			if (result == null) {
				errors.put("action", "Insert fail");
				request.getRequestDispatcher("maintain.jsp").forward(request, response);

//				request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
			} else {
				request.setAttribute("insert", result);
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Update")) {
			if (bean != null) {
				MinorCategoryBean result = service.update(bean);
				if (result == null) {
					errors.put("action", "Update fail");
					MinorCategoryBean update = service.select(id);
					request.setAttribute("Update", update);
					System.out.println("here");
					request.getRequestDispatcher("maintain.jsp").forward(request, response);

//					request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
				} else {
					request.setAttribute("update", result);
					List<MinorCategoryBean> minor = service.select();
					System.out.println("minor" + minor);
					request.setAttribute("minor", minor);
				}
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

	//		request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Delete")) {
			System.out.println("Delete ==>" + bean.getId());
			boolean result = service.delete(id);
			if (!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
				List<MinorCategoryBean> minor = service.select();
				System.out.println("minor" + minor);
				request.setAttribute("minor", minor);
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

		//	request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
		} else {
			errors.put("action", "Unknown Action:" + prodaction);
			List<MinorCategoryBean> minor = service.select();
			request.setAttribute("minor", minor);
			//maintain.jsp#product_list
			request.getRequestDispatcher("maintain.jsp").forward(request, response);

			//request.getRequestDispatcher("/pages/MinorCategory_display.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
