package com.poly.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="GioHang_CT", uniqueConstraints={
		@UniqueConstraint(columnNames = {"MaSP" , "IDGioHang"})
		})
public class GioHang_CT implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IDChiTiet;
	private int SoLuong;
	@ManyToOne
	@JoinColumn(name="MaSP")
	private SanPham sanpham;
	@ManyToOne
	@JoinColumn(name="IDGioHang")
	private GioHang giohang;
	
	public GioHang getGiohang() {
		return giohang;
	}
	public void setGiohang(GioHang giohang) {
		this.giohang = giohang;
	}
	public int getIDChiTiet() {
		return IDChiTiet;
	}
	public void setIDChiTiet(int iDChiTiet) {
		IDChiTiet = iDChiTiet;
	}

	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public SanPham getSanpham() {
		return sanpham;
	}
	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
	}
	
	
}
