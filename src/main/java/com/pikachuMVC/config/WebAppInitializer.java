package com.pikachuMVC.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	public WebAppInitializer() {
	}

	@Override
	//傳回組態資訊  service/DAO HIbernate SessionFactory
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootAppConfig.class };
	}

	@Override
	//傳回組態資訊 告訴Spring MVC 哪些類別有控制類別
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebAppConfig.class };
	}
	//什麼請求交給  Spring MVC分派器處理  
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Filter[] getServletFilters() {
		HiddenHttpMethodFilter hhmf = new HiddenHttpMethodFilter();
		CharacterEncodingFilter  cef = new CharacterEncodingFilter();
		cef.setEncoding("UTF-8");
		
		return new Filter[] {
				hhmf,cef
		};
	}
	
	
}
