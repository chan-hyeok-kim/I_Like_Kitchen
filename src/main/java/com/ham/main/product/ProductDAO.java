package com.ham.main.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ham.main.util.Pager;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.ham.main.product.ProductDAO.";
	
	public Long getTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotal", pager);
	}
	
	public List<ProductDTO> getList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", pager);
	}

	public ProductDTO getDetail(ProductDTO productDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getDetail", productDTO);
	}
	
	public int setAdd(ProductDTO productDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", productDTO);
	}
	
	public int setFileAdd(ProductFileDTO productFileDTO)throws Exception{
		
		return sqlSession.insert(NAMESPACE+"setFileAdd", productFileDTO);
	}
	
	public int setDelete(Long num)throws Exception{
		return sqlSession.delete(NAMESPACE+"setDelete", num);
	}
}
