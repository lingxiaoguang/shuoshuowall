package com.zxgweb.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.zxgweb.bean.Shuoshuo;
import com.zxgweb.dao.ShuoshuoDao;
import com.zxgweb.util.StringUtils;

/**
 * 保存说说的Servlet
 */
@WebServlet("/saveShuoshuo")
public class SaveShuoshuoServlet extends BaseServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取参数
		String content=request.getParameter("content");
		String imgPath=request.getParameter("imgPath");
		String ip=request.getRemoteAddr();
		//如果参数不合法
		if(StringUtils.isEmpty(content)||StringUtils.isEmpty(imgPath)||StringUtils.isEmpty(ip)){
			//返回结果
			JSONObject json=new JSONObject();
			json.put("result","fail");
			response.getWriter().write(json.toString());
		}else{//如果参数合法
			//保存
			Shuoshuo shuoshuo=new Shuoshuo();
			shuoshuo.setContent(content);
			shuoshuo.setImgPath(imgPath);
			shuoshuo.setIp(ip);
			shuoshuoDao.save(shuoshuo);
			//返回结果
			JSONObject json=new JSONObject();
			json.put("result","success");
			response.getWriter().write(json.toString());
		}
	}
}
