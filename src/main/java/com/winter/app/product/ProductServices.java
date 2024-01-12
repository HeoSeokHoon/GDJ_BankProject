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

import com.winter.app.util.FileManager;
import com.winter.app.util.Pager;

@Service
public class ProductServices {
	
	@Autowired
	public ProductDAO productDAO;
	
	@Autowired
	public ServletContext servletContext;
	
	@Autowired
	public FileManager fileManager;
	
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
	
	public int productAdd(ProductDTO pD, MultipartFile [] file) throws Exception {
		
		int result = productDAO.productAdd(pD);
		//1. 어디에 저장할 것인가?
		String path = servletContext.getRealPath("resources/upload/product");
		
		for(MultipartFile f:file) {
			
			if(f.isEmpty()) {
				continue;
			}
			String fileName = fileManager.fileSave(path, f);
			//4. DB에 정보 저장
			ProductFileDTO prDto = new ProductFileDTO();
			prDto.setFileName(fileName);
			prDto.setOriName(f.getOriginalFilename());
			prDto.setProductNum(pD.getProductNum());
			result = productDAO.addFile(prDto);			
		}
			
		return result;
	}
	
	public int productUpdate(ProductDTO pD) throws Exception {
		return this.productDAO.productUpdate(pD);
	}
	
	public int productDelete(ProductDTO pD) throws Exception {
		//파일명 조회
		List<ProductFileDTO> ar = productDAO.productDetailFiles(pD);
		
		//DB에서 삭제
		int result = productDAO.productDelete(pD);
		
		
		//HDD에서 삭제
		//경로 생성
		String path = servletContext.getRealPath("/resources/upload/product");
		for(ProductFileDTO f : ar) {
			fileManager.fileDelete(path, f.getFileName());
		}
		return result;
	}
}
