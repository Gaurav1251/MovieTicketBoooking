package com.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.util.DBConnectivity;

/**
 * Servlet implementation class log_sign
 */
@WebServlet("/log_sign")
public class log_sign extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection connection = DBConnectivity.getConnection();
	PreparedStatement pst;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public log_sign() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String p=request.getParameter("p");
		if(p.equals("log") && p!=null) {
		HttpSession session=request.getSession(false);
		
		
			
			Cookie[] cookies = request.getCookies();
			if(cookies!=null) {
			for (Cookie cookie : cookies) {
			cookie.setMaxAge(0);
			
			
			
			
			response.addCookie(cookie);
			
			
			}}
			session.invalidate();
		
		
		response.sendRedirect("home.jsp");}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String user = request.getParameter("user");
		String pass = request.getParameter("pass");
		
		try {
			pst = connection.prepareStatement("select * from Admin where A_user=? AND A_pass=?");
			pst.setString(1, user);
			pst.setString(2, pass);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				HttpSession session = request.getSession();
				Cookie cookie = new Cookie("user", user);
				Cookie cookie1 = new Cookie("pass", pass);
				cookie.setMaxAge(60 * 60 );
				cookie1.setMaxAge(60 * 60);
				response.addCookie(cookie1);
				response.addCookie(cookie);
				session.setAttribute("user", user);
				session.setAttribute("pass", pass);
				session.setMaxInactiveInterval(60*60);
				
				response.sendRedirect("dash.jsp");
			} else {
				response.sendRedirect("home.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
