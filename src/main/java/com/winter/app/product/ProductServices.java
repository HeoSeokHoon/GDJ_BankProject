package com.winter.app.product;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.winter.app.util.Pager;

@Service
public class ProductServices {
	
	@Autowired
	public ProductDAO productDAO;
	
	@Autowired
	public ServletContext servletContext;
	
	public List<ProductDTO> productList(Pager pager) throws Exception {
		pager.makeRow();
		Long totalCount = productDAO.totalData();
		pager.makeNum(totalCount);
		List<ProductDTO> ar = this.productDAO.productList(pager);
		
		return ar;
	}
	
	public ProductDTO productDetail(ProductDTO pD) throws Exception {
		return this.productDAO.productDetail(pD);
	}
	
	public int productAdd(ProductDTO pD, MultipartFile file) throws Exception {
		
		int result = productDAO.productAdd(pD);
		//1. 어디에 저장할 것인가?
		String path = servletContext.getRealPath("resources/upload");
		System.out.println(path);
		File f = new File(path, "product");
		if(!f.exists()) {
			f.mkdirs();
		}
		//2. 어떤 파일 명으로 저장할 것인가?
			//a. 시간을 이용
		Calendar ca = Calendar.getInstance();
		String fileName = ca.getTimeInMillis()+"_"+file.getOriginalFilename();
		System.out.println(fileName);
			//b. UUID
		fileName = UUID.randomUUID().toString()+"_"+file.getOriginalFilename();
		System.out.println(fileName);
		//3. 파일을 저장
			//a. FileCopyUtils 클래스 사용
		f = new File(f, fileName);
		FileCopyUtils.copy(file.getBytes(), f);
		
		//4. DB에 정보 저장
		ProductFileDTO prDto = new ProductFileDTO();
		prDto.setFileName(fileName);
		prDto.setOriName(file.getOriginalFilename());
		prDto.setProductNum(pD.getProductNum());
		result = productDAO.addFile(prDto);
	
		return result;
	}
	
	public int productUpdate(ProductDTO pD) throws Exception {
		return this.productDAO.productUpdate(pD);
	}
	
	public int productDelete(ProductDTO pD) throws Exception {
		return this.productDAO.productDelete(pD);
	}
}
