package com.poly.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.poly.entity.GioHang;
import com.poly.entity.User;
import com.poly.utils.JPAUtils;

public class GioHangDao extends AbstractDao {

	@Override
	public void insert(Object entity) {
		// TODO Auto-generated method stub
		super.insert(entity);
	}

	@Override
	public void update(Object entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(Class cls, Object id) {
		// TODO Auto-generated method stub
		super.delete(cls, id);
	}

	@Override
	public Object findById(Class cls, Object id) {
		// TODO Auto-generated method stub
		return super.findById(cls, id);
	}

	@Override
	public List findAll(Class cls) {
		// TODO Auto-generated method stub
		return super.findAll(cls);
	}
	
	public GioHang userHaveCart(User u) {
		GioHang gh = null;
		try {
			String jpql = "select o from GioHang o where o.buyer.UserId=:id";
			  TypedQuery<GioHang> query = JPAUtils.getEntityManager().createQuery(jpql, GioHang.class);
			  query.setParameter("id", u.getUserId());
			  gh = query.getSingleResult();
		} catch (NoResultException e) {
			// TODO: handle exception
			gh= null;
		}
		return gh;
	}
}
