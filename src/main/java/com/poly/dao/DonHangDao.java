package com.poly.dao;

import java.util.List;


import javax.persistence.TypedQuery;

import com.poly.entity.DonHang;
import com.poly.entity.HoaDon;



public class DonHangDao extends AbstractDao<HoaDon> {

	@Override
	public void insert(HoaDon entity) {
		// TODO Auto-generated method stub
		super.insert(entity);
	}

	@Override
	public void update(HoaDon entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(Class<HoaDon> cls, Object id) {
		// TODO Auto-generated method stub
		super.delete(cls, id);
	}

	@Override
	public HoaDon findById(Class<HoaDon> cls, Object id) {
		// TODO Auto-generated method stub
		return super.findById(cls, id);
	}
	public List<DonHang> findAllDH(){
		TypedQuery <DonHang> query =  em.createNamedQuery("ListDonHang", DonHang.class);
		List<DonHang> list = query.getResultList();
//		for (int i = 0; i< list.size();i++) {
//			for (int z = i+1; z< list.size();z++) {
//				if(list.get(i).getIDHD()==(list.get(z).getIDHD()) && list.get(i).getNgayTao()==list.get(z).getNgayTao()) {
//					String ten = list.get(i).getTenSP()+", "+list.get(z).getTenSP();
//					list.get(i).setTenSP(ten);
//				}
//			}
//		}
		return list;
	}
}
