package com.zxgweb.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
/**
 * JDBC工具类
 * @author lingxiaoguang
 *
 */
public class JDBCUtils {
	//数据源
	private static DataSource dataSource;

	static {
		dataSource = new ComboPooledDataSource("javawebapp");
	}

	private JDBCUtils() {
	}
	
	/**
	 * 获得数据库的连接
	 * @return
	 */
	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("数据库连接异常");
		}
	}

	/**
	 * 释放连接
	 * @param rs 结果集
	 * @param statement  声明
	 * @param connection 连接
	 */
	public static void release(ResultSet rs, Statement statement,
			Connection connection) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
