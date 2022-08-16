package com.poly.dao;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.TypedQuery;

import com.poly.entity.YeuThich;

public class YeuThichDao extends AbstractDao<YeuThich> {

	@Override
	public void insert(YeuThich entity) {
		// TODO Auto-generated method stub
		super.insert(entity);
	}

	@Override
	public void update(YeuThich entity) {
		// TODO Auto-generated method stub
		super.update(entity);
	}

	@Override
	public void delete(Class<YeuThich> cls, Object id) {
		// TODO Auto-generated method stub
		super.delete(cls, id);
	}


	public YeuThich findById(int MaSP, int userID) {
		// TODO Auto-generated method stub
			
			YeuThich yt = null;
			try{
				String jqpl = "select o from YeuThich o where o.sanpham.MaSP=:MaSP and o.user.UserId=:userID";
				TypedQuery<YeuThich> query = em.createQuery(jqpl, YeuThich.class);
				query.setParameter("MaSP", MaSP);
				query.setParameter("userID",userID);
				yt = (YeuThich)query.getSingleResult();
			}
			catch (NoResultException nre){
			//Ignore this because as per your logic this is ok!
			}

			return yt;
			
	}

	@Override
	public List<YeuThich> findAll(Class<YeuThich> cls) {
		// TODO Auto-generated method stub
		return super.findAll(cls);
	}

	

}
