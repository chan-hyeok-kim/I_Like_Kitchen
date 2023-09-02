package com.ham.main.partner;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PartnerService {

	
	@Autowired
	private PartnerDAO partnerDAO;
	
	public int setPartnerRegisterJoin(PartnerDTO partnerDTO) throws Exception {
		return partnerDAO.setPartnerRegisterJoin(partnerDTO);
  }


	
	public PartnerDTO getDetail(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.getDetail(partnerDTO);
	}
	
	public List<PartnerDTO> getList(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.getList(partnerDTO);
	}
	
	public int setPermitUpdate(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.setPermitUpdate(partnerDTO);
	}
	
	public PartnerDTO getPartnerInfo(String id) throws Exception{
		return partnerDAO.getPartnerInfo(id);
	}
	
}
