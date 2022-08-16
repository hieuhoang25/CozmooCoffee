package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;


@Entity
@Table(name="HoaDon")
public class HoaDon implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IDHD;

	private String DiaChi;
	private String Phone;
	@Temporal(TemporalType.DATE)
	private Date NgayTao;
	private float ThanhTien;
	@ManyToOne
	@JoinColumn(name="UserID")
	private User userHD;
	
	@OneToMany(mappedBy = "MaHD")
	private List<HoaDon_ChiTiet> hdct;
	
	public int getIDHD() {
		return IDHD;
	}


	public void setIDHD(int iDHD) {
		IDHD = iDHD;
	}


	public String getDiaChi() {
		return DiaChi;
	}


	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}


	public String getPhone() {
		return Phone;
	}


	public void setPhone(String phone) {
		Phone = phone;
	}


	public Date getNgayTao() {
		return NgayTao;
	}


	public void setNgayTao(Date ngayTao) {
		NgayTao = ngayTao;
	}


	public float getThanhTien() {
		return ThanhTien;
	}


	public void setThanhTien(float thanhTien) {
		ThanhTien = thanhTien;
	}


	public User getUserHD() {
		return userHD;
	}


	public void setUserHD(User userHD) {
		this.userHD = userHD;
	}


	public HoaDon() {
		super();
	}
	
	

	
}
