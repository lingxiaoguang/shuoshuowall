package com.zxgweb.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.zxgweb.bean.Shuoshuo;
import com.zxgweb.dao.ShuoshuoDao;
import com.zxgweb.dao.factory.DaoFactory;
import com.zxgweb.util.StringUtils;

/**
 * 说说列表Servlet
 * @author lingxiaoguang
 */
@WebServlet("/msgList")
public class ShuoShuoListServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNoStr=request.getParameter("pageNo");
		String pageSizeStr=request.getParameter("pageSize");
		if(StringUtils.isEmpty(pageNoStr)){
			pageNoStr="1";
		}
		if(StringUtils.isEmpty(pageSizeStr)){
			pageSizeStr="12";
		}
		Integer pageNo=Integer.parseInt(pageNoStr);
		Integer pageSize=Integer.parseInt(pageSizeStr);
		List<Shuoshuo> list=shuoshuoDao.queryForList(pageNo, pageSize);
		String json=new JSONArray(list).toString();
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}
}
