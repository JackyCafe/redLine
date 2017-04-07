package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
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
import model.DetailPicsBean;
import model.UserBean;
import model.dao.DetailBeanDAOHibernate;
import model.dao.DetailPicsBeanDAOHibernate;
import model.dao.UserBeanDAOHibernate;
import model.misc.HibernateUtil;
import model.service.DetailBeanService;
import model.service.DetailPicsBeanService;
import model.service.UserBeanService;

@WebServlet(urlPatterns = { "/pages/detailpics.controller" },
initParams = { 
		@WebInitParam(name = "upload-path"
				, value = "/Users/hungming/Documents/workspace/redLine/WebContent/upload")}
)
@MultipartConfig
public class DetailPicsServlet extends HttpServlet {
	private SimpleDateFormat Format = new SimpleDateFormat("yyyy-MM-dd");
	private DetailPicsBeanService service;
	private String uploadPath;
	private File file;
	@Override
	public void init() throws ServletException {
		service = new DetailPicsBeanService(new DetailPicsBeanDAOHibernate
				(HibernateUtil.getSessionFactory()));
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		// 接收資料
//		request.setCharacterEncoding("UTF-8");
// 
//		String id_temp = request.getParameter("id");
//
//			String detail = request.getParameter("detail");			
//			String upload = request.getParameter("upload");
//
//			
//	  		String prodaction = request.getParameter("prodaction");
//			System.out.println("prodaction :" + prodaction+":"+detail+":"+upload);
//
//			// 驗證資料
//			Map<String, String> errors = new HashMap<String, String>();
//			request.setAttribute("error", errors);
//
//			int  id = 0;
//			// 轉換資料
//			if (id_temp != null) {
//				try {
//					id = Integer.valueOf(id_temp);
//					System.out.println(">>"+id);
//				} catch (Exception e) {
//					errors.put("price", "Please enter id for Integer " + prodaction);
//				}
//			}
//	 		// 呼叫Model
//			DetailPicsBean bean = new DetailPicsBean();
//	 		if (prodaction != null && prodaction.equals("Insert"))
//				{bean.setId(0);
//	 			bean.setPics(file.getPath());}
//
//			else
//				{bean.setId(id);
//	 			bean.setPics(upload);
//				}
//	 		System.out.println(bean);
//	 		bean.setDetail(detail);
//	 		 
//	 
//			// 根據Model執行結果導向View
//
//			if (prodaction != null && prodaction.equals("Select")) {
//				List<DetailPicsBean> result = service.select();
//				System.out.println("Select" + result);
//				// ProductBean result = service.select(bean);
//				request.setAttribute("select", result);
//				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//			} else if (prodaction != null && prodaction.equals("Insert")) {
//				DetailPicsBean result = service.insert(bean);
//				List<DetailPicsBean> select = service.select();
//				System.out.println("Select" + select);
//				request.setAttribute("select", select);
//				if (result == null) {
//					errors.put("action", "Insert fail");
//	 				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//				} else {
//					request.setAttribute("insert", result);
//				}
//				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//			} else if (prodaction != null && prodaction.equals("Update")) {
//				if (bean != null) {
//					System.out.println(bean.getId()+""+
//							bean.getDetail()+""+bean.getPics());
//					DetailPicsBean result = service.update(bean);
//					if (result == null) {
//						errors.put("action", "Update fail");
//						DetailPicsBean update = service.select(id);
//						request.setAttribute("Update", update);
//						System.out.println("here");
//		 				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//					} else {
//						request.setAttribute("update", result);
//						List<DetailPicsBean> select = service.select();
//						System.out.println("Select" + select);
//						request.setAttribute("select", select);
//					}
//				}
//
//				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//			} else if (prodaction != null && prodaction.equals("Delete")) {
//				System.out.println("Delete ==>" + bean.getId());
//				boolean result = service.delete(id);
//				if (!result) {
//					request.setAttribute("delete", 0);
//				} else {
//					request.setAttribute("delete", 1);
//					List<DetailPicsBean> select = service.select();
//					System.out.println("Select" + select);
//					request.setAttribute("select", select);
//				}
//				request.getRequestDispatcher("./maintain.jsp").forward(request, response);
//			} else {
//				errors.put("action", "Unknown Action:" + prodaction);
//				List<DetailPicsBean> select = service.select();
//				request.setAttribute("select", select);
//
//				request.getRequestDispatcher("maintain.jsp").forward(request, response);
//			}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  PrintWriter out = response.getWriter();
		  response.setContentType("text/html;charset=utf-8");
	      InputStream in  = request.getInputStream();
          request.setCharacterEncoding("utf8");
  		  Part part = request.getPart("upload");		
 
 		  //Mac 只會抓到檔名，Windows會含路徑
		  String filename = part.getSubmittedFileName(); 
 		  String name = part.getName();
		  out.print(name);
 		  long size = part.getSize();
		  byte[] buf = new byte[(int)size];
 		  BufferedInputStream bin = new BufferedInputStream(part.getInputStream());

 		  uploadPath = getServletConfig().getInitParameter("upload-path");
  		  file = new File(uploadPath+"/"+filename);
 		  FileOutputStream fout = new FileOutputStream(file);
 		  bin.read(buf);
 		  fout.write(buf);

 		  bin.close();

 			String id_temp = request.getParameter("id");

			String detail = request.getParameter("detail");			
			String upload = request.getParameter("upload");

			
	  		String prodaction = request.getParameter("prodaction");
			System.out.println("prodaction :" + prodaction+":"+detail+":"+upload);

			// 驗證資料
			Map<String, String> errors = new HashMap<String, String>();
			request.setAttribute("error", errors);

			int  id = 0;
			// 轉換資料
			if (id_temp != null) {
				try {
					id = Integer.valueOf(id_temp);
					System.out.println(">>"+id);
				} catch (Exception e) {
					errors.put("price", "Please enter id for Integer " + prodaction);
				}
			}
	 		// 呼叫Model
			DetailPicsBean bean = new DetailPicsBean();
	 		if (prodaction != null && prodaction.equals("Insert"))
				{bean.setId(0);
	 			bean.setPics(file.getPath());}

			else
				{bean.setId(id);
	 			bean.setPics(upload);
				}
	 		System.out.println(bean);
	 		bean.setDetail(detail);
	 		 
	 
			// 根據Model執行結果導向View

			if (prodaction != null && prodaction.equals("Select")) {
				List<DetailPicsBean> result = service.select();
				System.out.println("Select" + result);
				// ProductBean result = service.select(bean);
				request.setAttribute("select", result);
				request.getRequestDispatcher("maintain.jsp").forward(request, response);
			} else if (prodaction != null && prodaction.equals("Insert")) {
				DetailPicsBean result = service.insert(bean);
				List<DetailPicsBean> select = service.select();
				System.out.println("Select" + select);
				request.setAttribute("select", select);
				if (result == null) {
					errors.put("action", "Insert fail");
	 				request.getRequestDispatcher("maintain.jsp").forward(request, response);
				} else {
					request.setAttribute("insert", result);
				}
				request.getRequestDispatcher("maintain.jsp").forward(request, response);
			} else if (prodaction != null && prodaction.equals("Update")) {
				if (bean != null) {
					System.out.println(bean.getId()+""+
							bean.getDetail()+""+bean.getPics());
					DetailPicsBean result = service.update(bean);
					if (result == null) {
						errors.put("action", "Update fail");
						DetailPicsBean update = service.select(id);
						request.setAttribute("Update", update);
						System.out.println("here");
		 				request.getRequestDispatcher("maintain.jsp").forward(request, response);
					} else {
						request.setAttribute("update", result);
						List<DetailPicsBean> select = service.select();
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
					List<DetailPicsBean> select = service.select();
					System.out.println("Select" + select);
					request.setAttribute("select", select);
				}
				request.getRequestDispatcher("./maintain.jsp").forward(request, response);
			} else {
				errors.put("action", "Unknown Action:" + prodaction);
				List<DetailPicsBean> select = service.select();
				request.setAttribute("select", select);

				request.getRequestDispatcher("maintain.jsp").forward(request, response);
			}

	//	this.doGet(request, response);
	}
}
