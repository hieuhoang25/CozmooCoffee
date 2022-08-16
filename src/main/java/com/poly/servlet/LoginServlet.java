package com.poly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.poly.dao.UserDao;
import com.poly.entity.Oder;
import com.poly.entity.SanPham;
import com.poly.entity.User;

/**
 * Servlet implementation class LoginServler
 */
@WebServlet({"/Login/login","/login"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if(uri.endsWith("/login")) {
			request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDao udao = new UserDao();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		
		String name = request.getParameter("user");
		String pass = request.getParameter("pass");
		String path = request.getServletContext().getContextPath();
		User u = udao.findByEmail(name);
		
		if(u != null) {
			if(u.getPassword().equals(pass)) {
				setLoggedAccount(request, u);
				response.setHeader("success", u.isRole()? "1" : "0");
			}else {
				System.out.println("error pass");
				response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
				response.setHeader("error", "-1");
			}
		}else {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.setHeader("error", "-2");
		}
	}
	
	private String redirectAsRole(User u) {
		String  page = "/admin";
		if(!u.isRole()) {
			page = "/index";
		 }
		return page;
	}
	
	private void setLoggedAccount(HttpServletRequest request, User account) {
		request.getSession().setAttribute("account", account );
		request.getSession().setAttribute("cart",account.cartOfUser());
	}

}
