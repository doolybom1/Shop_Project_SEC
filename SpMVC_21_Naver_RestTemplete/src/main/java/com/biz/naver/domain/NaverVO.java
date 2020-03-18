package com.biz.naver.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString

public class NaverVO {
	//뉴스
	private String title; 
	private String originallink; 
	private String link; 
	private String description;
	private String pubDate; 
	
	
	//영화
	private String image;
	private String subtitle;
	private String director;
	private String actor; 
	private String userRating;
	 
	 //영화
	private String author; 
	private String price; 
	private String discount;
	private String publisher; 
	private String pubdate; 
	private String isbn; 
}
