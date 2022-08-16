package com.poly.servlet;

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.dao.DanhMucDao;
import com.poly.dao.SanPhamDao;
import com.poly.entity.DanhMuc;

import org.codehaus.jackson.map.ObjectMapper;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.poly.dao.DanhMucDao;
import com.poly.dao.DonHangDao;
import com.poly.dao.SanPhamDao;
import com.poly.entity.DanhMuc;
import com.poly.entity.DonHang;

import com.poly.entity.SanPham;

import antlr.CharQueue;

import com.poly.dao.UserDao;
import com.poly.entity.User;

/**
 * Servlet implementation class AdminServlert
 */
@MultipartConfig
@WebServlet({ "/admin", "/admin/users", "/admin/noti", "/admin/dashboard", "/admin/product", "/admin/profile",
		"/admin/edit", "/admin/delete", "/admin/update", "/admin/insert", "/admin/hoadon" })

public class AdminServlet extends HttpServlet {
	UserDao udao = new UserDao();
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String uri = request.getRequestURI();
		fillProductForAD(request, response);
		fillDanhMuc(request, response);

		if (uri.endsWith("users")) {
			doGet_UserList(request, response);

			request.getRequestDispatcher("/admin/view/user.jsp").forward(request, response);
		} else if (uri.contains("product")) {
			fillDanhMuc(request, response);
			fillProductForAD(request, response);
			request.getRequestDispatcher("/admin/view/product.jsp").forward(request, response);
		} else if (uri.contains("profile")) {
			request.getRequestDispatcher("/admin/view/user_profile.jsp").forward(request, response);
		} else if (uri.contains("noti")) {
			request.getRequestDispatcher("/admin/view/notifications.jsp").forward(request, response);
		} else if (uri.contains("edit")) {
			editProduct(request, response);

			request.getRequestDispatcher("/admin/view/product.jsp").forward(request, response);

			return;

		} else if (uri.contains("delete")) {
			deleteProduct(request, response);
			fillProductForAD(request, response);
			request.getRequestDispatcher("/admin/view/product.jsp").forward(request, response);
		} else if (uri.contains("update")) {
			updateProduct(request, response);
			fillProductForAD(request, response);
			request.getRequestDispatcher("/admin/view/product.jsp").forward(request, response);
		} else if (uri.contains("insert")) {
			insertProduct(request, response);
			fillProductForAD(request, response);
			request.getRequestDispatcher("/admin/view/product.jsp").forward(request, response);

		} else if (uri.contains("hoadon")) {
			fillDonHang(request, response);
			request.getRequestDispatcher("/admin/view/hoadon.jsp").forward(request, response);
		} else
			request.getRequestDispatcher("/admin/view/dashboard.jsp").forward(request, response);

	}

	private void doGet_UserList(HttpServletRequest request, HttpServletResponse response) {
		List<User> list = udao.findAll(User.class);
		System.out.println("user list " + list);
		request.setAttribute("userList", list);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void fillProductForAD(HttpServletRequest request, HttpServletResponse response) {
		SanPhamDao dao = new SanPhamDao();
		List<SanPham> listsp = dao.findAll(SanPham.class);
		request.setAttribute("sanpham", listsp);
	}

	public void fillDanhMuc(HttpServletRequest request, HttpServletResponse response) {
		DanhMucDao dao = new DanhMucDao();
		List<DanhMuc> list = dao.findAll(DanhMuc.class);
		request.setAttribute("danhmuc", list);

	}

	public void editProduct(HttpServletRequest request, HttpServletResponse response) {

		try {

			response.setContentType("text/html;charset=UTF-8");
			int masp = Integer.parseInt(request.getParameter("MaSP"));

			SanPhamDao daosp = new SanPhamDao();
			SanPham sp = new SanPham();
			sp = daosp.findById(SanPham.class, masp);
			if (sp.getHINH() == null) {
				sp.setHINH("food_sample.png");
			}
			BeanUtils.populate(sp, request.getParameterMap());

			request.setAttribute("sp", sp);

			Gson gson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create();
			PrintWriter out = response.getWriter();
			out.print(gson.toJson(sp));

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
		Integer masp = Integer.parseInt(request.getParameter("MaSP"));
		SanPhamDao daosp = new SanPhamDao();
		daosp.delete(SanPham.class, masp);
	}

	public void updateProduct(HttpServletRequest request, HttpServletResponse response) {
		try {
			SanPhamDao daosp = new SanPhamDao();
			SanPham sp = new SanPham();
			DanhMucDao dmdao = new DanhMucDao();
			String madm = request.getParameter("object-name");
			DanhMuc dm = dmdao.findById(DanhMuc.class, madm);
			sp.setMaSP(Integer.parseInt(request.getParameter("MaSP")));
			sp.setDanhmuc(dm);
			sp.setTENSP(request.getParameter("TENSP"));
			sp.setGiamGia(Integer.parseInt(request.getParameter("GiamGia")));
			sp.setGIASP(Float.parseFloat(request.getParameter("GIASP")));
			sp.setMoTa(request.getParameter("MoTa"));
			sp.setHINH(savefile(request, "fileIMG", "/img/product"));
			daosp.update(sp);

			request.setAttribute("message", "Cập nhật thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Cập nhật thất bại");
		}

	}

	public void insertProduct(HttpServletRequest request, HttpServletResponse response) {
		try {
			SanPhamDao daosp = new SanPhamDao();
			SanPham sp = new SanPham();
			DanhMucDao dmdao = new DanhMucDao();
			String madm = request.getParameter("object-name");
			DanhMuc dm = dmdao.findById(DanhMuc.class, madm);
			BeanUtils.populate(sp, request.getParameterMap());
			sp.setDanhmuc(dm);
			sp.setGiamGia(Integer.parseInt(request.getParameter("GiamGia")));
			daosp.insert(sp);
			request.setAttribute("message", "Thêm sản phẩm thành công");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Thêm sản phẩm thất bại! Vui lòng kiểm tra lại");
		}

	}

	public void fillDonHang(HttpServletRequest request, HttpServletResponse response) {
		DonHangDao dao = new DonHangDao();
		// DonHang dh = new DonHang();
		List<DonHang> list = dao.findAllDH();
		request.setAttribute("donhang", list);

	}

//	public void uploadIMG(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		Part photo = request.getPart("fileIMG");
//		String realPath = request.getServletContext().getRealPath("/img/product");
//		String filename = Path.of(photo.getSubmittedFileName()).getFileName().toString();
//		photo.write(realPath+"/"+filename);
//		System.out.println("<<<<"+photo.toString());
//		
//	}

	public String savefile(HttpServletRequest request, String filePart, String folder) {
		File dir = new File(request.getServletContext().getRealPath(folder));
		if (!dir.exists()) {
			dir.mkdirs();
		}
		try {
			Part part = request.getPart(filePart);
			if (part != null && part.getSize() > 0) {
				File file = new File(dir, part.getSubmittedFileName());
				part.write(file.getAbsolutePath());
				// System.out.println("<<<<" + part.getSubmittedFileName());
				return part.getSubmittedFileName();
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Thêm hình ảnh thất bại, vui lòng kiểm tra lại");
		}
		return null;
	}

}
