package com.zxgweb.util;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * 上传文件工具类
 * 
 * @author lingxiaoguang
 *
 */
public class UploadFileUtils {

	/**
	 * 上传文件<br>
	 * 
	 * @param request
	 *            请求
	 * @param dirName 文件夹名称
	 * @return 文件保存路径
	 */
	public static String uploadFile(HttpServletRequest request,String dirName) {
		//不是二进制流则返回
		if (!ServletFileUpload.isMultipartContent(request)) {
			return null;
		}
		try {
			FileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload servletFileUpload = new ServletFileUpload(
					fileItemFactory);
			//解析出表单元素
			List<FileItem> items = servletFileUpload.parseRequest(request);
			for (FileItem fileItem : items) {
				//处理文件域
				if (!fileItem.isFormField()) {
					//文件夹路径
					String dirPath = request.getSession().getServletContext()
							.getRealPath(dirName);
					File dir = new File(dirPath);
					if (!dir.exists()) {
						dir.mkdir();
					}
					//文件路径
					String ext=fileItem.getName().substring(fileItem.getName().lastIndexOf("."));
					String fileName=UUID.randomUUID().toString();
					String filePath = dirPath + "/" + fileName+ext;
					File file = new File(filePath);
					//写文件
					fileItem.write(file);
					return dirName+"/"+fileName+ext;
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 上传文件
	 * @param request 请求
	 * @return 
	 */
	public static String uploadFile(HttpServletRequest request) {
		return uploadFile(request, "upload");
	}
}
