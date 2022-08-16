package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="GioHang" , uniqueConstraints={
		@UniqueConstraint(columnNames = {"UserID"})
		})
public class GioHang implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int IDGioHang;
	public List<GioHang_CT> getGiohang_ct_list() {
		return giohang_ct_list;
	}
	public void setGiohang_ct_list(List<GioHang_CT> giohang_ct_list) {
		this.giohang_ct_list = giohang_ct_list;
	}
	@ManyToOne
	@JoinColumn(name="USERID")
	private User buyer;
	@OneToMany(mappedBy = "giohang")
	private List<GioHang_CT> giohang_ct_list;
	public int getIDGioHang() {
		return IDGioHang;
	}
	public void setIDGioHang(int iDGioHang) {
		IDGioHang = iDGioHang;
	}
	public User getBuyer() {
		return buyer;
	}
	public void setBuyer(User buyer) {
		this.buyer = buyer;
	}
	
	
	

	
	
}
