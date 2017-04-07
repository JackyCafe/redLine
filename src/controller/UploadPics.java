package controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

 
/**
 * Servlet implementation class UploadPics
 */
@WebServlet(
		urlPatterns={"/pages/upload_pics.controller"},
		initParams = { 
						@WebInitParam(name = "upload-path"
								, value = "/Users/hungming/Documents/workspace/redLine/WebContent/upload")}
		)
@MultipartConfig
public class UploadPics extends HttpServlet {
        
    public String uploadPath; 
 	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		  PrintWriter out = response.getWriter();
		  Part part = request.getPart("upload");		
		  String header = part.getHeader("Content-Disposition");
 		  out.println(header+"<br>");
 		  //Mac 只會抓到檔名，Windows會含路徑
		  String filename = part.getSubmittedFileName(); 
 		  String name = part.getName();
		  out.print(name);
 		  long size = part.getSize();
		  byte[] buf = new byte[(int)size];
 		  BufferedInputStream bin = new BufferedInputStream(part.getInputStream());

 		  uploadPath = getServletConfig().getInitParameter("upload-path");
 		  out.println("upload.uploadPath"+uploadPath+"/"+filename+"<br>");
 		  File file = new File(uploadPath+"/"+filename);
 		  FileOutputStream fout = new FileOutputStream(file);
 		  bin.read(buf);
 		  fout.write(buf);

 		  bin.close();
		 // String myfilename = getFilename(header);
		  doGet(request, response);
	}

}
