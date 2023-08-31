package com.ham.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.util.FIleManager;

@Service
public class ReviewService {

 @Autowired
 private ReviewDAO reviewDAO;
 
 
 	public List<ReviewDTO> list() throws Exception {

  	return reviewDAO.list();
 }

 	public ReviewFileDTO getFileDown(ReviewFileDTO reviewFileDTO)throws Exception{
		return reviewDAO.getFIleDetail(reviewFileDTO);
	}
 	
 	public boolean setContentsImgDelete(String path,HttpSession session) throws Exception{
		//path: /resources/upload/notice/파일명
		com.ham.main.file.FileDTO fileDTO =new com.ham.main.file.FileDTO();
//		path=path.substring(0, path.lastIndexOf("\\")+1);
		fileDTO.setFileName(path.substring(path.lastIndexOf("/")+1));
		path="/resources/upload/notice/";
		return FIleManager.fileDelete(fileDTO, path, session);
	}
	
	public String setContentsImg(MultipartFile file,HttpSession session)throws Exception {
		String path="/resources/upload/motice/";
		String fileName=FIleManager.fileSave(path, session, file);
		return path+fileName;
		
	}
 //게시물 작성
	 public int add(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session, Model model)throws Exception{
	 
	 return reviewDAO.add(reviewDTO);
 }
//게시물 조회

 	public ReviewDTO view(long reviewNum) throws Exception {

 	return reviewDAO.view(reviewNum);
}
 	
 	public int setFileDelete(ReviewFileDTO reviewFileDTO,HttpSession session) throws Exception{
		//폴더 파일 삭제
		reviewFileDTO=reviewDAO.getFIleDetail(reviewFileDTO);
		boolean flag=FIleManager.fileDelete(reviewFileDTO, "/resources/upload/notice/", null);
		
		if(flag) {
			
		
		//db삭제
			return reviewDAO.setFileDelete(reviewFileDTO);
		}
		return 0;
		}
 	
 // 게시물 수정
 	
 	public int update(ReviewDTO reviewDTO) throws Exception {
 	   
 	return reviewDAO.update(reviewDTO);
 	}
 	
 // 게시물 삭제
 	public int delete(long reviewNum) throws Exception {
 	return reviewDAO.delete(reviewNum);
 	}
 // 게시물 목록 + 페이징
 	public List<ReviewDTO> listPage(int displayPost, int postNum) throws Exception {
 	 return reviewDAO.listPage(displayPost, postNum);
 	}

	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}
}
