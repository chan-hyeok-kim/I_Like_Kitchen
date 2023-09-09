package com.ham.main.partner;

import java.sql.Date;



import com.ham.main.product.ProductDTO;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data

public class PartnerDTO {

	private Long partnerNum;
	private String id;
	private String partnerEmail;
	private Long partnerAccount;
	private Date partnerDate;
	private String partnerName;
	private String companyName;
	private String partnerPhone;
    private Integer partnerCheck;
	private ProductDTO productDTO;


	
}
