package com.pineapple.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUpload {
private Logger log = Logger.getLogger(this.getClass());
String fileName = "";
    
//  프로젝트 내 지정된 경로에 파일을 저장하는 메소드
//  DB에는 업로드된 전체 경로명으로만 지정되기 때문에(업로드한 파일 자체는 경로에 저장됨)
//  fileUpload() 메소드에서 전체 경로를 리턴받아 DB에 경로 그대로 저장   
    public String fileUpload(MultipartHttpServletRequest request,
                                        MultipartFile uploadFile) {
        String path = "";
        String fileName = "";
        
        OutputStream out = null;
        PrintWriter printWriter = null;
        
        try {
            fileName = uploadFile.getOriginalFilename();
            byte[] bytes = uploadFile.getBytes();
            //배포할때에
            //path = getSaveLocation(request);
            //로컬에서 테스트할때에
            path = "C:/Users/Administrator/git/pineapplefunding/pineapple/src/main/webapp/resources/files/";
            
            log.debug("UtilFile fileUpload fileName : " + fileName);
            log.debug("UtilFile fileUpload uploadPath : " + path);
            
            File file = new File(path);
            
//          파일명이 중복으로 존재할 경우
            if (fileName != null && !fileName.equals("")) {
                if (file.exists()) {
//                    파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
                    fileName = System.currentTimeMillis() + "_" + fileName;
                    
                    file = new File(path + fileName);
                }
            }
            
            log.debug("UtilFile fileUpload final fileName : " + fileName);
            log.debug("UtilFile fileUpload file : " + file);
            
            out = new FileOutputStream(file);
            
            log.debug("UtilFile fileUpload out : " + out);
            
            out.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return path + fileName;
   }
    
//  	업로드 파일 저장 경로 얻는 메소드
    private String getSaveLocation(MultipartHttpServletRequest request) {
        
        String uploadPath = request.getSession().getServletContext().getRealPath("/");
        String attachPath = "resources/files/";
       
        log.debug("UtilFile getSaveLocation path : " + uploadPath + attachPath);
        return uploadPath + attachPath;
	}
}
