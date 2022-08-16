	package com.poly.entity;

import java.util.ArrayList;
import java.util.List;

public class Oder {
	private User user;
	private List<SanPham> list;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<SanPham> getList() {
		return list;
	}
	public void setList(List<SanPham> list) {
		this.list = list;
	}
	public Oder(User user, List<SanPham> list) {
		this.user = user;
		this.list = list;
	}
	public Oder(User user) {
		this.user = user;
		this.list = new ArrayList<SanPham>();
	}
	private float total() {
		float dem=0;
		for (SanPham sanPham : list) {
			dem+=(sanPham.getGIASP()-sanPham.getGiamGia()*sanPham.getGIASP()/100);
		}
		return dem;
	}
}
