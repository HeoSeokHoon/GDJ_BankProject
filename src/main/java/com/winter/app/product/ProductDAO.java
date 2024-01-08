package com.winter.app.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.winter.app.util.DBConnector;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	public final String namespace="com.winter.app.product.ProductDAO.";
	
	public List<ProductDTO> productList() throws Exception {
		//URL: /product/list, Method: GET, Parameter: X\
		return sqlSession.selectList(namespace+"productList");
	}
	
	public ProductDTO productDetail(ProductDTO pD) throws Exception {
		//URL: /product/detail, Method: GET, Parameter: productNum 
		return sqlSession.selectOne(namespace+"productDetail", pD);
	}
	
	public int productAdd(ProductDTO pD) {
		//URL: /product/add, Method: GET, Parameter: productNum	
		return sqlSession.insert(namespace+"productAdd", pD);
	}
	
	public int productUpdate(ProductDTO pD) {
		//URL: /product/update, Method: GET, Parameter: productNum	
		return sqlSession.update(namespace+"productUpdate", pD);
	}
	
	public int productDelete(ProductDTO pD) {
		return sqlSession.delete(namespace+"productDelete", pD);
	}
	
}
