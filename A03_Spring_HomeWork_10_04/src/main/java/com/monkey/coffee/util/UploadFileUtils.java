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
		// UUID 발급
		System.out.println("Break before");
		UUID uuid = UUID.randomUUID();
		System.out.println("Break after");
		// 저장할 파일명 = UUID + 원본이름
		String savedName = uuid.toString() + "_" + originalName;
		fVo.setFile_name_stored(savedName);
		System.out.println("Break after 0");
//		System.out.println("savedName : "+savedName);
//		System.out.println("uploadPath : "+uploadPath);
		// 업로드할 디렉토리(날짜별 폴더) 생성 
		String savedPath = calcPath(uploadPath, folderName);
		System.out.println("Break after 1");
		// 파일 경로(기존의 업로드경로+날짜별경로), 파일명을 받아 파일 객체 생성
		File target = new File(uploadPath + savedPath, savedName);
//		System.out.println("savedPath : "+savedPath);
		System.out.println("Break after 2");
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		FileCopyUtils.copy(fileData, target);
//		System.out.println("fileData, target : "+fileData+", "+target);
		System.out.println("Break after 3");
		System.out.println("path??" + uploadPath + savedPath + File.separator + savedName);
		
		//이미지 파일은 썸네일 사용
		String FileName = uploadPath + savedPath + File.separator + savedName;
		String dbFileName = FileName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		//System.out.println("dbFileName: "+dbFileName);

		return dbFileName;
	}
	
	// 날짜별 디렉토리 추출
	private static String calcPath(String uploadPath, String folderName) {
		Calendar cal = Calendar.getInstance();
        // File.separator : 디렉토리 구분자(\\)
		String ImgUpload = File.separator + folderName;
//		System.out.println(ImgUpload);
        // 연도, ex) \\2017 
		String yearPath=  ImgUpload + File.separator + cal.get(Calendar.YEAR);
//		System.out.println(yearPath);
        // 월, ex) \\2017\\03
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
//		System.out.println(monthPath);
		// 날짜, ex) \\2017\\03\\01
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
//		System.out.println(datePath);
        // 디렉토리 생성 메서드 호출
		System.out.println("Break After 0-1");
		makeDir(uploadPath, ImgUpload, yearPath, monthPath, datePath);
		System.out.println("Break After 0-2");
		return datePath;
	}
	
	   // 디렉토리 생성
	private static void makeDir(String uploadPath, String... paths) {
		
		//디렉토리가 존재하면
		if (new File(uploadPath + paths[paths.length - 1]).exists()){
			return;
		}
        // 디렉토리가 존재하지 않으면
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
            // 디렉토리가 존재하지 않으면
			if (!dirPath.exists()) {
				dirPath.mkdir(); //디렉토리 생성
			}
		}
	}	
	
    public static void deleteFile(String file_Name, ServletRequest request) throws Exception {
    	String uploadPath = request.getServletContext().getRealPath("/resources");

        new File(uploadPath + file_Name.replace('/', File.separatorChar)).delete();
    }
}
