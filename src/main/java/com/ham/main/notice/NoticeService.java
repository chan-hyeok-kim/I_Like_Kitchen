package com.ham.main.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noDAO;
	
	
	public List<NoticeDTO> getList() throws Exception{
		
		return noDAO.getList();
	}
	
	public NoticeDTO getDetail(NoticeDTO noDTO) throws Exception{
		
		return noDAO.getDetail(noDTO);
	}
	
	public int setAdd(NoticeDTO noDTO) {
		
		return noDAO.setAdd(noDTO);
	}
	
}
