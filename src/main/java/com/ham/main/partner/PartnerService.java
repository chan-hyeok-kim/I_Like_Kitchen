package com.ham.main.partner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerService {
	
	@Autowired
	private PartnerDAO partnerDAO;
	
	public int setPartnerJoin(PartnerDTO partnerDTO) throws Exception {
		return partnerDAO.setPartnerJoin(partnerDTO);
	}
	
	public int setMemberRole(PartnerDTO partnerDTO) throws Exception {
		return partnerDAO.setMemberRole(partnerDTO);
	}
}
