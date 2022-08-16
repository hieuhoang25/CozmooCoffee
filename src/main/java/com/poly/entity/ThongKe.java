/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.poly.entity;

import java.io.Serializable;
import java.util.List;
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
            name = "ThongKe.ThongKeTheoSP",
            procedureName = "sp_ThongKeTheoLoaiSP",
            resultClasses = ThongKe.class
    )
})
@Entity
public class ThongKe implements Serializable{
    @Id
    private Integer food;
    private Integer drink;

    public ThongKe() {
    }

    public ThongKe(Integer food, Integer drink) {
        this.food = food;
        this.drink = drink;
    }

    
    public Integer getFood() {
        return food;
    }

    public void setFood(Integer food) {
        this.food = food;
    }

    public Integer getDrink() {
        return drink;
    }

    public void setDrink(Integer drink) {
        this.drink = drink;
    }
    
}
