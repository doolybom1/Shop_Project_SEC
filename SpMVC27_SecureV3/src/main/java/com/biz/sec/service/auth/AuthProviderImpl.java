package com.biz.sec.service.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.biz.sec.domain.UserDetailsVO;

public class AuthProviderImpl implements AuthenticationProvider{

	@Autowired
	@Qualifier("userDetailsService")
	private UserDetailsService userDService;
	
	// security-context에 bean으로 등록되어 있다
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	/*
	 * spring security에서 커스터마이징을 수행하여 로그인을 세세히 제어하고자 할때 코드를 작성해야하는 중요한 메서드
	 */
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		/*
		 * authentication으로부터 로그인 폼에서 보낸 username과 password를 추출
		 */
		String username = (String) authentication.getPrincipal();
		String password = (String) authentication.getCredentials();
		
		// Service -> Dao 를 통해서 DB로부터 사용자 정보 가져오기
		UserDetailsVO user = (UserDetailsVO) userDService.loadUserByUsername(username);
		if(!passwordEncoder.matches(password, user.getPassword())) {
			throw new BadCredentialsException("비밀번호 오류");
		}
		
		// enabled가 false이면, 사용금지된 username일 경우
		if(!user.isEnabled()) {
			throw new BadCredentialsException(username + ": 접근권한없음");
		}
		
		// UserDetailsService에서 보내준 사용자 정보를 Controller로 보내는 일을 수행
		return new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return true;
	}

}
