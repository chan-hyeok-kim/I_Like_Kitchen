package com.ham.main.partner;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.main.member.MemberDTO;
import com.ham.main.util.Pager;

@Service
public class PartnerService {

	
	@Autowired
	private PartnerDAO partnerDAO;
	
	public int setPartnerJoin(PartnerDTO partnerDTO) throws Exception {
		return partnerDAO.setPartnerJoin(partnerDTO);
    }

	public PartnerDTO getDetail(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.getDetail(partnerDTO);
	}
	
	public List<PartnerDTO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(partnerDAO.getTotal());
		
		return partnerDAO.getList(pager);
	}
	
	public int setPermitUpdate(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.setPermitUpdate(partnerDTO);
	}
	
	public int setDeleteUpdate(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.setDeleteUpdate(partnerDTO);
	}
	
	public PartnerDTO getPartnerInfo(String id) throws Exception{
		return partnerDAO.getPartnerInfo(id);
	}
	
	public int setUpdate(PartnerDTO partnerDTO) throws Exception{
		return partnerDAO.setUpdate(partnerDTO);
	}
	
	public List<PartnerDTO> getPermitList(Pager pager) throws Exception{
		pager.makeRowNum();
		pager.makePageNum(partnerDAO.getPermitTotal());
		
		return partnerDAO.getPermitList(pager);
	}
	
    
	
}
