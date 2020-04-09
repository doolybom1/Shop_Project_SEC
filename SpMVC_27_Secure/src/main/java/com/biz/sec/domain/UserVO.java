package com.biz.sec.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.Setter;

/*
 * Spring Security와 연동하여 회원정보를 관리하기 위한 UserVO는 단독으로 작성하지 않고 UserDetail이라는 interface를 implements하여 작성한다.
 * 그런데, 이렇게하면 많은 양의 코드를 작성해 줘야 한다. 그래서, Spring Security에서 제공하는 User라는 클래스를 상속하여 사용한다.
 * 
 * UserVO는 인스턴스를 생성할때 생성자를 사용하여 초기값을 설정하돌고 디자인 되어있다
 */

public class UserVO extends User {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Getter @Setter
	private String email;
	
	@Getter @Setter
	private String phone;
	
	@Getter @Setter
	private String addr;
	
//	@Getter @Setter
//	private int age;
	
	public UserVO(String username, String password, boolean enabled) {
		super(username, password, enabled, true, true, true, null);
	}
	
	public UserVO(
			String username, 
			String password, 
			boolean enabled,
			String email,
			String phone,
			String addr,
			//int age,
			
			boolean accountNonExpired,
			boolean credentialsNonExpired, 
			boolean accountNonLocked,
			
		Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		this.email = email;
		this.phone = phone;
		this.addr = addr;
		//this.age = age;
		
		
		// TODO Auto-generated constructor stub
	}
	
}
