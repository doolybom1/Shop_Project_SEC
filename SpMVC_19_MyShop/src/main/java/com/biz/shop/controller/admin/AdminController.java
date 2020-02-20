package com.biz.shop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.shop.domain.ProductVO;
import com.biz.shop.service.ProductService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping(value="/admin")
public class AdminController {

	private final ProductService pService;
	@RequestMapping(value= {"","/"},method = RequestMethod.GET)
	public String main(Model model) {
		List<ProductVO> pList = pService.selectAll();
		model.addAttribute("PRO_LIST", pList);
		return "admin/main";
	}
	
//	@RequestMapping(value="/product",method=RequestMethod.GET)
	public String admin(Model model) {
		
		model.addAttribute("BODY", "PRODUCT");
		return "admin/main";
	}
}
