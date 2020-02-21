package com.biz.shop.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.shop.domain.ProductVO;
import com.biz.shop.service.ProductService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping(value = "/user/product")
@Controller
public class B2C_Controller {
	
	private final ProductService pService;
	
	@RequestMapping(value = "/list",method=RequestMethod.GET)
	public String list(Model model) {
		
		List<ProductVO> proList = pService.selectAll();
		model.addAttribute("B2C_LIST",proList);
		model.addAttribute("BODY", "ULIST");
		return "admin/main";
	}
	
	
	@RequestMapping(value = "/detail/{id}",method=RequestMethod.GET)
	public String detail(@PathVariable("id") String strId, Model model) {
		
		long id = Long.valueOf(strId);
		ProductVO pVO = pService.findById(id);
		model.addAttribute("pVO", pVO);
		model.addAttribute("BODY", "UDETAIL");
		return "admin/main";
	}

}
