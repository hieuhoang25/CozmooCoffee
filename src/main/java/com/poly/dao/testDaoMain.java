package com.poly.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.poly.entity.CartOfUser;
import com.poly.entity.DanhMuc;
import com.poly.entity.DonHang;


public class testDaoMain {
	public static void main(String[] args) {
		DonHangDao dao = new DonHangDao();
		List<DonHang> list = dao.findAllDH();
		list.forEach(c->System.out.println(c.getTenSP()));
	}
	
}
