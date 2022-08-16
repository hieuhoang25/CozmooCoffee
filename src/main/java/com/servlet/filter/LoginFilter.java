package com.servlet.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nimbusds.oauth2.sdk.Request;
import com.poly.entity.User;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter({"/Login/*","/login"})
public class LoginFilter extends HttpFilter implements Filter {

    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		String path = request.getServletContext().getContextPath();  
		
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		
		// pass the request along the filter chain
		User u = (User) req.getSession().getAttribute("account");
		
		if(u != null) {
			res.sendRedirect(redirectAsRole(req, u));
			return;
		}else {
			chain.doFilter(request, response);
//			if(req.getRequestURI().endsWith("/login")) {
//		
//				res.sendRedirect(path + "/Login/login");
//				return;
//			}else {
//				
			}
			
		}

		
	
	
	
	private String redirectAsRole(HttpServletRequest request, User u) {
		String path = request.getServletContext().getContextPath();
		String  page = "/admin";
		if(!u.isRole()) {
			page = "/index";
		 }
		return path + page;
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
