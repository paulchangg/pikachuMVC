package com.pikachuMVC.config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.HiddenHttpMethodFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	public WebAppInitializer() {
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootAppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebAppConfig.class };
	}

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
