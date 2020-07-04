package com.servlets;
import com.model.*;
import com.service.*;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;

/**
 * Servlet implementation class loginServ
 */

public class loginServ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServ() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String logReg = request.getParameter("Submit");
			if (logReg.equals("Login")) {

				UserBean user = new UserBean();
				user.setUserName(request.getParameter("un"));
				user.setPassword(request.getParameter("pw"));
				user = UserDAO.login(user);

				String u1 = request.getParameter("un");

				// String u2 = UserDAO.getFirstName(u1);

				if (user.isValid()) {

					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					session.setAttribute("cUserName",u1);
					response.sendRedirect("index.jsp"); // logged-in page
				}

				else
					response.sendRedirect("login.jsp"); // error page
			} else if (logReg.equals("Register")) {
				UserBean user = new UserBean();
				UserDAO ud1=new UserDAO();
				String uName=request.getParameter("un");
				user.setUserName(request.getParameter("un"));
				user.setPassword(request.getParameter("pw"));
				user.setFirstName(request.getParameter("fName"));
				user.setLastName(request.getParameter("lName"));
				if(ud1.getUser(uName).isEmpty()){
					user = UserDAO.Register(user);

					String u1 = request.getParameter("un");

					HttpSession session = request.getSession(true);
					session.setAttribute("currentSessionUser", user);
					session.setAttribute("cUserName", u1);

					response.sendRedirect("index.jsp");
				}else {
					String s1="User name is allready exist";
					request.setAttribute("userInvalid", s1);
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				

			} else  {
				
				HttpSession session = request.getSession();

				session.invalidate();
				
				response.sendRedirect("index.jsp");
			}
		}

		catch (Throwable theException) {
			System.out.println(theException);
		}

	}

}
