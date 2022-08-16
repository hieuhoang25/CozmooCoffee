package com.poly.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="HoaDon_ChiTiet")
public class HoaDon_ChiTiet implements Serializable {
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private int ID_HDCT;
	
	@ManyToOne
	@JoinColumn(name="MASP")
	private SanPham MaSP;
	@ManyToOne
	@JoinColumn(name="MAHD")
	private HoaDon MaHD;
	
	public int getID_HDCT() {
		return ID_HDCT;
	}

	public void setID_HDCT(int iD_HDCT) {
		ID_HDCT = iD_HDCT;
	}

	public SanPham getMaSP() {
		return MaSP;
	}

	public void setMaSP(SanPham maSP) {
		MaSP = maSP;
	}

	public HoaDon getMaHD() {
		return MaHD;
	}

	public void setMaHD(HoaDon maHD) {
		MaHD = maHD;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	private int SoLuong;

}
