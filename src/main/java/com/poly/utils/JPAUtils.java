package com.poly.utils;

import javax.persistence.*;
public class JPAUtils {
	public static EntityManagerFactory factory;
	
	public static EntityManager getEntityManager() {
		if (factory == null||!factory.isOpen()) {
				factory = Persistence.createEntityManagerFactory("DATABASE_WEB_JAVA4");
		}
		return factory.createEntityManager();
	}
	public static void shutdown() {
		if (factory == null||!factory.isOpen()) {
			factory.close();
		}
		factory = null;
	}
}
