package com.servlets;
import com.service.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.deploy.net.HttpResponse;


/**
 * Servlet implementation class deleteVideos
 */
public class deleteVideos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteVideos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vId= request.getParameter("vidId");
		videoDAO d1=new videoDAO();
		if(d1.deleteVideos(vId)){
			//response.sendRedirect(".jsp");
			response.sendRedirect(request.getHeader("referer"));
		}else {
			System.out.println("Something went wrong");
		}
	}

}
