package com.biz.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.biz.app.AddrVO;

@Service
public class AddrService {

	public List<AddrVO> addrListAll(){
		
		List<AddrVO> addrList = new ArrayList<AddrVO>();
		
		AddrVO addrVO = new AddrVO();
		addrVO.setName("홍길동");
		addrVO.setTel("000-111-1111");
		addrVO.setPost("60001");
		addrVO.setCity("광주광역시");
		addrVO.setAddr("반");
		addrList.add(addrVO);
		
		addrVO = new AddrVO();
		addrVO.setName("이몽룡");
		addrVO.setTel("000-222-2222");
		addrVO.setPost("6231");
		addrVO.setCity("서울특별시");
		addrVO.setAddr("정");
		addrList.add(addrVO);
		
		addrVO = new AddrVO();
		addrVO.setName("장길산");
		addrVO.setTel("000-333-3333");
		addrVO.setPost("60004");
		addrVO.setCity("부산광역시");
		addrVO.setAddr("민");
		addrList.add(addrVO);
		
		return addrList;
	}
}
