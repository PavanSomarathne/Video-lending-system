package com.servlets;
import com.service.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class deleteSubscription
 */
public class deleteSubscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteSubscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String vId= request.getParameter("vidId");
		HttpSession s1=request.getSession();
		String user=s1.getAttribute("cUserName").toString();
		
		subDAO d1=new subDAO();
		if(d1.deleteSubscription(vId,user)) {
			response.sendRedirect("subscribed.jsp");
		}else {
			System.out.println("Something went wrong");
		}
	
	}

}
