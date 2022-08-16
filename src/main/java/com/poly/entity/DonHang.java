package com.poly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@NamedNativeQueries({
	@NamedNativeQuery(
			name = "ListDonHang",
			query = "select HOADON_CHITIET.ID_HDCT, HOADON.IDHD, USERS.HOTEN, HOADON.DIACHI, USERS.PHONE, HOADON.NGAYTAO, SANPHAM.TENSP, HOADON_CHITIET.SOLUONG, SANPHAM.GIASP from HOADON right join HOADON_CHITIET on HOADON.IDHD = HOADON_CHITIET.MAHD\r\n"
					+ "				join SANPHAM on HOADON_CHITIET.MASP = SANPHAM.MASP\r\n"
					+ "				join USERS on HOADON.USERID = USERS.USERID "
					+" group by HOADON_CHITIET.ID_HDCT, HOADON.IDHD, USERS.HOTEN, HOADON.DIACHI, USERS.PHONE, HOADON.NGAYTAO, SANPHAM.TENSP, HOADON_CHITIET.SOLUONG, SANPHAM.GIASP",
			resultClass = DonHang.class
			),
          
}
	)
public class DonHang {
	@Id
	private String ID_HDCT;
	private String TenSP;
	private int SoLuong;
	private String DiaChi;
	private String HoTen;
	private String Phone;
	@Temporal(TemporalType.DATE)
	private Date NgayTao;
	private float GiaSP;
	private String IDHD;
	
	public DonHang() {
		super();
	}

	public String getID_HDCT() {
		return ID_HDCT;
	}

	public void setID_HDCT(String iD_HDCT) {
		ID_HDCT = iD_HDCT;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
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

	public float getGiaSP() {
		return GiaSP;
	}

	public void setGiaSP(float giaSP) {
		GiaSP = giaSP;
	}

	public String getIDHD() {
		return IDHD;
	}

	public void setIDHD(String iDHD) {
		IDHD = iDHD;
	}
	

	

	
	
	
	
}
