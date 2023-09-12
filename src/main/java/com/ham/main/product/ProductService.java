package com.ham.main.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public int setUpdate(ProductDTO productDTO) throws Exception{
		return productDAO.setUpdate(productDTO);
	}

	public List<ProductDTO> getLowList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total = productDAO.getTotal(pager);
		pager.makePageNum(total);
		
		return productDAO.getLowList(pager);			
	}
	
	public List<ProductDTO> getHighList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total = productDAO.getTotal(pager);
		pager.makePageNum(total);
		
		return productDAO.getHighList(pager);			
	}
	
}
