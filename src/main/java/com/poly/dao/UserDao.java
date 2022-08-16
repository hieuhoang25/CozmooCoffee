package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;


import org.hibernate.exception.ConstraintViolationException;

import com.poly.entity.GioHang;
import com.poly.entity.User;
import com.poly.utils.JPAUtils;

public class UserDao extends AbstractDao<User> {


	
	@Override 
	public void insert(User entity) {
		super.insert(entity);
	}

	public Integer insertU(User entity) throws Exception {
		try {
			trans.begin();
			em.persist(entity);
			entity.getUserId();
			System.out.println("inserted " + entity.getUserId());
			trans.commit();
			return  entity.getUserId();
		} catch (Exception e) {
			Throwable t = e.getCause();
			trans.rollback();
			if(t instanceof ConstraintViolationException) {
				ConstraintViolationException cv = (ConstraintViolationException) t;
				String error = cv.getSQLException().getMessage();
				System.out.println("swl " + error); 
				String sdt = entity.getPhone(); String email = entity.getEmail();
//				System.out.println("mess "+ cv.getCause().getLocalizedMessage());
				String mess = String.format("%s đã tồn tại", error.contains(sdt)? "Số điện thoại" : "Email");
				e = new Exception(mess);
				throw e;
			}
			
		}
		return null;
		
	}
	


	public void updateU(User entity) throws Exception {
		try {
		trans.begin();
		User old = findById(User.class, entity.getUserId());
		List<GioHang> gh = old.getGiohanglist();
		entity.setGiohanglist(gh);
		em.merge(entity);
		trans.commit();
		} catch (Exception e) {
			Throwable t = e.getCause();
			trans.rollback();
			if(t instanceof ConstraintViolationException) {
				ConstraintViolationException cv = (ConstraintViolationException) t;
				String error = cv.getSQLException().getMessage();
				System.out.println("swl " + error); 
				String sdt = entity.getPhone(); String email = entity.getEmail();
//				System.out.println("mess "+ cv.getCause().getLocalizedMessage());
				String mess = String.format("%s đã tồn tại", error.contains(sdt)? "Số điện thoại" : "Email");
				e = new Exception(mess);
				throw e;
	}
	}
		}

	@Override
	public void update(User entity) {
		try {
		trans.begin();
		User old = findById(User.class, entity.getUserId());
		List<GioHang> gh = old.getGiohanglist();
		entity.setGiohanglist(gh);
		em.merge(entity);
		trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
	}
		}


	@Override
	public void delete(Class<User> cls, Object id) {
		super.delete(cls, id);
	}

	@Override
	public User findById(Class<User> cls, Object id) {
		return super.findById(cls, id);
	}

	@Override
	public List<User> findAll(Class<User> cls) {
		
		return super.findAll(cls);
	}
	
	public User findByEmail(String email) {
		try {
			TypedQuery<User> tq = em.createNamedQuery("User.findByEmail", User.class);
			tq.setParameter("email", email);
		
			User u = tq.getSingleResult();
			return u;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		userDao.findByEmail("van@4shar.com");
	}
	
}
