package com.poly.dao;

import java.util.List;

import com.poly.entity.HoaDon;

public class HoaDonDao extends AbstractDao<HoaDon> {

	@Override
	public void insert(HoaDon entity) {
		
		super.insert(entity);
	}

	@Override
	public void update(HoaDon entity) {
		
		super.update(entity);
	}

	@Override
	public void delete(Class<HoaDon> cls, Object id) {
		
		super.delete(cls, id);
	}

	@Override
	public HoaDon findById(Class<HoaDon> cls, Object id) {
		
		return super.findById(cls, id);
	}

	@Override
	public List<HoaDon> findAll(Class<HoaDon> cls) {
		
		return super.findAll(cls);
	}
	
}
