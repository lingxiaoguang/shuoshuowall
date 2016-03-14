package com.zxgweb.dao.factory;

import com.zxgweb.dao.ShuoshuoDao;
import com.zxgweb.dao.impl.ShuoshuoDaoImpl;

/**
 * Dao的工厂类
 * @author lingxiaoguang
 *
 */
public class DaoFactory {
	
	private static ShuoshuoDao shuoshuoDao=new ShuoshuoDaoImpl();
	
	public static ShuoshuoDao getShuoshuoDao(){
		return shuoshuoDao;
	}
}
