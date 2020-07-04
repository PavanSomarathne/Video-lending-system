package com.servlets;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.service.*;

/**
 * Servlet implementation class subscribeServ
 */
public class subscribeServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public subscribeServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String subPlan=request.getParameter("subPlan");
		String vidId=request.getParameter("vidId");
		
		HttpSession s1=request.getSession();
		String user=s1.getAttribute("cUserName").toString();
		
		subDAO sub1=new subDAO();
		
		if(sub1.subVideo(vidId, user,subPlan)) {
			response.sendRedirect("subscribed.jsp");
			
		}
		else {
			String st="Something went wrong!";
			request.setAttribute("subValid", st);
			request.getRequestDispatcher("payment.jsp").forward(request, response);
		}
	
		
		
	}

}
