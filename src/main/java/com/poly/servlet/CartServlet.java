package com.poly.servlet;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.poly.dao.GioHangDao;
import com.poly.dao.GioHang_CTDao;
import com.poly.dao.HoaDonChiTietDao;
import com.poly.dao.HoaDonDao;
import com.poly.dao.Mail;
import com.poly.dao.SanPhamDao;
import com.poly.entity.CartOfUser;
import com.poly.entity.GioHang;
import com.poly.entity.GioHang_CT;
import com.poly.entity.HoaDon;
import com.poly.entity.HoaDon_ChiTiet;
import com.poly.entity.SanPham;
import com.poly.entity.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet({ "/addcart", "/quality", "/removeitemcart","/placeorder","/addproductquality" })

public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		User u = (User) request.getSession().getAttribute("account");
		String uri = request.getRequestURI();
		if (uri.contains("addcart")) {
			Integer id = Integer.parseInt(request.getParameter("masp"));
			SanPhamDao dao = new SanPhamDao();
			SanPham sp = dao.findById(SanPham.class, id);
			List<CartOfUser> list = (List<CartOfUser>) request.getSession().getAttribute("cart");

			if (list.size() == 0) {
				CartOfUser cart = new CartOfUser(sp.getMaSP(), sp.getTENSP(), sp.getGIASP(), 1,
						(sp.getGIASP() - (sp.getGiamGia() * sp.getGIASP()) / 100), sp.getHINH(), sp.getGiamGia()) ;
				list.add(cart);
				addCartToDB(sp,u);
				
			} else {
				CartOfUser cou = null;
				for (CartOfUser cart : list) {
					if (cart.getMaSP() == sp.getMaSP()) {
						cou = cart;
					}
				}
				if (cou == null) {
					CartOfUser cart = new CartOfUser(sp.getMaSP(), sp.getTENSP(), sp.getGIASP(), 1,
							(sp.getGIASP() - (sp.getGiamGia() * sp.getGIASP()) / 100), sp.getHINH(), sp.getGiamGia()) ;
					list.add(cart);
					addCartToDB(sp,u);
				} else {
					int sl = cou.getSoLuong() + 1;
					cou.setSoLuong(sl);
					updateSoLuongItem(sp,u, sl);
				}
			}
			float tt = 0;
			// update thành tiền
			for (CartOfUser cartOfUser : list) {
				cartOfUser.setThanhTien((cartOfUser.getGiaSP() - cartOfUser.getGiamGia() * cartOfUser.getGiaSP() / 100)
						* cartOfUser.getSoLuong());
				tt += cartOfUser.getThanhTien();
			}
			// lưu lại vào session
			request.getSession().removeAttribute("cart");
			request.getSession().setAttribute("cart", list);
			List<Object> values = new ArrayList<>();
			values.add(list.size());
			values.add(tt);
			response.getWriter().print(values);
		} else if (uri.contains("quality")) {
			Integer id = Integer.parseInt(request.getParameter("masp"));
			Integer quality = Integer.parseInt(request.getParameter("soluong"));
			SanPhamDao dao = new SanPhamDao();
			SanPham sp = dao.findById(SanPham.class, id);
			updateSoLuongItem(sp, u, quality);
			List<CartOfUser> list = (List<CartOfUser>) request.getSession().getAttribute("cart");
			float thanhtien = 0;
			for (CartOfUser cart : list) {
				if (cart.getMaSP() == sp.getMaSP()) {
					cart.setSoLuong(quality);
					cart.setThanhTien(
							(cart.getGiaSP() - cart.getGiamGia() * cart.getGiaSP() / 100) * cart.getSoLuong());
					thanhtien = cart.getThanhTien();
					break;
				}
			}
			float tt = 0;
			// update thành tiền
			for (CartOfUser cartOfUser : list) {
				tt += cartOfUser.getThanhTien();
			}
			request.getSession().removeAttribute("cart");
			request.getSession().setAttribute("cart", list);
			List<Object> values = new ArrayList<>();

			values.add(thanhtien);
			values.add(tt);
			Gson gson = new Gson();
			response.getWriter().print(gson.toJson(values));
		} else if (uri.contains("removeitemcart")) {
			Integer id = Integer.parseInt(request.getParameter("masp"));
			SanPhamDao dao = new SanPhamDao();
			SanPham sp = dao.findById(SanPham.class, id);
			removeItemCart(sp,u);
			List<CartOfUser> list = (List<CartOfUser>) request.getSession().getAttribute("cart");
			for (CartOfUser cart : list) {
				if (cart.getMaSP() == sp.getMaSP()) {
					list.remove(cart);
					break;
				}
			}
			float tt = 0;
			// update thành tiền
			for (CartOfUser cartOfUser : list) {
				tt += cartOfUser.getThanhTien();
			}
			request.getSession().removeAttribute("cart");
			request.getSession().setAttribute("cart", list);
			List<Object> values = new ArrayList<>();
			values.add(list.size());
			values.add(tt);
			Gson gson = new Gson();
			response.getWriter().print(gson.toJson(values));
		}

		else if (uri.contains("addproductquality")) {
			Integer id = Integer.parseInt(request.getParameter("masp"));
			Integer quality = Integer.parseInt(request.getParameter("soluong"));
			response.getWriter().print(id +"-"+ quality);
		}


	}

	private void removeItemCart(SanPham sp, User u) {
		// TODO Auto-generated method stub
		GioHangDao dao = new GioHangDao();
		GioHang gh = dao.userHaveCart(u);
		GioHang_CTDao ctdao = new GioHang_CTDao();
		GioHang_CT ct = ctdao.getGiohangCT(gh, sp);
		ctdao.delete(GioHang_CT.class, ct.getIDChiTiet());
	}

	private void updateSoLuongItem(SanPham sp,User user, int sl) {
		// TODO Auto-generated method stub
		GioHangDao dao = new GioHangDao();
		GioHang gh = dao.userHaveCart(user);
		GioHang_CTDao ctdao = new GioHang_CTDao();
		GioHang_CT ct = ctdao.getGiohangCT(gh, sp);
		ct.setSoLuong(sl);
		ctdao.update(ct);
	}

	private void addCartToDB(SanPham sp, User user) {
		// TODO Auto-generated method stub
		GioHangDao dao = new GioHangDao();
		GioHang gh = dao.userHaveCart(user);
		if (gh != null) {
			GioHang_CT ct = new GioHang_CT();
			GioHang_CTDao ctdao = new GioHang_CTDao();
			ct.setSoLuong(1);
			ct.setGiohang(gh);
			ct.setSanpham(sp);
			ctdao.insert(ct);
		}
		else {
			GioHang ghnew = new GioHang();
			ghnew.setBuyer(user);
			dao.insert(ghnew);
			GioHang_CT ct = new GioHang_CT();
			GioHang_CTDao ctdao = new GioHang_CTDao();
			ct.setSoLuong(1);
			ct.setGiohang(ghnew);
			ct.setSanpham(sp);
			ctdao.insert(ct);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uri = request.getRequestURI();
		if (uri.contains("placeorder")) {
			String diachi = request.getParameter("diachi");
			String phone  = request.getParameter("phone");
			String email = request.getParameter("email");
			User u = (User) request.getSession().getAttribute("account");
			List<CartOfUser> list = (List<CartOfUser>) request.getSession().getAttribute("cart");
			float tt = 0;
			// update thành tiền
			for (CartOfUser cartOfUser : list) {
				tt += cartOfUser.getThanhTien();
			}
			HoaDonDao hddao = new HoaDonDao();
			HoaDonChiTietDao hdctdao = new HoaDonChiTietDao();
			HoaDon hd = new HoaDon();
			hd.setDiaChi(diachi);
			hd.setPhone(phone);
			hd.setNgayTao(new Date());
			hd.setThanhTien(tt);
			hd.setUserHD(u);
			hddao.insert(hd);
			//
			GioHangDao ghdao = new GioHangDao();
			GioHang gh = ghdao.userHaveCart(u);
			
			for (CartOfUser cartOfUser : list) {
				SanPhamDao spdao = new SanPhamDao();
				SanPham sp = spdao.findById(SanPham.class, cartOfUser.getMaSP());
				HoaDon_ChiTiet hdct = new HoaDon_ChiTiet();
				hdct.setMaSP(sp);
				hdct.setMaHD(hd);
				hdct.setSoLuong(cartOfUser.getSoLuong());
				hdctdao.insert(hdct);
				GioHang_CTDao ghctdao = new GioHang_CTDao();
				GioHang_CT ghct = ghctdao.getGiohangCT(gh, sp);
				ghctdao.delete(GioHang_CT.class, ghct.getIDChiTiet());
			}
			DecimalFormat df = new DecimalFormat("#,###.# VND");
			// gửi mail 
			Mail.sendOrder(email,  new File("null"), "Đơn hàng của bạn: "+ hd.getIDHD()+"\nTổng tiền thanh toán: "+df.format(tt)+"\nHình thức thanh toán: tiền mặt"+"\nVui lòng chuẩn bị tiền mặt thanh toán");
			// xoa database;
			
			// xoa seesion
			request.getSession().removeAttribute("cart");
			request.getSession().setAttribute("cart", u.cartOfUser());
			String path = request.getServletContext().getContextPath();
		
			response.sendRedirect(path+"/index");
			
		}
	}

}
