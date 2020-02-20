package com.biz.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.biz.app.ScoreVO;
import com.biz.app.service.NumService;

@RequestMapping(value = "/number")
@Controller
public class NumberController {
	
	@Autowired
	NumService nService;
	
	@ResponseBody
	@RequestMapping(value = "/add", produces = "text/html;charset=UTF-8")
	public String add() {
		
//		NumService num = new NumService();
//		int ret = num.add(30, 40);
		
		int ret = nService.add(30, 40);
		return "두수의 덧셈" + ret;
	}
	
	/*
	 * 	/number/even이라고 요청을 하면 1 ~ 100까지 숫자 중에서 짝수의 덧셈만 수행하여 결과를 알려주겠다
	 */
	
	@ResponseBody
	@RequestMapping(value = "/even", produces = "text/html;charset=UTF-8")
	public String even() {
		
		int start = 1;
		int end = 100;
		int even = nService.even(start,end);
		
		String res = String.format("%d 부터 %d까지의 숫자중 짝수의 합 : %d", start, end, even);
		
		return res;
	}

	/*
	 * 사용자가 요청한 변수=값의 형태는 무조건 값이 문자열이다
	 * 매개변수 type int 형으로 선언을 하면 spring은 사용자의 변수를 수신한 후 Integer.valueOf(변수) 코드를 실행하여
	 * 문자열을 숫자로 변환시키려 시도를 한다.
	 * 
	 * 그런데, 수신한 값이 숫자로 변환이 불가능하면 사용자에게 400 오류를 전송
	 * 
	 */
	
	@ResponseBody
	@RequestMapping(value = "/num2even", produces = "text/html;charset=UTF-8")
	public String even(String start , String end) {
		
		int intStart = 0;
		int intEnd = 0;
		try {
			 intStart = Integer.valueOf(start);
			 intEnd = Integer.valueOf(end);
			
		} catch (Exception e) {
			return "전송된 값을 숫자로 변환할 수 없습니다";
		}
		
		int even = nService.even(intStart,intEnd);
		
		String res = String.format("%d 부터 %d까지의 숫자중 짝수의 합 : %d", intStart, intEnd, even);
		
		return res;
	}
	
	/*
	 * 국어, 영어, 수확, 과학, 음악 점수를 request로 받아서 총점과 평균을 계산한 후 response
	 */
	
	@ResponseBody
	@RequestMapping(value = "/score",produces = "text/html;charset=UTF-8")
	public String score(String ko, String en, String ma, String sc, String mu) {
		
		int intko = 0;
		int inten = 0;
		int intma= 0;
		int intsc = 0;
		int intmu = 0;
		try {
			intko = Integer.valueOf(ko);
			inten = Integer.valueOf(en);
			intma = Integer.valueOf(ma);
			intsc = Integer.valueOf(sc);
			intmu = Integer.valueOf(mu);
		} catch (Exception e) {
			return "전송된 값을 숫자로 변환할 수 없습니다";
		}
		
		int total = nService.total(intko,inten,intma,intsc,intmu);
		int avg = nService.avg(intko,inten,intma,intsc,intmu);
		
		String res = String.format("총점은 %d 평균은 %d 입니다", total, avg);
		return res;
	}

	@RequestMapping(value = "/score_jsp",produces = "text/html;charset=UTF-8")
	public String score_jsp(int ko, int en, int ma, int sc, int mu, Model model) {
		
		int total = nService.total(ko,en,ma,sc,mu);
		int avg = nService.avg(ko,en,ma,sc,mu);
		
		model.addAttribute("SUM", total);
		model.addAttribute("AVG", avg);

		return "score";
	}
	
	/*
	 * 사용자는 학생의 점수를 입력하여 총점과 평균 계산을 하고 싶다고 요청을 한다
	 * 그러면 학생의 과목 점수를 입력할 수 있는 화면을 보내는 역할을 한다
	 */
	@RequestMapping(value = "/score_input",method=RequestMethod.GET)
	public String score_input() {
		return "score_input";
	}

	
	@RequestMapping(value = "/score_input",method=RequestMethod.POST)
	public String score_input(ScoreVO scoreVO, Model model) {
		
		nService.score(scoreVO);
		model.addAttribute("scoreVO", scoreVO);
		return "score_input";
	}
	
}
