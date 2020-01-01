package com.monkey.coffee.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.monkey.coffee.vo.BoardFileVO;

public class UploadFileUtils {

	public static String uploadFile(String uploadPath, String originalName, byte[] fileData, String folderName, BoardFileVO fVo) throws Exception {
		System.out.println("uploadFile");
		// UUID �߱�
		UUID uuid = UUID.randomUUID();
		// ������ ���ϸ� = UUID + �����̸�
		String savedName = uuid.toString() + "_" + originalName;
		fVo.setFile_name_stored(savedName);
//		System.out.println("savedName : "+savedName);
//		System.out.println("uploadPath : "+uploadPath);
		// ���ε��� ���丮(��¥�� ����) ���� 
		String savedPath = calcPath(uploadPath, folderName);
		// ���� ���(������ ���ε���+��¥�����), ���ϸ��� �޾� ���� ��ü ����
		File target = new File(uploadPath + savedPath, savedName);
//		System.out.println("savedPath : "+savedPath);
		// �ӽ� ���丮�� ���ε�� ������ ������ ���丮�� ����
		FileCopyUtils.copy(fileData, target);
//		System.out.println("fileData, target : "+fileData+", "+target);
		System.out.println("path??" + uploadPath + savedPath + File.separator + savedName);
		
		//�̹��� ������ ����� ���
		String FileName = uploadPath + savedPath + File.separator + savedName;
		String dbFileName = FileName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//System.out.println("dbFileName: "+dbFileName);

		return dbFileName;
	}
	
	// ��¥�� ���丮 ����
	private static String calcPath(String uploadPath, String folderName) {
		Calendar cal = Calendar.getInstance();
        // File.separator : ���丮 ������(\\)
		String ImgUpload = File.separator + folderName;
//		System.out.println(ImgUpload);
        // ����, ex) \\2017 
		String yearPath=  ImgUpload + File.separator + cal.get(Calendar.YEAR);
//		System.out.println(yearPath);
        // ��, ex) \\2017\\03
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		System.out.println(monthPath);
		// ��¥, ex) \\2017\\03\\01
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		System.out.println(datePath);
        // ���丮 ���� �޼��� ȣ��
		makeDir(uploadPath, ImgUpload, yearPath, monthPath, datePath);
		return datePath;
	}
	
	   // ���丮 ����
	private static void makeDir(String uploadPath, String... paths) {
		
		//���丮�� �����ϸ�
		if (new File(uploadPath + paths[paths.length - 1]).exists()){
			return;
		}
        // ���丮�� �������� ������
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
            // ���丮�� �������� ������
			if (!dirPath.exists()) {
				dirPath.mkdir(); //���丮 ����
			}
		}
	}	
	
    public static void deleteFile(String file_Name, ServletRequest request) throws Exception {
    	String uploadPath = request.getServletContext().getRealPath("/resources");

        new File(uploadPath + file_Name.replace('/', File.separatorChar)).delete();
    }
}
