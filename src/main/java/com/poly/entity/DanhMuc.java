package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name="DanhMuc")
@NamedNativeQueries({
		@NamedNativeQuery(
				name = "ListProduct",
				query = "select * from DanhMuc",
				resultClass = DanhMuc.class
				),
              
}
		)
public class DanhMuc implements Serializable {
	@Id	
	private String MaDM;
	private String TenDanhMuc;
	@OneToMany(mappedBy = "danhmuc") @JsonBackReference
	List<SanPham> listSP;

	
	public List<SanPham> getListSP() {
		return listSP;
	}
	public void setListSP(List<SanPham> listSP) {
		this.listSP = listSP;
	}
	public String getMaDM() {
		return MaDM;
	}
	public void setMaDM(String maDM) {
		MaDM = maDM;
	}
	public String getTenDanhMuc() {
		return TenDanhMuc;
	}
	public void setTenDanhMuc(String tenDanhMuc) {
		TenDanhMuc = tenDanhMuc;
	}
	
}
