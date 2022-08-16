package com.poly.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;


import com.poly.dao.DanhMucDao;
import com.poly.dao.SanPhamDao;

import com.poly.dao.YeuThichDao;

import com.poly.entity.DanhMuc;

import com.poly.entity.Others;
import com.poly.entity.SanPham;
import com.poly.entity.ThongKe;
import com.poly.entity.ThongKeTheoDoanhThuThang;
import com.poly.entity.User;
import com.poly.entity.YeuThich;
import com.poly.utils.JPAUtils;
import javax.persistence.StoredProcedureQuery;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Test
 */
@WebServlet({ "/index", "/manager", "/sanphamdetail", "/likesanpham","/shoping-cart" ,"/productdetail","/checkout"})
public class Servlet extends HttpServlet {
	private static Integer size = 3;
    private static final long serialVersionUID = 1L;
    private static EntityManager em = JPAUtils.getEntityManager();
    HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
        session = request.getSession();
        thongKeTheoSP();
        thongKeTheoDoanhThuThang();
        String path = request.getServletContext().getContextPath();
        findAllDanhMuc(request, response);
        fillHotProduct(request, response);
        fillNewProduct(request, response);
        fillListProduct(request, response);
        discountPr();

        String uri = request.getRequestURI();

        if (uri.endsWith("index")) {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
        if (uri.contains("sanphamdetail")) {
            sanphamdetail(request, response);
        } else if (uri.contains("shop-grid.jsp")) {
            session.removeAttribute("productdetail");
            session.removeAttribute("fulllistpr");
            session.setAttribute("fulllistpr", session.getAttribute("NewProduct"));
        } else if (uri.contains("likesanpham")) {
            likeSanPham(request, response);
        } else if (uri.contains("productdetail")) {
        	
        	String url = (request.getRequestURI() + "?" + request.getQueryString()).replaceAll("&p=\\d+", "");
        	
        	System.out.println("url " + url);
        	
        	String page = request.getParameter("p");
        	int pg = page == null? 1 : Integer.parseInt(page);
            String idDanhMuc = request.getParameter("idDanhMuc");
            Query query = em.createNamedQuery("SanPham.productdetail");
            query.setParameter(1, idDanhMuc);
            
            //
            query.setFirstResult((pg -1) * size);
        	query.setMaxResults(size);
        	int total = getTotalSP(idDanhMuc);
        	//
            List<SanPham> list = query.getResultList();
            session.setAttribute("productdetail", list);
            //
            request.setAttribute("curl", "" +url);
            request.setAttribute("ttp", "" + total);
            int c = ((pg - 1) * size ) + 1;
            int last = (pg * size) > total? total : (pg * size);
            request.setAttribute("thepage", "" +  page);
            request.setAttribute("cnp", "" +  c);
            request.setAttribute("lp", "" +  last);
            request.setAttribute("pagenum", "" + getpageNum(total));
            request.getRequestDispatcher("/shop-grid.jsp").forward(request, response);
        }
        if(uri.contains("shoping-cart")) {
			request.getRequestDispatcher("/shoping-cart.jsp").forward(request, response);
		}
        else if(uri.contains("checkout")) {
			request.getRequestDispatcher("/checkout.jsp").forward(request, response);
		}
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    public void sanphamdetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("UTF-8");
    	
    	
    	Integer MaSP = Integer.parseInt(request.getParameter("MaSP"));
        User u = (User) request.getSession().getAttribute("account");
        SanPhamDao dao = new SanPhamDao();
        SanPham sp = dao.findById(SanPham.class, MaSP);
        if (u==null) {
        	 DanhMuc dm = sp.getDanhmuc();
             List<SanPham> list = dm.getListSP();
             request.setAttribute("sanpham", sp);
             request.setAttribute("rp", list);
             request.getRequestDispatcher("/shop-details.jsp").forward(request, response);
        }
        else {
            YeuThichDao likedao = new YeuThichDao();
            YeuThich like = likedao.findById(MaSP, u.getUserId());
            boolean kt = false;
            if (like == null) {
                kt = false;
            } else {
                kt = true;
            }
            DanhMuc dm = sp.getDanhmuc();
            List<SanPham> list = dm.getListSP();
            request.setAttribute("sanpham", sp);
            request.setAttribute("rp", list);
            request.setAttribute("kt", kt);
            request.getRequestDispatcher("/shop-details.jsp").forward(request, response);
        }


    }

    public void likeSanPham(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer MaSP = Integer.parseInt(request.getParameter("MaSP"));
        User u = (User) request.getSession().getAttribute("account");
        SanPhamDao dao = new SanPhamDao();
        SanPham sp = dao.findById(SanPham.class, MaSP);
        YeuThichDao likedao = new YeuThichDao();
        YeuThich like = likedao.findById(MaSP, u.getUserId());
        boolean kt = false;
        if (like != null) {
            likedao.delete(YeuThich.class, like.getYeuThichID());
            kt = false;
        } else {
            like = new YeuThich();
            like.setSanpham(sp);
            like.setUser(u);
            likedao.insert(like);
            kt = true;
        }
        DanhMuc dm = sp.getDanhmuc();
        List<SanPham> list = dm.getListSP();
        request.setAttribute("sanpham", sp);
        request.setAttribute("rp", list);
        request.setAttribute("kt", kt);
        request.getRequestDispatcher("/shop-details.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // checkLogin(request, response);
    }

    public void findAllDanhMuc(HttpServletRequest request, HttpServletResponse response) {
        try {
            DanhMucDao dao = new DanhMucDao();
            List<DanhMuc> list = dao.findAll(DanhMuc.class);
            DanhMuc dm = new DanhMuc();
            BeanUtils.populate(dm, request.getParameterMap());
            session.setAttribute("danhmucs", list);
//			request.setAttribute("danhmucs", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void fillHotProduct(HttpServletRequest request, HttpServletResponse response) {
        Query query = em.createNamedQuery("Others.NoiBat");
        List<Others> list = query.getResultList();
        session.setAttribute("hotproduct", list);

    }

    public void fillNewProduct(HttpServletRequest request, HttpServletResponse response) {
        Query query = em.createNamedQuery("SanPham.NewProduct");
        List<SanPham> list = query.getResultList();
        session.setAttribute("NewProduct", list);
    }

    public void fillListProduct(HttpServletRequest request, HttpServletResponse response) {
        Query query = em.createNamedQuery("ListProduct");
        List<DanhMuc> list = query.getResultList();
        session.setAttribute("listpr", list);
//		request.setAttribute("listpr", list);
    }

    public void discountPr() {
        Query query = em.createNamedQuery("Others.productdiscount");
        List<Others> list = query.getResultList();
        session.setAttribute("discountproduct", list);
    }

    public void thongKeTheoSP() {
        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("ThongKe.ThongKeTheoSP");
        List<ThongKe> s = query.getResultList();
        session.setAttribute("food", s.get(0).getFood());
        session.setAttribute("drink", s.get(0).getDrink());

    }

    public void thongKeTheoDoanhThuThang() {

        StoredProcedureQuery query = em.createNamedStoredProcedureQuery("TK.ThongKeTheoDoanhThuThang");
        List<ThongKeTheoDoanhThuThang> list = query.getResultList();

        session.setAttribute("month", list);
        for(ThongKeTheoDoanhThuThang tk : list){
            System.out.println(tk.getTien());
        }

    }
    
    private int getpageNum(int total) {
    	System.out.println("list sp of dc " + total);
		System.out.println("dao.size "  + total);
		int p =(int) Math.ceil(total / (size * 1.0));;
		System.out.println("pagenum " + p);
		return p;
	}
    
    private int getTotalSP(String idDanhMuc) {
    	DanhMucDao dmdao = new DanhMucDao();
    	DanhMuc d = dmdao.findById(DanhMuc.class, idDanhMuc);
    	int total = d.getListSP().size();
    	return total;
    }
}
