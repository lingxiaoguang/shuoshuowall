package com.zxgweb.util;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Dao支撑类
 * 
 * @author lingxiaoguang
 */
public class DaoSupport<T> {
	
	//dao操作的数据的类型
	private Class<T> clazz;

	{
		Type type = getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			ParameterizedType pt = (ParameterizedType) type;
			this.clazz = (Class<T>) pt.getActualTypeArguments()[0];
		} else {
			throw new RuntimeException("子类必须是泛型类型！");
		}
	}

	/**
	 * 插入记录
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 * @return 插入成功的记录数
	 */
	public long insert(String sql, Object... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql,
					Statement.RETURN_GENERATED_KEYS);
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
			preparedStatement.executeUpdate();
			ResultSet rs = preparedStatement.getGeneratedKeys();
			if (rs.next()) {
				return rs.getLong(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, preparedStatement, connection);
		}
		return 0;
	}

	/**
	 * 修改记录
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 */
	public void update(String sql, Object... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
			preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(null, preparedStatement, connection);
		}
	}

	/**
	 * 查询单个对象
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 * @return 查询到的对象
	 */
	public T query(String sql, Object... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
			rs = preparedStatement.executeQuery();
			T obj = clazz.newInstance();
			ResultSetMetaData rsmd = rs.getMetaData();
			if (rs.next()) {
				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					BeanUtils.setProperty(obj, rsmd.getColumnLabel(i + 1),
							rs.getObject(i + 1));
				}
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, preparedStatement, connection);
		}
		return null;
	}

	/**
	 * 查询多个<br>
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 * @return 查询到的对象的集合
	 */
	public  List<T> queryForList(String sql, Object... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
			rs = preparedStatement.executeQuery();
			List<T> objs = new ArrayList<T>();
			ResultSetMetaData rsmd = rs.getMetaData();
			while (rs.next()) {
				T obj = clazz.newInstance();
				for (int i = 0; i < rsmd.getColumnCount(); i++) {
					BeanUtils.setProperty(obj, rsmd.getColumnLabel(i + 1),
							rs.getObject(i + 1));
				}
				objs.add(obj);
			}
			return objs;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, preparedStatement, connection);
		}
		return null;
	}

	/**
	 * 查询单个值<br>
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 * @return 查询到的值
	 */
	public <V> V queryForValue(String sql, Object... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		try {
			connection = JDBCUtils.getConnection();
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				preparedStatement.setObject(i + 1, args[i]);
			}
			rs = preparedStatement.executeQuery();
			rs.next();
			return (V) rs.getObject(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtils.release(rs, preparedStatement, connection);
		}
		return null;
	}

	/**
	 * 批量操作<br>
	 * 
	 * @param sql
	 *            sql语句
	 * @param args
	 *            参数
	 */
	public void batch(String sql, Object[]... args) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		try {
			connection = JDBCUtils.getConnection();
			connection.setAutoCommit(false);
			preparedStatement = connection.prepareStatement(sql);
			for (int i = 0; i < args.length; i++) {
				for (int j = 0; j < args[i].length; j++) {
					preparedStatement.setObject(j + 1, args[i][j]);
				}
				preparedStatement.addBatch();
			}
			int[] o = preparedStatement.executeBatch();
			connection.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			JDBCUtils.release(null, preparedStatement, connection);
		}
	}
}
