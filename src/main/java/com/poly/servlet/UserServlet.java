package com.poly.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;


import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.poly.dao.UserDao;
import com.poly.entity.User;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet({"/admin/users/add","/admin/users/find", "/admin/users/edit", "/admin/users/delete"})
public class UserServlet extends HttpServlet {
	UserDao udao =  new UserDao();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.contains("find")) {
			String id = request.getParameter("id");
			doGet_Find(id, request, response);
			System.out.println("Hello");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if(uri.contains("edit")) {
			doPost_edit(request, response);
		}else if(uri.contains("add")) {
			doPost_add(request, response);
		}else {
			doPost_delete(request, response);
		}
		
		
	}
	
	private void doPost_delete(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		System.out.println("inside do delete");
		String id = request.getParameter("deleted-id");
		System.out.println(id);
		try {
			udao.delete(User.class, Integer.parseInt(id));
			response.setHeader("success", "yes");
			writer.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	
	private void doPost_add(HttpServletRequest request, HttpServletResponse response) throws IOException { 
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		try {
			User u = getUser(request);
			System.out.println("map " + request.getParameterMap());
			System.out.println("edit u " + u);
			
			Integer id  = udao.insertU(u);

			response.setHeader("success", "yes");
			 writer.write(id.toString());
			 writer.close();
		}catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.setHeader("error", "no");
			String mess = e.getMessage();
			
			writer.write(mess);
			writer.close();
			e.printStackTrace();
		} 
		
	}
	
	private void doPost_edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		try {
			User u = getUser(request);
			System.out.println("map " + request.getParameterMap());
			System.out.println("edit u " + u);
			
			udao.updateU(u);
			Integer id = u.getUserId();
			
		    response.setHeader("success", "yes");
		    
		    writer.write(id.toString());
		    writer.close();
		} catch (Exception e) {
			response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
			response.setHeader("error", "no");
//			response.setContentType("text/html;charset=UTF-8");
			writer.write(e.getMessage());
			writer.close();
			e.printStackTrace();
		} 
	}
	
	private User getUser(HttpServletRequest request) throws Exception {
		User u = new User();
			BeanUtils.populate(u, request.getParameterMap());
			String com = request.getParameter("c-password");
			System.out.println("get user : " + u);
			validate(u, com);
			return u;
	}
	
	private void validate(User u, String comfirm) {
		try {
			ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
			Validator validator = factory.getValidator();
			Set<ConstraintViolation<User>> constraintViolations = validator.validate(u);
			if(constraintViolations.size() > 0) {
				String s = constraintViolations.iterator().next().getMessage();
				throw new RuntimeException(s);
			}else if(!u.getPassword().equals(comfirm)) {
				throw new RuntimeException("Xác nhận mật khẩu không trùng khớp");
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
		
	}
	
	private void doGet_Find(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("call do find");
		Integer idn = Integer.parseInt(id);
		User u = udao.findById(User.class, idn);
		System.out.println("u " + u);
		response.setCharacterEncoding("utf-8");
		try {
			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
			
			String r =  gson.toJson(u);

			response.getWriter().write(r);
		} catch (Exception e) {
			System.out.println(e.getMessage());	
		}

		

	}
	
	
	


}
