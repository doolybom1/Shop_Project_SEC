package com.biz.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.ajax.domain.BookVO;

@RequestMapping(value = "/book")
@Controller
public class BookController {

	@RequestMapping(value = "/input",method=RequestMethod.GET)
	public String input(BookVO bookVO, Model model) {

		/*
		 * @ResponseBody 가 없는 controller의 메서드의 return 값은 문자열.jsp 파일을 찾으라는 것이다.
		 * return 값이 null이면 현재 메서드를 호출할때 사용한 url의 path(book/input)를 문자열로 인식하고
		 * 
		 */
		return null;
	}

	@RequestMapping(value = "/insert",method=RequestMethod.GET)
	public String insert(BookVO bookVO, Model model) {
		return "book_insert";
	}

	@RequestMapping(value = "/insert",method=RequestMethod.POST)
	public String insert(BookVO bookVO) {
		return "home";
	}
}
