package com.biz.sec.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.biz.sec.domain.UserDetailsVO;
import com.biz.sec.domain.UserVO;
import com.biz.sec.persistance.UserDao;

@Service
public class UserService {

	// @Autowirted
	private final PasswordEncoder passwordEncoder;
	private final UserDao userDao;
	
	public UserService(PasswordEncoder passwordEncoder, UserDao userDao) {
		super();
		this.passwordEncoder = passwordEncoder;
		this.userDao = userDao;
		
		// IF NOT EXISTS 테이블이 존재하면 서버를 다시 시작해도 테이블을 새로 만들지 않고 없으면 새로 만듬 
		String create_user_table ="CREATE TABLE IF NOT EXISTS tbl_users (" + 
				"	id bigint PRIMARY KEY AUTO_INCREMENT, " + 
				"	user_name VARCHAR(50) UNIQUE, " + 
				"   user_pass VARCHAR(125), " + 
				"   enabled boolean default true, " +
				"   email VARCHAR(50), " + 
				"   phone VARCHAR(20), " + 
				"   address VARCHAR(125) " + 
				") ";
		
		String create_auth_table = "CREATE TABLE IF NOT EXISTS authorities (" + 
				"	id bigint PRIMARY KEY AUTO_INCREMENT," + 
				"	username VARCHAR(50)," + 
				"	authority VARCHAR(50)" + 
				")";
		
		
		userDao.create_table(create_user_table);
		userDao.create_table(create_auth_table);
	}

	/**
	 * @since 2020-04-09
	 * @author uijae
	 * 
	 * @param username
	 * @param password
	 * @return 
	 * 
	 * 회원가입을 신청하면 비밀번호는 암호화하고
	 * 아이디와 비번을 DB insert 수행
	 * 
	 * @update 2020-04-10
	 * Map<String,String> 구조의 VO 데이터를
	 * UserVO로 변경
	 * 
	 */
	public int insert(String username, String password) {
		
		// 회원가입 form에서 전달받은 password 값을 암호화 시키는 과정
		String encPassword = passwordEncoder.encode(password);
		UserVO userVO = UserVO.builder()
							.username(username)
							.password(encPassword).build();
		
		int ret = userDao.insert(userVO);
		return ret;
	
	}

	public boolean isExistsUserName(String username) {
		
		UserDetailsVO userVO = userDao.findByUserName(username);
		// 이미 DB에 회원정보(username)가 저장되어 있다.
		if(userVO != null && userVO.getUsername().equalsIgnoreCase(username)) {
			return true;
		}
		return false;
	
	}

	public UserDetailsVO findById(long id) {
		UserDetailsVO userVO = userDao.findById(id);
		
		
		return userVO;
	}

}






