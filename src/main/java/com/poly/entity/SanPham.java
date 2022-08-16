package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.google.gson.annotations.Expose;

@Entity
@Table(name = "SANPHAM", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"MaSP"})
})
@NamedNativeQueries({
    @NamedNativeQuery(
            name = "SanPham.NewProduct",
            query = "SELECT TOP 12 * FROM SANPHAM",
            resultClass = SanPham.class
    ),
    @NamedNativeQuery(
            name = "SanPham.discountproduct",
            query = "select * from SANPHAM where GIAMGIA != 0;",
            resultClass = SanPham.class
    ),
    @NamedNativeQuery(
                                name = "SanPham.productdetail",
                                query = " select * from SANPHAM where DANHMUC = ?",
                                resultClass = SanPham.class
                )
})
public class SanPham implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Expose
    private int MaSP;
    @Expose
    private String TENSP;
    @ManyToOne 
    @Expose
    @JoinColumn(name = "DanhMuc")
    private DanhMuc danhmuc;
    @Expose
    private String HINH;
    @Expose
    private String MoTa;
    @Expose
    private float GIASP;
    @Expose
    private int GiamGia;
    @Expose
    @OneToMany(mappedBy = "sanpham")
    private List<YeuThich> yeuthichList;

    public List<YeuThich> getYeuthichList() {
        return yeuthichList;
    }

    public void setYeuthichList(List<YeuThich> yeuthichList) {
        this.yeuthichList = yeuthichList;
    }

    public DanhMuc getDanhmuc() {
        return danhmuc;
    }

    public void setDanhmuc(DanhMuc danhmuc) {
        this.danhmuc = danhmuc;
    }

    public int getMaSP() {
        return MaSP;
    }

    public void setMaSP(int maSP) {
        MaSP = maSP;
    }

    public String getHINH() {
        return HINH;
    }

    public void setHINH(String hINH) {
        HINH = hINH;
    }

    public String getMoTa() {
        return MoTa;
    }

    public void setMoTa(String moTa) {
        MoTa = moTa;
    }

    public String getTENSP() {
        return TENSP;
    }

    public void setTENSP(String tENSP) {
        TENSP = tENSP;
    }

    public float getGIASP() {
        return GIASP;
    }

    public void setGIASP(float gIASP) {
        GIASP = gIASP;
    }

    public int getGiamGia() {
        return GiamGia;
    }

    public void setGiamGia(int giamGia) {
        GiamGia = giamGia;
    }

    public double getNewGia() {
        return this.getGIASP() - ((getGiamGia()) * getGIASP()) / 100;
    }
}
