package goodee.gdj58.online.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log();
@WebFilter("/employee/*")
public class EmpLoginFilter implements Filter {
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("\u001B[35m"+"EmpLoginFilter"); 
		
		if(request instanceof HttpServletRequest) { // instanceof 형변환 확인용
			HttpServletRequest req = (HttpServletRequest)request;
			HttpSession session = ((HttpServletRequest) request).getSession();
			if(session.getAttribute("loginEmp") == null) {
				((HttpServletResponse)response).sendRedirect(req.getContextPath()+"/loginEmp");
				// web component라서 contextPath 필요
				return;
			}
		} else {
			log.debug("웹브라우저 요청만 허용합니다."); 
			return;
		}
		
		// controller 전
		chain.doFilter(request, response); // 3) chain.doFilter() 실행 -> "/employee/*" 맵핑 실행
		// controller 후
	}
	
}