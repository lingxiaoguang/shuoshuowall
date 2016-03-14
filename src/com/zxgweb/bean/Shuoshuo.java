package com.zxgweb.bean;

import java.util.Date;

/**
 * 说说实体类
 * @author lingxiaoguang
 *
 */
public class Shuoshuo {
	//ID
	private Integer id;
	//内容
	private String content;
	//图片路径
	private String imgPath;
	//ip
	private String ip;
	//创建时间
	private Date createTime;
	//是否删除  1删除 0未删除
	private Integer isDelete;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	@Override
	public String toString() {
		return "Shuoshuo [id=" + id + ", content=" + content + ", imgPath="
				+ imgPath + ", ip=" + ip + ", createTime=" + createTime
				+ ", isDelete=" + isDelete + "]";
	}
	
}
