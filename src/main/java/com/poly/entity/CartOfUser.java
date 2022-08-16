package com.poly.entity;

import java.io.Serializable;

import javax.persistence.*;

@Entity
public class CartOfUser implements Serializable {
	@Id
	private int MaSP;
	private String TenSP;
	private float GiaSP;
	private int SoLuong;
	private float ThanhTien;
	private String Hinh;
	private int GiamGia;
	public int getMaSP() {
		return MaSP;
	}
	public CartOfUser() {
		super();
	}
	public CartOfUser(int maSP, String tenSP, float giaSP, int soLuong, float thanhTien, String hinh, int giamGia) {
		super();
		MaSP = maSP;
		TenSP = tenSP;
		GiaSP = giaSP;
		SoLuong = soLuong;
		ThanhTien = thanhTien;
		Hinh = hinh;
		GiamGia = giamGia;
	}
	public void setMaSP(int maSP) {
		MaSP = maSP;
	}
	public String getTenSP() {
		return TenSP;
	}
	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}
	public float getGiaSP() {
		return GiaSP;
	}
	public void setGiaSP(float giaSP) {
		GiaSP = giaSP;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	public float getThanhTien() {
		return ThanhTien;
	}
	public void setThanhTien(float thanhTien) {
		ThanhTien = thanhTien;
	}
	public String getHinh() {
		return Hinh;
	}
	public void setHinh(String hinh) {
		Hinh = hinh;
	}
	public int getGiamGia() {
		return GiamGia;
	}
	public void setGiamGia(int giamGia) {
		GiamGia = giamGia;
	}
	private float getToTal() {
		return (getGiaSP()-getGiamGia()*getGiaSP()/100)*getSoLuong();
	}
}
