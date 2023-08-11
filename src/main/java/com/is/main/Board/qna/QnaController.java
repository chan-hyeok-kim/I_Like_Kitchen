package com.is.main.Board.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.is.main.Board.BoardDTO;
import com.is.main.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	@ModelAttribute("board")
	public String getBoardName() {
		return "qna";
	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(Pager pager, Model model)throws Exception{
		List<BoardDTO> ar =  qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		return "board/list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String setAdd()throws Exception{
		return "board/add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String setAdd(QnaDTO qnaDTO, MultipartFile[] photos, HttpSession session)throws Exception{
		int result = qnaService.setAdd(qnaDTO, photos, session);
		return "redirect:./list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String setAdd(QnaDTO qnaDTO, Model model)throws Exception{
		BoardDTO boardDTO = qnaService.getDetail(qnaDTO);
		System.out.println(boardDTO.getContents());
		model.addAttribute("dto", boardDTO);
		return "board/detail";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.GET)
	public String setReply(Long num, Model model)throws Exception{
		model.addAttribute("num", num);
		return "board/reply";
	}
	
	@RequestMapping(value = "reply", method = RequestMethod.POST)
	public String setReply(QnaDTO qnaDTO, MultipartFile[] photos, HttpSession session)throws Exception{
		int result = qnaService.setReplyAdd(qnaDTO, photos, session);
		return "board/reply";
	}	
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public ModelAndView setUpdate(QnaDTO qnaDTO,Model model)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("qna/update");
		mv.addObject("dto", qnaDTO);
		return mv;
	}
	
	//update
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String setUpdate(QnaDTO qnaDTO)throws Exception{
		int result = qnaService.setUpdate(qnaDTO);
	
		return "redirect:./detail?qnaNum="+qnaDTO.getNum();
	}
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String setDelete(@RequestParam(name = "setDelete") BoardDTO num)throws Exception{
		int result = qnaService.setDelete(num);
		
		return "redirect:./list";
	}
}