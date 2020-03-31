package com.biz.model.service;

import org.springframework.stereotype.Service;

import com.biz.model.dao.UserDao;
import com.biz.model.domain.UsersVO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {

	private final UserDao userDao;
	
	public UsersVO getUser(String userId) {
//		UsersVO usersVO = UsersVO.builder()
//				.userId("admin")
//				.password("12345")
//				.userName("홍길동")
//				.userRoll("admin")
//				.build();
		UsersVO usersVO = userDao.findByUserId("admin");
		if(userId.equals("admin")) {
			return usersVO;
		}else if(userId.equals("guest")) {
//			usersVO.setUserId("guest");
//			usersVO.setUserName("성춘향");
			usersVO =userDao.findByUserId("guest");
		}else if(userId.equals("dba")) {
//			usersVO.setUserId("dba");
//			usersVO.setUserName("이몽룡");
			usersVO =userDao.findByUserId("dba");
		}else {
			usersVO  = null;
		}
		return usersVO;
	}
	
	
	/*
	 * insert 메서드는 UsersVO에 담긴 데이터를 받아서 insert를 수행한 후 결과를 return 하도록 되어있다.
	 * return 한 값은 데이터가 1개 이므로 정수 1이 된다. 이러한 테스트코드를 만들기 위해서 일단 가상으로 return 1의 코드를 추가
	 */
	public int insert(UsersVO usersVO) {
		return userDao.insert(usersVO);
	}


	public int delete(String userId) {
		return userDao.delete(userId); 
	}
	
}
