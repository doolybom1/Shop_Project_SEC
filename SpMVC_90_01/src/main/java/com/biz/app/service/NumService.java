package com.biz.app.service;

import org.springframework.stereotype.Service;

import com.biz.app.ScoreVO;

/*
 * Service 클래스
 * @Service annotaion을 설정한 클래스
 * 
 * Controller가 사용자의 요청을 받았는데 
 * 단순한 연산을 수행해서 결과를 보낼 사안이 아닐때 
 * 조금 복잡한 무언가를 수행해야 할때 Controller 의 기능을 보조하는 역할 수행
 */

@Service
public class NumService {

	public int add(int num1, int num2) {
		int sum = 0;
		sum = num1 + num2;
		return sum;
	}

	public int even(int start, int end) {

		int sum = 0;
		for (int i = start; i <= end; i++) {
			if (i % 2 == 0) {
				sum += i;
			}
		}

		return sum;
	}

	public int total(int ko, int en, int ma, int sc, int mu) {
		
		int totalScore = 0;
		totalScore = ko + en + ma + sc + mu;
		
		return totalScore;
	}

	public int avg(int ko, int en, int ma, int sc, int mu) {
		
		int avg = 0;
		avg = total(ko, en, ma, sc, mu) / 5;
		return avg;
	}

	public void score(ScoreVO scoreVO) {

		int sum = scoreVO.getKo();
		sum += scoreVO.getEn();
		sum += scoreVO.getMa();
		sum += scoreVO.getSc();
		sum += scoreVO.getMu();
		
		scoreVO.setSum(sum);
		scoreVO.setAvg(sum / 5);
	}
}
