package com.poly.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.poly.entity.GioHang;
import com.poly.entity.GioHang_CT;
import com.poly.entity.SanPham;
import com.poly.utils.JPAUtils;

public class GioHang_CTDao extends AbstractDao{

	@Override
	public void insert(Object entity) {
		// TODO Auto-generated method stub
		super.insert(entity);
	}

	@Override
	public void update(Object entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(Class cls, Object id) {
		// TODO Auto-generated method stub
		super.delete(cls, id);
	}

	@Override
	public Object findById(Class cls, Object id) {
		// TODO Auto-generated method stub
		return super.findById(cls, id);
	}

	@Override
	public List findAll(Class cls) {
		// TODO Auto-generated method stub
		return super.findAll(cls);
	}
	
	
	public GioHang_CT getGiohangCT(GioHang gh, SanPham sp) {
		GioHang_CT ct = null;
		try {
			String jpql = "select o from GioHang_CT o where o.sanpham.MaSP=:idsp and o.giohang.IDGioHang=:idgiohang";
			  TypedQuery<GioHang_CT> query = JPAUtils.getEntityManager().createQuery(jpql, GioHang_CT.class);
			  query.setParameter("idsp", sp.getMaSP());
			  query.setParameter("idgiohang", gh.getIDGioHang());
			  ct = query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
			ct= null;
		}
		return ct;
	};
}
