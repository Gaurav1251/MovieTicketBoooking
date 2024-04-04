package com.movie.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dao.CustomerDaoImpl;
import com.movie.dao.logindaoimpl;
import com.movie.pojo.Customer;

/**
 * Servlet implementation class Login_Serve
 */
@WebServlet("/Login_Serve")
public class Login_Serve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       logindaoimpl log;
       RequestDispatcher rd;
       String process;
       String username;
       String password;
       HttpSession session;
       Customer c;
       Cookie ck,ck1;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Serve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 process=request.getParameter("process");
		 session=request.getSession();
		if (process.equals("logout") && process!=null) {
			Cookie[] cookies = request.getCookies();
			if(cookies!=null) {
			for (Cookie cookie : cookies) {
			cookie.setMaxAge(0);
			
			
			
			
			response.addCookie(cookie);
			
			
			}}
			session.invalidate();
			rd=request.getRequestDispatcher("index.jsp");
			
			request.setAttribute("msg", "You are Logged out Successfully...");
			rd.include(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 process=request.getParameter("process");
		 username=request.getParameter("username");
		 password=request.getParameter("password");
		 session=request.getSession();
		if (process.equals("login") && process!=null) {
			log=new logindaoimpl();
			
			if(log.checkAdmin(username, password)) {
				session.setAttribute("Admin", username);
				
				 ck=new Cookie("Admin", username); 
				 ck.setMaxAge(60*60);
				 
				 ck1=new Cookie("A_pass", password);
				 ck1.setMaxAge(60*60);
				 response.addCookie(ck);
				 response.addCookie(ck1);
					
				rd=request.getRequestDispatcher("index.jsp");
				
				request.setAttribute("msg", "You are logged in as Admin");
				rd.include(request, response);
				
			}
			else if(log.checkCustmor(username, password)){
				c=new CustomerDaoImpl().showCustomerByEmailId(username);
				session.setAttribute("user", username);
				
				  ck=new Cookie("Customer", c.getFirstName()); ck.setMaxAge(60*60);
				  ck1=new Cookie("A_pass", password);
					 ck1.setMaxAge(60*60);
				 response.addCookie(ck);
				 response.addCookie(ck1);
				rd=request.getRequestDispatcher("index.jsp");
				request.setAttribute("msg", "You are logged in as "+c.getFirstName() +" "+c.getLastName());
				rd.include(request, response);
			}
			else {
				rd=request.getRequestDispatcher("login.jsp");
				request.setAttribute("msg", "Invalid Credentials...");
				rd.include(request, response);
				
			}
			
		}
	}

}
