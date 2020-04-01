package com.biz.ajax.controller;


import static org.hamcrest.CoreMatchers.is;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.MockitoAnnotations;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import com.biz.ajax.domain.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class UserControllerTest {

	private MockMvc mockMvc;
	
	@InjectMocks
	private UserController userController;
	
	@Before
	public void setUp() throws Exception {
		
		MockitoAnnotations.initMocks(this);
		mockMvc = MockMvcBuilders.standaloneSetup(userController).build();
	}

	@Test
	public void testSaveUser() throws Exception {
		
		UserVO userVO = new UserVO();
		
		
		mockMvc.perform(post("/saveUser")
				.param("userId",userVO.sampleVO().getUserId())
				.param("password",userVO.sampleVO().getPassword())
				.param("userName",userVO.sampleVO().getUserName())
				.param("roll",userVO.sampleVO().getRoll())
			)
			.andExpect(status().isOk())
			.andExpect(model().attributeExists("userVO"))
			.andReturn();
	}
	
	public void sendUserIdTest() throws Exception {
		mockMvc.perform(post("/sendUserId")
				.param("userId", "admin")
				.param("password", "1234")
				.param("userName", "Hong")
				.param("roll", "admin")
				)
		.andExpect(status().isOk())
		.andExpect(content().contentType("application/json;charset=UTF-8")) //(MediaType.APPLICATION_JSON))
		.andExpect(jsonPath("$.userVO.userId").exists())
		.andExpect(jsonPath("$.userVO.userId", is("admin")))
		.andExpect(jsonPath("$.userVO.password").exists())
		.andExpect(jsonPath("$.userVO.password", is("1234")))
		.andExpect(jsonPath("$.userVO.userName").exists())
		.andExpect(jsonPath("$.userVO.roll").exists());
	}

}
