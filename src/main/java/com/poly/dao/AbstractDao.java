package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import com.poly.utils.JPAUtils;

public abstract class AbstractDao<T> {
	public static final EntityManager em = JPAUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();
	
	// Thêm 
	public void insert(T entity) {
		try {
			trans.begin();
			em.persist(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		}
	}
	// Sửa
	public void update(T entity) {
		try {
			trans.begin();
			em.merge(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		}
	}
	// Xóa
	public void delete(Class<T>cls, Object id) {
		try {
			trans.begin();
			T entity = em.find(cls, id);
			em.remove(entity);
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		}
	}
	// Tìm theo Id
	public T findById(Class<T> cls, Object id) {
		T entity = em.find(cls, id);
		return entity;
	}
	// Tìm tất cả
	public List<T> findAll(Class<T> cls) {
		// dùng đối tượng criteriaBuider tạo ra câu truy vấn hql theo class tương ứng, không cần viết query
		CriteriaBuilder builder = em.getCriteriaBuilder();
		CriteriaQuery<T> query = builder.createQuery(cls);
		query.select(query.from(cls));
		List<T> list = em.createQuery(query).getResultList();
		return list;
	}
	

}
