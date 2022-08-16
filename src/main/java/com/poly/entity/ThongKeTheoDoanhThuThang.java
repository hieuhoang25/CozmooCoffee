/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;

/**
 *
 * @author LONG
 */
@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
            name = "TK.ThongKeTheoDoanhThuThang",
            procedureName = "sp_ThongKeDoanhThuTheoThang",
            resultClasses = ThongKeTheoDoanhThuThang.class
            
    )
})
@Entity
public class ThongKeTheoDoanhThuThang implements Serializable {
    @Id
    private Float tien;

    public ThongKeTheoDoanhThuThang() {
    }

    public Float getTien() {
        return tien;
    }

    public void setTien(Float tien) {
        this.tien = tien;
    }
    
    public ThongKeTheoDoanhThuThang(Float tien) {
        this.tien = tien;
    }
    
}
