package com.zxgweb.dao.impl;

import java.util.Date;
import java.util.List;

import com.zxgweb.bean.Shuoshuo;
import com.zxgweb.dao.ShuoshuoDao;
import com.zxgweb.util.DaoSupport;
/**
 * 说说Dao实现类
 * @author lingxiaoguang
 *
 */
public class ShuoshuoDaoImpl extends DaoSupport<Shuoshuo> implements ShuoshuoDao{

	//插入sql
	private static final String INSERT_SQL="insert into shuoshuo(id,img_path,content,ip,create_time,is_delete) values(?,?,?,?,?,?)";
	//更新sql
	private static final String UPDATE_SQL="update shuoshuo set img_path=? and content=? and ip=?";
	//删除sql
	private static final String DELETE_SQL="delete from shuoshuo where id=?";
	//查询单个sql
	private static final String QUERY_ONE_SQL="select id id,img_path imgPath,content content,ip ip,create_time createTime,is_delete isDelete from shuoshuo where id=? and is_delete=0";
	//查询多个sql
	private static final String QUERY_FOR_LIST_SQL="select id id,img_path imgPath,content content,ip ip,create_time createTime,is_delete isDelete from shuoshuo  where is_delete=0 order by create_time desc limit ?,?";
	//查询单个值sql
	private static final String QUERY_FOR_VALUE_SQL="";
	//查询总数sql
	private static final String QUERY_TOTAL_COUNT_SQL = "select count(1) from shoshuo where is_delete=0";
	
	/**
	 * 保存
	 */
	@Override
	public void save(Shuoshuo obj) {
		obj.setCreateTime(new Date());
		obj.setIsDelete(0);
		insert(INSERT_SQL, obj.getId(),obj.getImgPath(),obj.getContent(),obj.getIp(),obj.getCreateTime(),obj.getIsDelete());
	}
	/**
	 * 修改
	 */
	@Override
	public void update(Shuoshuo obj) {
		update(UPDATE_SQL,obj.getImgPath(),obj.getContent(),obj.getIp());
	}

	/**
	 * 删除
	 */
	@Override
	public void delete(Integer id) {
		update(DELETE_SQL,1);
	}
	/**
	 * 查询单个
	 */
	@Override
	public Shuoshuo query(Integer id) {
		return query(QUERY_ONE_SQL, id);
	}
	/**
	 * 查询多个
	 */
	@Override
	public List<Shuoshuo> queryForList(Integer pageNo, Integer pageSize) {
		return queryForList(QUERY_FOR_LIST_SQL,(pageNo-1)*pageSize,pageSize);
	}
	
	/**
	 * 查询总数
	 */
	@Override
	public Long queryTotalCount() {
		return queryForValue(QUERY_TOTAL_COUNT_SQL);
	}
}
