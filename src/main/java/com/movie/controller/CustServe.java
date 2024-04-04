package com.movie.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.movie.dao.BookingDaoImpl;
import com.movie.dao.CustomerDaoImpl;
import com.movie.pojo.Booking;
import com.movie.pojo.Customer;

/**
 * Servlet implementation class CustServe
 */
@WebServlet("/CustServe")
public class CustServe extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Customer c = new Customer();
	Customer c1 = new Customer();
	CustomerDaoImpl cimpl = new CustomerDaoImpl();
	List<Customer> cl = null;
	int custId;
	String firstName;
	String lastName;
	String emailId;
	String contact;
	String address;
	String password;
	boolean flag;
	RequestDispatcher rd;
	PrintWriter pw;
	HttpSession session;

	List<Booking> mytick;
	Booking b;
	BookingDaoImpl bimp = new BookingDaoImpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustServe() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String process = request.getParameter("process");

		session = request.getSession();
		if (process.equals("profile") && process != null) {
			emailId = (String) session.getAttribute("user");
			c = cimpl.showCustomerByEmailId(emailId);
			session.setAttribute("profile", c);
			response.sendRedirect("cust_profile.jsp");

		} else if (process.equals("allcust") && process != null) {
			cl = cimpl.showAllCustomers();
			if (cl.isEmpty() || cl == null) {
				request.setAttribute("msg", "Sorry No Customers Registered Yet...");
				rd = request.getRequestDispatcher("AllCust.jsp");
				rd.include(request, response);
			} else {
				session = request.getSession();
				session.setAttribute("cl", cl);
				rd = request.getRequestDispatcher("AllCust.jsp");
				rd.include(request, response);
			}

		} else if (process.equals("deleteC") && process != null) {
			custId = Integer.parseInt(request.getParameter("custId"));
			flag = cimpl.deleteCustomer(custId);
			if (flag) {
				Cookie[] cookies = request.getCookies();
				if (cookies != null) {
					for (Cookie cookie : cookies) {
						cookie.setMaxAge(0);

						response.addCookie(cookie);

					}
				}
				session.invalidate();
				rd = request.getRequestDispatcher("index.jsp");

				request.setAttribute("msg", "Profile Deleted Successfully...");
				rd.include(request, response);
			} else {
				rd = request.getRequestDispatcher("cust_profile.jsp");

				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);

			}
		}
		
else if (process.equals("mybook") && process!=null) {
			
			
			
			String email = (String) session.getAttribute("user");
			mytick = bimp.getMyBookings(email);
			
			if (mytick!=null) {
				session.setAttribute("mytick", mytick);
				
				 rd=request.getRequestDispatcher("tickets.jsp");
				 rd.include(request, response);
				 

			} else {
				
				rd = request.getRequestDispatcher("tickets.jsp");
				
				request.setAttribute("msg", "Currently You Haven't Booked Any Tickets...");
				rd.include(request, response);

			}
		}
  
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String process = request.getParameter("process");
		if (process.equals("addCust") && process != null) {
			rd = request.getRequestDispatcher("AddCustomer.jsp");

			firstName = request.getParameter("firstName");
			lastName = request.getParameter("lastName");
			emailId = request.getParameter("emailId");
			contact = request.getParameter("contact");
			address = request.getParameter("address");
			password = request.getParameter("password");

			c.setAddress(address);
			c.setContact(contact);
			c.setEmailId(emailId);
			c.setFirstName(firstName);
			c.setLastName(lastName);
			c.setPassword(password);
			flag = cimpl.addCustomer(c);
			if (flag) {
				request.setAttribute("msg", "You Are Registered Successfully...");
				rd.include(request, response);

			} else {
				request.setAttribute("msg", "Some Error Occured...");
				rd.include(request, response);
			}

		} else if (process.equals("updatecust") && process != null) {
			custId = Integer.parseInt(request.getParameter("custId"));
			firstName = request.getParameter("firstName");
			lastName = request.getParameter("lastName");
//			System.out.println(lastName);
			emailId = request.getParameter("emailId");
			password = request.getParameter("password");
			contact = request.getParameter("contact");
			address = request.getParameter("address");
			c.setAddress(address);
			c.setContact(contact);
			c.setCustId(custId);
			c.setEmailId(emailId);
			c.setFirstName(firstName);
			c.setLastName(lastName);
			c.setPassword(password);
			flag = cimpl.updateCustomer(c);

			if (flag) {
				c = cimpl.showCustomerById(custId);

				session.setAttribute("profile", c);
				request.setAttribute("msg", "Profile Updated Successfully...");
				rd = request.getRequestDispatcher("cust_profile.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("msg", "Some Error...");
				rd = request.getRequestDispatcher("cust_profile.jsp");
				rd.forward(request, response);

			}

		}

	}

}
