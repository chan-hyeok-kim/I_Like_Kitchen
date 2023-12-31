package com.ham.main.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.file.FileDTO;
import com.ham.main.notice.NoticeDTO;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.product.book.BookDTO;
import com.ham.main.question.QuestionDTO;
import com.ham.main.util.FileManager;
import com.ham.main.util.Pager;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;

	@Autowired
	private FileManager fileManager;

	public int setAdd(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = reviewDAO.add(reviewDTO);
		String path = "/resources/upload/review/";

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, session, multipartFile);
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
			result = reviewDAO.setFileAdd(reviewFileDTO);
		}

		return result;
	}

	public List<ReviewDTO> list(Pager pager, ReviewDTO reviewDTO) throws Exception {

		pager.makeRowNum();
		pager.makePageNum(reviewDAO.getTotal(reviewDTO));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("kto", reviewDTO);
		return reviewDAO.list(map);
	}

	public List<ReviewDTO> myList(ReviewDTO reviewDTO, Pager pager) throws Exception {
		pager.makeRowNum();
		pager.makePageNum(reviewDAO.getMyReviewTotal(reviewDTO));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pager", pager);
		map.put("kto", reviewDTO);

		return reviewDAO.myList(map);
	}

//게시물 조회

	public ReviewDTO view(Long reviewNum) throws Exception {

		return reviewDAO.view(reviewNum);
	}

	// 게시물 수정
	public int update(ReviewDTO reviewDTO, MultipartFile[] files, HttpSession session) throws Exception {
		int result = reviewDAO.update(reviewDTO);
		String path = "/resources/upload/review/";

		for (MultipartFile multipartFile : files) {
			if (multipartFile.isEmpty()) {
				continue;
			}
			System.out.println(reviewDTO.getProductNum());
			String fileName = fileManager.fileSave(path, session, multipartFile);
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			reviewFileDTO.setFileName(fileName);
			reviewFileDTO.setReviewNum(reviewDTO.getReviewNum());
			result = reviewDAO.setFileAdd(reviewFileDTO);
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
		boolean flag = fileManager.fileDelete(reviewFileDTO, "/resources/upload/review/", session);

		if (flag) {
			return reviewDAO.setFileDelete(reviewFileDTO);
		}

		return 0;
	}

	public List<ReviewDTO> list(Long reviewNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Long getReviewPermit(BookDTO bookDTO) throws Exception{
		return reviewDAO.getReviewPermit(bookDTO);
	}

}
