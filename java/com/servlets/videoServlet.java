package com.servlets;
import com.model.*;
import com.service.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.mysql.cj.Session;

/**
 * Servlet implementation class videoServlet
 */
public class videoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public videoServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

				videoBean user = new videoBean();
				
				user.setName(request.getParameter("name"));
				user.setYear(request.getParameter("year"));
				user.setCategory(request.getParameter("category"));
				user.setDescription(request.getParameter("description"));
				HttpSession s1=request.getSession();
				user.setUser(s1.getAttribute("cUserName").toString());
				user.setQulity(request.getParameter("quality"));
				
				user = videoDAO.insertVideo(user);
				int vidId=videoDAO.getVidId(request.getParameter("name"), request.getParameter("year"));


				HttpSession session = request.getSession(true);
				session.setAttribute("currentVidId", vidId);
				response.sendRedirect("uploadVid.jsp"); // logged-in page
				

		}

		catch (Throwable theException) {
			System.out.println(theException);
		}
		
		final String UPLOAD_DIRECTORY = "/Users/Pavan/Downloads/ServletFileUploadDemo-master";
		if(ServletFileUpload.isMultipartContent(request)){
			try {
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
                for(FileItem item : multiparts){
                    if(!item.isFormField()){
                    	File fileSaveDir = new File(UPLOAD_DIRECTORY);
                    	if (!fileSaveDir.exists()) {
                    		fileSaveDir.mkdir();
                    	}
                        String name = new File(item.getName()).getName();
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                }
			} catch (Exception e) {
				// exception handling
			}
			
			PrintWriter out = response.getWriter();
			out.print("{\"status\":1}");
		}
	}

}
