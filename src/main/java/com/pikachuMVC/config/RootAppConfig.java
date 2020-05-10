package com.pikachuMVC.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
//@PropertySource()
public class RootAppConfig {

	@Bean
	public  DataSource  dataSource() {
		ComboPooledDataSource  ds = 
				new ComboPooledDataSource();
		try {
			ds.setDriverClass("com.mysql.cj.jdbc.Driver");
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		ds.setJdbcUrl("jdbc:mysql:///pikachudb"
				+ "?useSSL=true&useUnicode=yes&characterEncoding=UTF8"
				+ "&serverTimezone=Asia/Taipei");
		ds.setUser("root");

//		ds.setPassword("404631060");
//		ds.setPassword("22651330");
//		ds.setPassword("songsql");
		ds.setPassword("ruby123");	
		ds.setInitialPoolSize(5);
		ds.setMaxPoolSize(8);
		return ds;
	}
	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());   // dataSource()為定義在前一頁的方法
		factory.setPackagesToScan(new String[] {
				"com.pikachuMVC"
			});
	     // additionalProperties ()為定義在後面的方法
		factory.setHibernateProperties(additionalProperties());  
		return factory;
	}
	
	@Bean(name="transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
	     HibernateTransactionManager txManager = new HibernateTransactionManager();
	     txManager.setSessionFactory(sessionFactory);
	     return txManager;
	  }	

	
	private Properties additionalProperties() {
		Properties properties=new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.MySQL8Dialect.class);
		properties.put("hibernate.show_sql", Boolean.FALSE);
		properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}

}
