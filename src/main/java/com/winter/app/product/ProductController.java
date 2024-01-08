package com.winter.app.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	@Autowired
	private ProductServices productServices;
	
	//list
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView productList (ModelAndView mv) throws Exception{
		List<ProductDTO> ar = productServices.productList();
		
		mv.addObject("list", ar);
		mv.setViewName("product/list");
		
		return mv;
	}
	
	//detail
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public ModelAndView productDetail(ProductDTO pD, ModelAndView mv) throws Exception {
		pD = productServices.productDetail(pD);
		
		mv.addObject("detail", pD);
		mv.setViewName("product/detail");

		return mv;
	}
	
	//Add
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String productAdd(ProductDTO pD, Model model) throws Exception {
		int result = this.productServices.productAdd(pD);
		String msg = "등록 실패";
		if(result>0) {
			msg = "등록 성공";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("path", "./list");
		
		return "commons/result";
	}
	
	//Add
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String productAdd() {
		return "product/add";
	}
	
	//Update
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String productUpdate(ProductDTO pD, Model model) throws Exception {
		pD = productServices.productDetail(pD);
		model.addAttribute("dto", pD);
		return "product/update";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public ModelAndView productUpdate(ProductDTO pD, ModelAndView mv) throws Exception {
		int result = productServices.productUpdate(pD);
		String msg = "수정 실패";
		if(result>0){
			msg="수정 성공";
		}
		mv.addObject("msg", msg);
		mv.addObject("path","./list");
		mv.setViewName("commons/result");
		
		return mv;
	}
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public ModelAndView productDelete(ProductDTO pD, ModelAndView mv) throws Exception {
		int result = this.productServices.productDelete(pD);
		String msg = "삭제 실패";
		if(result>0) {
			msg = "삭제 성공";
		}
		mv.addObject("msg", msg);
		mv.addObject("path","./list");
		mv.setViewName("commons/result");
		
		return mv;
	}
	
}
