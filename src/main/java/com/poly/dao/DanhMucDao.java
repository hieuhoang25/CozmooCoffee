package com.poly.dao;

import java.util.List;

import com.poly.entity.DanhMuc;

public class DanhMucDao extends AbstractDao<DanhMuc> {

	@Override
	public void insert(DanhMuc entity) {
		
		super.insert(entity);
	}

	@Override
	public void update(DanhMuc entity) {
		
		super.update(entity);
	}

	@Override
	public void delete(Class<DanhMuc> cls, Object id) {
		
		super.delete(cls, id);
	}

	@Override
	public DanhMuc findById(Class<DanhMuc> cls, Object id) {
		
		return super.findById(cls, id);
	}

	@Override
	public List<DanhMuc> findAll(Class<DanhMuc> cls) {
		
		return super.findAll(cls);
	}
	
public static void main(String[] args) {
	DanhMucDao dmdao = new DanhMucDao();
	DanhMuc d = dmdao.findById(DanhMuc.class, "cfcb" );
	int total = d.getListSP().size();
	System.out.println(total);
}
}
