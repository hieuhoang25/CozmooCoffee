package com.poly.servlet;

import com.poly.dao.Mail;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Set;
import java.util.StringJoiner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

import com.poly.dao.UserDao;
import com.poly.entity.User;
import java.io.File;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = request.getRequestURI();
		if (path.endsWith("/RegisterServlet")) {
			request.getRequestDispatcher("/Login/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Register(request, response);
//		String path = request.getServletContext().getContextPath();
//		response.sendRedirect(path + "/Login/login");
	}

	private void Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		String url = request.getServletContext().getContextPath();
                User user = new User();
		System.out.println(url);
		try {
			UserDao udao = new UserDao();
			
			user.setHoTen(request.getParameter("Name"));
			user.setEmail(request.getParameter("Email"));
			user.setPhone(request.getParameter("Phone"));
			user.setPassword(request.getParameter("Password"));
			validate(user);
			udao.insertU(user);
		     Mail.sendEmail(user.getEmail(),  new File("null"), user.getHoTen());
			response.setHeader("success","yes");
		} catch (Exception e) {
//			writer
//			.println("<script type='text/javascript'>"
//					+ "alert('Ä�Äƒng kÃ½ thÃ nh cÃ´ng'); window.location.href ='" + url + "/Login/login';" 
//					+ "</script>");
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			Mail.sendEmail(user.getEmail(),  new File("null"), user.getHoTen());
			response.setHeader("error", "no");
			String mess = e.getMessage();
			
			writer.write(mess);
			writer.close();
			e.printStackTrace();
		}

	}
	
	private void validate(User u) {
		try {
			ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
			Validator validator = factory.getValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			if(constraintViolations.size() > 0) {
				StringJoiner joiner = new StringJoiner(
					      "<br>", " ", " ");
				constraintViolations.forEach(e -> joiner.add(e.getMessage()));
//				String s = constraintViolations.iterator().next().getMessage();
				String s = joiner.toString();
				System.out.println(s);
				throw new RuntimeException(s);
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
	}

}
