package com.ham.main.product;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductDTO {
	
	private Long productNum;
	private Long partnerNum;
	private String productName;
	private String contents;
	private Date regDate;
	private String address;
	private Long tel;
	private Long price;
	private List<ProductFileDTO> productFileDTOs;
	

	
 

}
