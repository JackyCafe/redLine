package controller;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.struts2.dispatcher.Dispatcher;
 
import model.DetailBean;
import model.UserBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;
import model.service.DetailBeanService;
import model.service.UserBeanService;
  
@WebServlet(urlPatterns = { "/pages/detail.controller" },
			initParams = {
					@WebInitParam(name = "upload-path",value = "/Users/hungming/Documents/workspace/redLine/WebContent/redLine/images")
					} )
@MultipartConfig
public class DetailServlet extends HttpServlet {
	private SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	private DetailBeanService service;
	private String name;

	@Override
	public void init() throws ServletException {
		service = new DetailBeanService(new DetailBeanDAOHibernate(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收資料
		request.setCharacterEncoding("UTF-8");
		
		String id_temp = request.getParameter("id");
		String prod_id = request.getParameter("prod_id");
		String item = request.getParameter("item");
		String color = request.getParameter("color");
		String detail = request.getParameter("detail");
		String size = request.getParameter("size");
		
		String pics =name;
		String qty = request.getParameter("qty");
		String temp1 = request.getParameter("price");

		String desc = request.getParameter("proddesc");
		System.out.println("prod_id" + prod_id);

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

		if (temp1 != null) {
			try {
				price = Integer.valueOf(temp1);
			} catch (Exception e) {
				errors.put("price", "Please enter price for Integer " + prodaction);
			}
		}

		// 呼叫Model
		DetailBean bean = new DetailBean();
		// String item = "上衣",color = "green",detail = "暖暖的",size
		// ="XL",pics="",desc="暖暖的";
		if (prodaction != null && prodaction.equals("Insert"))
			bean.setId(0);
		else
			bean.setId(id);
		bean.setProd_id(prod_id);
		bean.setItem(item);
		bean.setDetail(detail);
		bean.setColor(color);
		bean.setSize(size);
		bean.setPics(pics);
		bean.setQty(qty);
		bean.setPrice(price);
		bean.setProddesc(desc);
		System.out.println("bean" + bean);
		// 根據Model執行結果導向View

		if (prodaction != null && prodaction.equals("Select")) {
			List<DetailBean> result = service.select();
			System.out.println("Select" + result);
			// ProductBean result = service.select(bean);
			request.setAttribute("select", result);
			request.getRequestDispatcher("/pages/maintain.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Insert")) {
			System.out.println("bean" + bean);
			DetailBean result = service.insert(bean);
			List<DetailBean> select = service.select();
			System.out.println("Select" + select);
			request.setAttribute("select", select);
			if (result == null) {
				errors.put("action", "Insert fail");
				response.sendRedirect("maintain.jsp");
				// request.getRequestDispatcher("/pages/detail_display.jsp").forward(request,
				// response);
			} else {
				request.setAttribute("insert", result);
			}
			response.sendRedirect("maintain.jsp");

			// request.getRequestDispatcher("/pages/detail_display.jsp").forward(request,
			// response);
		} else if (prodaction != null && prodaction.equals("Update")) {
			if (bean != null) {
				DetailBean result = service.update(bean);
				if (result == null) {
					errors.put("action", "Update fail");
					DetailBean update = service.select(id);
					request.setAttribute("Update", update);
					request.getRequestDispatcher("maintain.jsp").forward(request, response);
				} else {
					request.setAttribute("update", result);
					List<DetailBean> select = service.select();
					System.out.println("Select" + select);
					request.setAttribute("select", select);
				}
			}

			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		} else if (prodaction != null && prodaction.equals("Delete")) {
			System.out.println("Delete ==>" + bean.getId());
			boolean result = service.delete(id);
			if (!result) {
				request.setAttribute("delete", 0);
			} else {
				request.setAttribute("delete", 1);
				List<DetailBean> select = service.select();
				System.out.println("Select" + select);
				request.setAttribute("select", select);
			}
			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		} else {
			errors.put("action", "Unknown Action:" + prodaction);
			List<DetailBean> select = service.select();
			request.setAttribute("select", select);

			request.getRequestDispatcher("maintain.jsp").forward(request, response);
		}

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  resp.setContentType("text/html;charset=utf-8");
		  resp.setCharacterEncoding("utf-8");
		  req.setCharacterEncoding("utf-8");
		  PrintWriter out = resp.getWriter();
		  Part part = req.getPart("pics");
		  name = part.getSubmittedFileName();
 		  long size =part.getSize();
		  byte[] buf = new byte[(int)size];
		  InputStream in = part.getInputStream();
		  String uploadPath = getServletConfig().getInitParameter("upload-path");
 		  FileOutputStream fout = new FileOutputStream(uploadPath+"/"+name);
 		  BufferedInputStream bin = new BufferedInputStream(in);
 		  bin.read(buf);
 		  fout.write(buf);
 		  fout.close();

		  
		  doGet(req, resp);
	}
}
