package com.biz.ajax.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class BookControllerTest {

	MockMvc mockMvc;
	
	@InjectMocks
	BookController bookController;
	
	@Before
	public void setUp() throws Exception {
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(bookController).build();
	}

	@Test
	public void testInsertBad() throws Exception {
		
		/*
		 * book/insert를 호출하면서 도서가격을 숫자형 문자열이 아닌 빈값을 전달했다
		 * 이때 controller는 응답코드로 400 오류를 보낸다 따라서 아래 테스트코드는 실패해야 한다
		 */
		mockMvc.perform(post("/book/insert")
				.param("b_title","자바야놀자")
				.param("b_comp","길벗")
				.param("b_price","")
				)
		.andExpect(status().is(HttpStatus.BAD_REQUEST.value()));
		//.andExpect(status().isOk());
	}
	
	
	@Test
	public void testInsertOK() throws Exception {
		
		/*
		 * book/insert를 호출하면서 도서가격을 숫자형 문자열이 아닌 빈값을 전달했다
		 * 이때 controller는 응답코드로 400 오류를 보낸다 따라서 아래 테스트코드는 실패해야 한다
		 */
		mockMvc.perform(post("/book/insert")
				.param("b_title","자바야놀자")
				.param("b_comp","길벗")
				.param("b_price","15000")
				)
		//.andExpect(status().is(HttpStatus.BAD_REQUEST.value()));
		.andExpect(status().isOk());
	}

}
