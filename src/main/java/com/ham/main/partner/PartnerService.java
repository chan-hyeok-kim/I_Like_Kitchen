package com.ham.main.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerService {

	@Autowired
	private PartnerDAO partnerDAO;
	
	public PartnerDTO getDetail(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.getDetail(partnerDTO);
	}
	
}
