package com.ham.main.review;

import com.ham.main.file.FileDTO;

public class ReviewFileDTO extends FileDTO {
	
	private Long reviewNum;

	public Long getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(Long reviewNum) {
		this.reviewNum = reviewNum;
	}
}
