package com.poly.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.google.gson.annotations.Expose;
import com.poly.utils.JPAUtils;

import com.poly.utils.JPAUtils;



@NamedQueries({@NamedQuery(name = "User.findByEmail", query = "SELECT u FROM User u where u.Email = :email")})

@Entity
@Table(name="Users")
public class User implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Expose
	private int UserId;
	@Expose
	@NotEmpty(message = "Họ tên không để trống")
	private String HoTen;
	@Expose
	@NotEmpty(message = "Password không để trống")
	@Size(min=3, max=20, message="Password phải từ 3 - 10 ký tự")
	private String Password;
	@Expose
	@NotEmpty(message = "Email không để trống")
	private String Email;
	@Expose
	private boolean Role;
	@Expose
	@Pattern(regexp="(^$|[0-9]{9,10})", message = "Điện thoại phải là số và từ 9-10 số")
	@NotEmpty(message = "Điện thoại không để trống")
	private String Phone;
	@Expose
	private String DiaChi;

	@OneToMany(mappedBy = "user")
	private List<YeuThich> yeuthichList;

	@OneToMany(mappedBy = "userHD")
	private List<HoaDon> hoadonList;
	

	@OneToMany(mappedBy = "buyer")
	private List<GioHang> giohanglist;
	

	public List<GioHang> getGiohanglist() {
		return giohanglist;
	}

	public void setGiohanglist(List<GioHang> giohanglist) {
		this.giohanglist = giohanglist;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public boolean isRole() {
		return Role;
	}

	public void setRole(boolean role) {
		Role = role;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public List<YeuThich> getYeuthichList() {
		return yeuthichList;
	}

	public void setYeuthichList(List<YeuThich> yeuthichList) {
		this.yeuthichList = yeuthichList;
	}

	public List<HoaDon> getHoadonList() {
		return hoadonList;
	}

	public void setHoadonList(List<HoaDon> hoadonList) {
		this.hoadonList = hoadonList;
	}

	public User() {
		super();
	}

	@Override
	public String toString() {
		return "User [UserId=" + UserId + ", HoTen=" + HoTen + ", Password=" + Password + ", Email=" + Email + ", Role="
				+ Role + ", Phone=" + Phone ;
	}
	public List<CartOfUser> cartOfUser() {
	String jpql = "select new CartOfUser(o.sanpham.MaSP, o.sanpham.TENSP, o.sanpham.GIASP, o.SoLuong, ((o.sanpham.GIASP - ((o.sanpham.GiamGia)*o.sanpham.GIASP)/100)*o.SoLuong),o.sanpham.HINH, o.sanpham.GiamGia) from GioHang_CT o where o.giohang.buyer.UserId=:id";
	TypedQuery<CartOfUser> query = JPAUtils.getEntityManager().createQuery(jpql, CartOfUser.class);
	query.setParameter("id", getUserId());
	List<CartOfUser> list = query.getResultList();
	return list;
	}
	
	
	
	
		
}



