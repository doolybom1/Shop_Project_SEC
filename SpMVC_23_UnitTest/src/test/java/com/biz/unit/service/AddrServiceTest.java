package com.biz.unit.service;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 * spring framework 환경에서 test를 수행하기 위한 초기화 구문
 * @ContextConfiguration
 * spring 프로젝트 bean 등 설정파일을 불러와서 spring 프로젝트 실행환경과 동일하게 테스트를 수행할 수 있도록 설정
 * 
 * locations : context.xml 파일들을 문자열 배열형태로 설정
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/*-context.xml" })
public class AddrServiceTest {

	// spring의 bean으로 설정된 AddrService를 가져와서 사용할 수 있도록 설정
	// 일반적인 spring 프로젝트 실행방법과 동일하게 설정
	@Autowired
	AddrService as;

	@Test
	public void test() {
		Map<String, String> addr = as.getAddr();
		Map<String, String> addr1 = as.getAddr();

		assertEquals(addr1, addr);
	}

	@Test
	public void nameTest() {
		String name = as.getName("홍길동");
		assertEquals("내이름은홍길동입니다", name);
	}

}
