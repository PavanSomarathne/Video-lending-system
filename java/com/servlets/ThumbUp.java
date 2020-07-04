package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class upl
 */
public class ThumbUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThumbUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		final String UPLOAD_DIRECTORY = "/Users/Pavan/eclipse-workspace/updemo/src/main/webapp/Output/Thumbs";
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
                        
                       HttpSession s1=request.getSession();
                    	String str=s1.getAttribute("currentVidId").toString();
                    	
                    	//String name = new File(item.getName()).getName();
                    	String name = str+".thumb.jpg";
                        item.write( new File(UPLOAD_DIRECTORY + File.separator +name));
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
