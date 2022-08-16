package com.poly.entity;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="YeuThich",uniqueConstraints={
		@UniqueConstraint(columnNames = {"MASP" , "USERID"})
		})
public class YeuThich implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int YeuThichID;
	@ManyToOne
	@JoinColumn(name="UserID")
	private User user;
	
	@ManyToOne 
	@JoinColumn(name="MaSP")
	private SanPham sanpham;
	
	
	public YeuThich() {
		super();
	}

	public int getYeuThichID() {
		return YeuThichID;
	}

	public void setYeuThichID(int yeuThichID) {
		YeuThichID = yeuThichID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public SanPham getSanpham() {
		return sanpham;
	}

	public void setSanpham(SanPham sanpham) {
		this.sanpham = sanpham;
	}
		
}
