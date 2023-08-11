package com.iu.main.bankBook.bookAccount;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iu.main.member.MemberDTO;
import com.iu.main.util.Pager;

@Service
public class BookAccountService {
	
	@Autowired
	private BookAccountDAO bookAccountDAO;
	
	public List<BookAccountDTO> getList(MemberDTO memberDTO, Pager pager)throws Exception{
		pager.setPerPage(3L);
		pager.makeRowNum();
		
		pager.makePageNum(bookAccountDAO.getTotal());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member", memberDTO);
		map.put("pager", pager);
		
		return bookAccountDAO.getList(map);
	}
	
	public int setAdd(BookAccountDTO bookAccountDTO)throws Exception{
		Calendar ca = Calendar.getInstance();
		
		bookAccountDTO.setAccount(ca.getTimeInMillis());
		
		return bookAccountDAO.setAdd(bookAccountDTO);
		
	}
	
	
	

}
