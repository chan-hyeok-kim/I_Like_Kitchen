package com.ham.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ham.main.file.FileDTO;
import com.ham.main.notice.NoticeFileDTO;
import com.ham.main.partner.PartnerDTO;


import com.ham.main.product.book.BookDTO;

import com.ham.main.util.FileManager;
import com.ham.main.util.Pager;

@Service
public class ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	
	public List<ProductDTO> getList(Pager pager)throws Exception{
		pager.makeRowNum();
		Long total = productDAO.getTotal(pager);
		pager.makePageNum(total);
		return productDAO.getList(pager);
	}
	
	public ProductDTO getDetail(ProductDTO productDTO)throws Exception{
		return productDAO.getDetail(productDTO);
	}
	
	public int setAdd(ProductDTO productDTO, MultipartFile[] files, HttpSession session)throws Exception{
		String path = "/resources/upload/product/";
		int result = productDAO.setAdd(productDTO);
		for(MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			System.out.println(multipartFile);
			String fileName = fileManager.fileSave(path, session, multipartFile);
			ProductFileDTO productFileDTO = new ProductFileDTO();
			productFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			productFileDTO.setFileName(fileName);
			productFileDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setFileAdd(productFileDTO);
		}
		System.out.println(path);
		return result;
	}
	
	public int setDelete(Long num)throws Exception{
		return productDAO.setDelete(num);
	}
	
	public List<ProductDTO> getInfo(PartnerDTO partnerDTO) throws Exception{
		return productDAO.getInfo(partnerDTO);
	}
	
	public int setUpdate(ProductDTO productDTO, MultipartFile[] files, HttpSession session) throws Exception{
		int result = productDAO.setUpdate(productDTO);
		String path = "/resources/upload/product/";
		for (MultipartFile multipartFile: files) {
			if(multipartFile.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, session, multipartFile);
			ProductFileDTO productFileDTO = new ProductFileDTO();
			productFileDTO.setOriginalName(multipartFile.getOriginalFilename());
			productFileDTO.setFileName(fileName);
			productFileDTO.setProductNum(productDTO.getProductNum());
			result = productDAO.setFileAdd(productFileDTO);
		}
		return result;
	}
	
	public int setFileDelete(ProductFileDTO productFileDTO, HttpSession session) throws Exception {
		//폴더파일 삭제
		productFileDTO = productDAO.getFileDetail(productFileDTO);
		boolean flag = fileManager.fileDelete(productFileDTO, "/resources/upload/product/", session);
		
		if(flag) {
			//DB삭제
			return productDAO.setFileDelete(productFileDTO);
		}
		return 0;
	}
	
	public String setContentsImg(MultipartFile file, HttpSession session)throws Exception {
		String path = "/resources/upload/product/";
		String fileName = fileManager.fileSave(path, session, file);
		
		return path+fileName;
	}

	public boolean setContentsImgDelete(String path, HttpSession session) throws Exception {
		String fileName = path.substring(path.lastIndexOf("/")+1);
		path = path.substring(0,path.lastIndexOf("/")+1);
		
		FileDTO fileDTO = new FileDTO();
		fileDTO.setFileName(fileName);
		
    	return fileManager.fileDelete(fileDTO, path, session);
	}
}
