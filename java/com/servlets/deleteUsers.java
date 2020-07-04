package com.servlets;
import com.service.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class deleteUsers
 */
public class deleteUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vId= request.getParameter("userId");
		UserDAO d1=new UserDAO();
		if(d1.deleteUsers(vId)) {
			response.sendRedirect("admin_users.jsp");
		}else {
			System.out.println("Something went wrong");
		}
	}

}
