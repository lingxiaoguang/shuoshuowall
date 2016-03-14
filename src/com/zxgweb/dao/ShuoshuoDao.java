package com.zxgweb.dao;

import java.util.List;

import com.zxgweb.bean.Shuoshuo;

/**
 * 说说Dao接口
 * @author lingxiaoguang
 *
 */
public interface ShuoshuoDao {
	//新增
	void save(Shuoshuo obj);
	//修改
	void update(Shuoshuo obj);
	//删除
	void delete(Integer id);
	//查询单个
	Shuoshuo query(Integer id);
	//分页查询
	List<Shuoshuo> queryForList(Integer pageNo,Integer pageSize);
	//查询总数
	Long queryTotalCount();
}
