package com.ham.main.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
    public ProductDTO getDetail(ProductDTO productDTO) throws Exception{
	    return productDAO.getDetail(productDTO);
	}
}
