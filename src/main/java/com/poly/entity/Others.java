package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EntityResult;
import javax.persistence.FieldResult;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.StoredProcedureParameter;

@SqlResultSetMapping(
        name = "HotProduct",
        entities = {
            @EntityResult(
                    entityClass = com.poly.entity.Others.class,
                    fields = {
                        @FieldResult(name = "MASP", column = "MASP"),
                        @FieldResult(name = "TENSP", column = "TENSP"),
                        @FieldResult(name = "GIASP", column = "GIASP"),
                        @FieldResult(name = "MADM", column = "MADM"),
                        @FieldResult(name = "HINH", column = "HINH"),
                        @FieldResult(name = "TENDANHMUC", column = "TENDANHMUC"),
                        @FieldResult(name = "GIAMGIA", column = "GIAMGIA")
                    }
            )
        }
)
@NamedNativeQuery(
        name = "Others.NoiBat",
        query = "select MASP, TENSP,GIASP,MADM,HINH,TENDANHMUC,GIAMGIA from SANPHAM SP JOIN DANHMUC DM ON\r\n"
        + "SP.DANHMUC = DM.MADM where MASP IN (select top 10 MASP from HOADON_CHITIET \r\n"
        + "GROUP BY MASP order by SUM(SOLUONG) desc) AND MADM IN \r\n"
        + "(SELECT MADM FROM DANHMUC WHERE MADM = 'trasua' OR MADM = 'tea' OR MADM = 'coffee' OR MADM = 'mcake')",
        resultSetMapping = "HotProduct"
)

@NamedNativeQueries({
    @NamedNativeQuery(
            name = "Others.productdiscount",
            query = "select sp.MASP,TENSP,GIAMGIA,GIASP,HINH,MADM,TENDANHMUC from SANPHAM sp join DANHMUC dm on\n" +
" sp.DANHMUC = dm.MADM where GIAMGIA != 0",
            resultClass = Others.class
    )
})
@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
            name = "Other.ThongKeTheoSP",
            procedureName = "sp_ThongKeTheoLoaiSP",
            resultClasses = List.class,
            parameters = @StoredProcedureParameter(name = "input",type = String.class)
    )
})
@Entity
public class Others implements Serializable {

    @Id
    private String MASP;
    private String TENSP;
    private Long GIASP;
    private String MADM;
    private String HINH;
    private String TENDANHMUC;
    private int GIAMGIA;

    public Others() {
        super();
    }

    public Others(String MASP, String TENSP, Long GIASP, String MADM, String HINH, String TENDANHMUC, Integer GIAMGIA) {
        this.MASP = MASP;
        this.TENSP = TENSP;
        this.GIASP = GIASP;
        this.MADM = MADM;
        this.HINH = HINH;
        this.TENDANHMUC = TENDANHMUC;
        this.GIAMGIA = GIAMGIA;
    }

    public Integer getGIAMGIA() {
        return GIAMGIA;
    }

    public void setGIAMGIA(Integer GIAMGIA) {
        this.GIAMGIA = GIAMGIA;
    }

    

    public String getTENDANHMUC() {
        return TENDANHMUC;
    }

    public void setTENDANHMUC(String TENDANHMUC) {
        this.TENDANHMUC = TENDANHMUC;
    }

    public String getHINH() {
        return HINH;
    }

    public void setHINH(String hINH) {
        HINH = hINH;
    }

    public String getTENSP() {
        return TENSP;
    }

    public void setTENSP(String tENSP) {
        TENSP = tENSP;
    }

    public Long getGIASP() {
        return GIASP;
    }

    public void setGIASP(Long gIASP) {
        GIASP = gIASP;
    }

    public String getMADM() {
        return MADM;
    }

    public void setMADM(String mADM) {
        MADM = mADM;
    }

    public String getMASP() {
        return MASP;
    }

    public void setMASP(String maSP) {
        MASP = maSP;
    }
    public double getNewGia() {
        return this.getGIASP() - (getGIAMGIA() * getGIASP()) / 100;
    }

}
