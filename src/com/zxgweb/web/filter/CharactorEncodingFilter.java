package com.zxgweb.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

import com.zxgweb.util.StringUtils;

/**
 * 字符编码过滤器
 * @author lingxiaoguang
 *
 */
@WebFilter(value="/*",initParams={@WebInitParam(name="encoding",value="UTF-8")})
public class CharactorEncodingFilter implements Filter {

	String characterEncoding="UTF-8";
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String encoding=filterConfig.getInitParameter("encoding");
		if(StringUtils.isNotEmpty(encoding)){
			this.characterEncoding=encoding.trim();
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(characterEncoding);
		chain.doFilter(request, response);
		response.setCharacterEncoding(characterEncoding);
	}
	
	@Override
	public void destroy() {
	}

}
