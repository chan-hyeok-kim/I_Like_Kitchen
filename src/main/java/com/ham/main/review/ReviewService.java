package com.ham.main.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.file.FileDTO;
import com.ham.main.notice.NoticeDTO;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.util.FileManager;
import com.ham.main.util.Pager;

@Service
public class ReviewService {

	@Autowired
 	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
 


	
		
	
	public List<ReviewDTO> list(Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(reviewDAO.getTotal(pager));
		
		return reviewDAO.list(pager);
	}
 //게시물 작성
	public int add(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = reviewDAO.add(reviewDTO);
		
		String path = "/resources/upload/review/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
				
				reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
				reviewFileDTO.setFileName(fileName);
				reviewFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = reviewDAO.setFileAdd(reviewFileDTO);
			}
		}
		
		return result;
	}
//게시물 조회

 	public ReviewDTO view(Long reviewNum) throws Exception {

 	return reviewDAO.view(reviewNum);
}
 	
 	
 // 게시물 수정
 	public int update(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = reviewDAO.update(reviewDTO);
		
		String path = "/resources/upload/review/";
		
		for(MultipartFile file: files) {
			if(!file.isEmpty()) {
				String fileName = fileManager.fileSave(path, session, file);
				ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
				
				reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
				reviewFileDTO.setFileName(fileName);
				reviewFileDTO.setOriginalName(file.getOriginalFilename());
				
				result = reviewDAO.setFileAdd(reviewFileDTO);
			}
		}
		
		return result;
	}
 	
 // 게시물 삭제
 	public int delete(long reviewNum) throws Exception {
 	
 		return reviewDAO.delete(reviewNum);
 	}




	// file(파일)
		public int setFileDelete(ReviewFileDTO reviewFileDTO, HttpSession session) throws Exception {
			reviewFileDTO = reviewDAO.getFileDetail(reviewFileDTO);
			boolean flag = fileManager.fileDelete(reviewFileDTO, "/resources/upload/notice", session);
			
			if(flag) {
				return reviewDAO.setFileDelete(reviewFileDTO);
			}
			
			return 0;
		}
		public List<ReviewDTO> list(Long reviewNum) {
			// TODO Auto-generated method stub
			return null;
		}


}
