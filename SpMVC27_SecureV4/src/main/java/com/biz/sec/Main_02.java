package com.biz.sec;

public class Main_02 {

	/*
	 * 기본형 변수, 객체, 배열 등을 모두 변수라고 할 수 있다
	 * 
	 * type 형 변수 객체나, 배열은 method로 해당 객체나 배열을 전달하고 method에서 객체나 배열의 일부 요소의 값을 변경하면
	 * 원본의 객체나, 배열에 변경한 값이 반영이 된다
	 */
	public static void main(String[] args) {
		Test test = new Test();
		System.out.println(test.addr);
		sub(test);
		System.out.println(test.addr);
	}

	public static void sub(Test t1) {
		t1.addr = "광주";
	}

}

class Test {
	String addr;
}
