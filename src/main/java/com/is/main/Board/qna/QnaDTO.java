package com.is.main.Board.qna;

import java.util.List;

import com.is.main.Board.BoardDTO;

public class QnaDTO extends BoardDTO{
	
	
	private List<QnaFileDTO> dtos;
	private Long ref;
	private Long step;
	private Long depth;
	
	
	
	public List<QnaFileDTO> getDtos() {
		return dtos;
	}
	public void setDtos(List<QnaFileDTO> dtos) {
		this.dtos = dtos;
	}
	public Long getRef() {
		return ref;
	}
	public void setRef(Long ref) {
		this.ref = ref;
	}
	public Long getStep() {
		return step;
	}
	public void setStep(Long step) {
		this.step = step;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	
	

}