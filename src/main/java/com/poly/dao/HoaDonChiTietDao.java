package com.poly.dao;

import java.util.List;

import com.poly.entity.HoaDon_ChiTiet;

public class HoaDonChiTietDao extends AbstractDao<HoaDon_ChiTiet>{

	@Override
	public void insert(HoaDon_ChiTiet entity) {
		
		super.insert(entity);
	}

	@Override
	public void update(HoaDon_ChiTiet entity) {
		
		super.update(entity);
	}

	@Override
	public void delete(Class<HoaDon_ChiTiet> cls, Object id) {
		
		super.delete(cls, id);
	}

	@Override
	public HoaDon_ChiTiet findById(Class<HoaDon_ChiTiet> cls, Object id) {
		
		return super.findById(cls, id);
	}

	@Override
	public List<HoaDon_ChiTiet> findAll(Class<HoaDon_ChiTiet> cls) {
		
		return super.findAll(cls);
	}
	
}
