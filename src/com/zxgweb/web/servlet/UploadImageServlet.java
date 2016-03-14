package com.zxgweb.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.zxgweb.util.UploadFileUtils;

/**
 * 上传图片的Servlet
 * @author lingxiaoguang
 */
@WebServlet("/uploadImg")
public class UploadImageServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().write("请使用post方式提交文件！");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//保存文件
		String imgPath=UploadFileUtils.uploadFile(request);
		//返回文件路径
		JSONObject json=new JSONObject();
		json.put("imgPath",imgPath);
		response.getWriter().write(json.toString());
	}
}
