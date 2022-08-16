package com.poly.dao;

import java.util.List;

import com.poly.entity.SanPham;

public class SanPhamDao extends AbstractDao<SanPham> {

	
	@Override
	public void insert(SanPham entity) {
		
		super.insert(entity);
	}

	@Override
	public void update(SanPham entity) {
		
		super.update(entity);
	}

	@Override
	public void delete(Class<SanPham> cls, Object id) {
		
		super.delete(cls, id);
	}

	@Override
	public SanPham findById(Class<SanPham> cls, Object id) {
		
		return super.findById(cls, id);
	}

	@Override
	public List<SanPham> findAll(Class<SanPham> cls) {
		
		return super.findAll(cls);
	}

}
