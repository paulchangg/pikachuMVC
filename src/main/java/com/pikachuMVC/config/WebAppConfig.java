package com.pikachuMVC.config;

import java.util.ArrayList;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.orm.hibernate5.support.OpenSessionInViewFilter;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
@EnableWebMvc
@ComponentScan("com.pikachuMVC")
public class WebAppConfig implements WebMvcConfigurer {
	public WebAppConfig() {
	}

	@Bean
	public ViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
//		resolver.setViewClass(JstlView.class);
		resolver.setPrefix("/WEB-INF/");
		resolver.setSuffix(".jsp");
		// "/WEB-INF/views/" + logicName + ".jsp"
		return resolver;
	}

//	@Bean
//	public MessageSource messageSource() {
//		ResourceBundleMessageSource resource = new ResourceBundleMessageSource();
//		resource.setBasename("messages"); // 說明properties檔的主檔名
//		return resource;
//	}

//	@Override 
//	public void addResourceHandlers(ResourceHandlerRegistry registry) {
//	     registry.addResourceHandler("/css/**")
//	             .addResourceLocations("/WEB-INF/views/css/");
//	     registry.addResourceHandler("/image/**")
//	             .addResourceLocations("/WEB-INF/views/images/");
//	}
	@Override
	public void configureDefaultServletHandling
				(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding("UTF-8");
		resolver.setMaxUploadSize(81920000);
		return resolver;
	}
	

	@Bean 
	public MappingJackson2JsonView jsonView() {
	    MappingJackson2JsonView view = new MappingJackson2JsonView();
	    view.setPrettyPrint(true);
	    return view;
	}
	
	//內容協商試圖解析器
	@Bean
	public ViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
	    ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
	    resolver.setContentNegotiationManager(manager);
	    ArrayList<View> views = new ArrayList<>();
	    views.add(jsonView());
	    resolver.setDefaultViews(views);
	   
	    return resolver;
	}
	
	
//	<filter>
//	<filter-name>OpenSessionInViewFilter</filter-name>
//	<filter-class>org.springframework.orm.hibernate5.support.OpenSessionInViewFilter</filter-class>
//	<init-param>
//		<param-name>sessionFactoryBeanName</param-name>
//		<param-value>sessionFactory</param-value>
//	</init-param>
//	<!-- singleSession為true表示『處理同一個請求的所有程式都用同一個Hibernate Session』 -->
//	<init-param>
//		<param-name>singleSession</param-name>
//		<param-value>true</param-value>
//	</init-param>
//	<!-- flushMode 預設值為: lushMode.NEVER，如果並未與交易併用，應該將 flushMode改為AUTO -->
//	<init-param>
//		<param-name>flushMode</param-name>
//		<param-value>AUTO</param-value>
//	</init-param>
//</filter>
	
}
