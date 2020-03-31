package com.biz.model.service;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.biz.model.domain.UsersVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/*-context.xml"})
public class UserServiceTest {

	@Autowired
	UserService userService;
	
	@Test
	public void getUserTest() {
		UsersVO usersVO = userService.getUser("admin");
		assertEquals(usersVO.getUserId(), "admin");
		assertEquals(usersVO.getUserName(), "홍길동");

		usersVO = userService.getUser("guest");
		assertEquals(usersVO.getUserId(), "guest");
		assertEquals(usersVO.getUserName(), "성춘향");

		usersVO = userService.getUser("dba");
		assertEquals(usersVO.getUserId(), "dba");
		assertEquals(usersVO.getUserName(), "이몽룡");
	}

	@Test
	public void insertTest() {
		UsersVO usersVO = UsersVO.builder()
				.userId("korea")
				.password("12345")
				.userName("대한민국")
				.userRoll("gov")
				.build();
		
		int ret = userService.insert(usersVO);
		assertEquals(ret,1, 0);
		
		
		usersVO = UsersVO.builder()
				.userId("admin")
				.password("12345")
				.userName("홍기동")
				.userRoll("admin")
				.build();
		
		ret = userService.insert(usersVO);
		assertEquals(ret, 1, 0);
		
		
		usersVO = UsersVO.builder()
				.userId("guest")
				.password("12345")
				.userName("성춘향")
				.userRoll("guest")
				.build();
		
		ret = userService.insert(usersVO);
		assertEquals(ret, 1, 0);
		
		
		usersVO = UsersVO.builder()
				.userId("dba")
				.password("12345")
				.userName("낙타")
				.userRoll("dba")
				.build();
		
		ret = userService.insert(usersVO);
		assertEquals(ret, 1, 0);
		
	}
	
	@Test
	public void deleteTest() {
		int ret = userService.delete("admin");
		ret = userService.delete("guest");
		ret = userService.delete("dba");
		ret = userService.delete("korea");
	}
	
	
	
	
	
	
}
