package com.biz.app;

public class ScoreVO {
	private int ko;
	private int en;
	private int ma;
	private int sc;
	private int mu;
	
	private int sum;
	private int avg;
	
	public ScoreVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ScoreVO(int ko, int en, int ma, int sc, int mu, int sum, int avg) {
		super();
		this.ko = ko;
		this.en = en;
		this.ma = ma;
		this.sc = sc;
		this.mu = mu;
		this.sum = sum;
		this.avg = avg;
	}

	public int getKo() {
		return ko;
	}
	public void setKo(int ko) {
		this.ko = ko;
	}
	public int getEn() {
		return en;
	}
	public void setEn(int en) {
		this.en = en;
	}
	public int getMa() {
		return ma;
	}
	public void setMa(int ma) {
		this.ma = ma;
	}
	public int getSc() {
		return sc;
	}
	public void setSc(int sc) {
		this.sc = sc;
	}
	public int getMu() {
		return mu;
	}
	public void setMu(int mu) {
		this.mu = mu;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public int getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	@Override
	public String toString() {
		return "ScoreVO [ko=" + ko + ", en=" + en + ", ma=" + ma + ", sc=" + sc + ", mu=" + mu + ", sum=" + sum
				+ ", avg=" + avg + "]";
	}
	
	
}
