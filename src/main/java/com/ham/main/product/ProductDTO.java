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
	private String phone;
	private Long price;
	private List<ProductFileDTO> productFileDTOs;
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Long getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(Long partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public List<ProductFileDTO> getProductFileDTOs() {
		return productFileDTOs;
	}
	public void setProductFileDTOs(List<ProductFileDTO> productFileDTOs) {
		this.productFileDTOs = productFileDTOs;
	}
	

	
 

}
