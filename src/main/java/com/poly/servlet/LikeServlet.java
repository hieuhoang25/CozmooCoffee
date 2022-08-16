package com.poly.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.poly.dao.SanPhamDao;
import com.poly.dao.YeuThichDao;
import com.poly.entity.DanhMuc;
import com.poly.entity.SanPham;
import com.poly.entity.User;
import com.poly.entity.YeuThich;
import com.poly.utils.JPAUtils;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/likeproduct")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String txt =request.getParameter("txt");
		Integer MaSP = Integer.parseInt(txt);
		User u = (User) request.getSession().getAttribute("account");
		SanPhamDao dao = new SanPhamDao();
		SanPham sp = dao.findById(SanPham.class, MaSP);
		YeuThichDao likedao = new YeuThichDao();
		YeuThich like = likedao.findById(MaSP,u.getUserId());
		boolean kt = false;
		if (like!=null) {
			likedao.delete(YeuThich.class, like.getYeuThichID());
			kt = false;
		}
		else {
			like = new YeuThich();
			like.setSanpham(sp);
			like.setUser(u);
			likedao.insert(like);
			kt=true;
		}
		List<Integer> result = new ArrayList<Integer>();
		result.add(JPAUtils.getEntityManager().find(User.class, u.getUserId()).getYeuthichList().size());
		result.add(sp.getYeuthichList().size());
		result.add(kt ? 1:0);
		Gson gson = new Gson();
		response.getWriter().print(gson.toJson(result));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
