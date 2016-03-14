package com.zxgweb.util;

/**
 * 字符串工具类
 * @author lingxiaoguang
 *
 */
public class StringUtils {
	/**
	 * 字符串是否为空
	 * @param str 字符串
	 * @return 是否为空
	 */
	public static boolean isEmpty(String str) {
		return str == null || str.trim().equals("")||str.matches("\\s");
	}
	/**
	 * 字符串是否非空
	 * @param str 字符串
	 * @return 是否非空
	 */
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}
}
