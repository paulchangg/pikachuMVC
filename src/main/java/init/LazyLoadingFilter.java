package init;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import init.HibernateUtils;

/**
 * Servlet Filter implementation class LazyLoadingFilter
 */
@WebFilter("/orderProcess/orderDetail.do")
public class LazyLoadingFilter implements Filter {

	SessionFactory  factory;
    public LazyLoadingFilter() {
    
    }

	
	public void destroy() {
	
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			chain.doFilter(request, response);
			tx.commit();
		} catch(Exception ex) {
			if (tx != null) {
				tx.rollback();
			}
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		factory = HibernateUtils.getSessionFactory();
	}

}
