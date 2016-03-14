package com.zxgweb.web.servlet;

import javax.servlet.http.HttpServlet;

import com.zxgweb.dao.ShuoshuoDao;
import com.zxgweb.dao.factory.DaoFactory;

/**
 * 基础Servlet
 * @author lingxiaoguang
 *
 */
public class BaseServlet extends HttpServlet{

	protected ShuoshuoDao shuoshuoDao=DaoFactory.getShuoshuoDao();
}
