package com.ham.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.file.FileDTO;
import com.ham.main.util.FileManager;

@Service
public class ReviewService {

	@Autowired
 	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
 

 	public ReviewFileDTO getFileDown(ReviewFileDTO reviewFileDTO)throws Exception{
		return reviewDAO.getFileDetail(reviewFileDTO);
	}
 	
 	public boolean setContentsImgDelete(String path,HttpSession session) throws Exception{
		//path: /resources/upload/review/파일명
		FileDTO fileDTO =new FileDTO();
//		path=path.substring(0, path.lastIndexOf("\\")+1);
		fileDTO.setFileName(path.substring(path.lastIndexOf("/")+1));
		
		path="/resources/upload/review/";
		return fileManager.fileDelete(fileDTO, path, session);
	}
	
	public String setContentsImg(MultipartFile file,HttpSession session)throws Exception {
		String path="/resources/upload/review/";
		String fileName=fileManager.fileSave(path, session, file);
		return path+fileName;
		
	}
	
	public int setFileDelete(ReviewFileDTO reviewFileDTO,HttpSession session) throws Exception{
		//폴더 파일 삭제
		reviewFileDTO=reviewDAO.getFileDetail(reviewFileDTO);
		boolean flag=fileManager.fileDelete(reviewFileDTO, "/resources/upload/review/", session);
		
		if(flag) {
			
			
			//db삭제
			return reviewDAO.setFileDelete(reviewFileDTO);
		}
		return 0;
	}
	
		
	
	public List<ReviewDTO> list() throws Exception {
		
		return reviewDAO.list();
	}
	public List<ReviewDTO> myList() throws Exception { 
		  
	 return reviewDAO.myList();
 	}
 //게시물 작성
	 public int add(ReviewDTO reviewDTO, MultipartFile[] photos, HttpSession session, Model model)throws Exception{
	 
	 return reviewDAO.add(reviewDTO);
 }
//게시물 조회

 	public ReviewDTO view(Long reviewNum) throws Exception {

 	return reviewDAO.view(reviewNum);
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
