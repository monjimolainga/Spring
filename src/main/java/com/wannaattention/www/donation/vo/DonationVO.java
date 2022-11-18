package com.wannaattention.www.donation.vo;

import java.util.Date;

/**
 * @ClassName : DonationVO.java
 * @Description : 후원하기 컬럼들의 프로퍼티 설정
 *
 * @author 이하영
 * @since 2022. 11. 14.
 * @version 1.0
 * << 개발이력 >>
 *
 *  수정일                           수정자                  수정내용
 *  ------------    --------    ---------------------------
 *  2022.11.14		이하영		최초생성
 */
public class DonationVO {

	// 후원번호
	private int donaNum;
	
	// 후원자 회원번호
	private int donorNum;
	
	// 후원자 구분
	private int donorType;

	// 후원자명
	private String donorName;
	
	// 후원자 이메일
	private String donorEmail;
	
	// 후원자 연락처
	private String donorTel;
	
	// 후원금액
	private int donaAmount;
	
	// 후원타입
	private int donaType;
	
	// 결제수단
	private int payMethod;
	
	//은행명
	private String bankName;
	
	// 계좌번호
	private String accountNum;
	
	// 예금주명
	private String depositorName;
	
	// 출금일
	private Date withDate;
	
	// 소득공제구분
	private int deductType;
	
	// 소득공제번호
	private int deductNum;
	
	// 결제카드
	private String cardName;
	
	// 카드번호
	private String cardNum;
	
	// 유효기간
	private Date expDate;
	
	// 카드주명
	private String cardOwner;
	
	// 생년월일
	private Date birthday;
	
	// 정기결제일자
	private int cardRegPayDate;
	
	// 결제일
	private Date cardPayDate;

	public int getDonaNum() {
		return donaNum;
	}

	public void setDonaNum(int donaNum) {
		this.donaNum = donaNum;
	}

	public int getDonorNum() {
		return donorNum;
	}

	public void setDonorNum(int donorNum) {
		this.donorNum = donorNum;
	}

	public int getDonorType() {
		return donorType;
	}

	public void setDonorType(int donorType) {
		this.donorType = donorType;
	}

	public String getDonorName() {
		return donorName;
	}

	public void setDonorName(String donorName) {
		this.donorName = donorName;
	}

	public String getDonorEmail() {
		return donorEmail;
	}

	public void setDonorEmail(String donorEmail) {
		this.donorEmail = donorEmail;
	}

	public String getDonorTel() {
		return donorTel;
	}

	public void setDonorTel(String donorTel) {
		this.donorTel = donorTel;
	}

	public int getDonaAmount() {
		return donaAmount;
	}

	public void setDonaAmount(int donaAmount) {
		this.donaAmount = donaAmount;
	}

	public int getDonaType() {
		return donaType;
	}

	public void setDonaType(int donaType) {
		this.donaType = donaType;
	}

	public int getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(int payMethod) {
		this.payMethod = payMethod;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getDepositorName() {
		return depositorName;
	}

	public void setDepositorName(String depositorName) {
		this.depositorName = depositorName;
	}

	public Date getWithDate() {
		return withDate;
	}

	public void setWithDate(Date withDate) {
		this.withDate = withDate;
	}

	public int getDeductType() {
		return deductType;
	}

	public void setDeductType(int deductType) {
		this.deductType = deductType;
	}

	public int getDeductNum() {
		return deductNum;
	}

	public void setDeductNum(int deductNum) {
		this.deductNum = deductNum;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public Date getExpDate() {
		return expDate;
	}

	public void setExpDate(Date expDate) {
		this.expDate = expDate;
	}

	public String getCardOwner() {
		return cardOwner;
	}

	public void setCardOwner(String cardOwner) {
		this.cardOwner = cardOwner;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public int getCardRegPayDate() {
		return cardRegPayDate;
	}

	public void setCardRegPayDate(int cardRegPayDate) {
		this.cardRegPayDate = cardRegPayDate;
	}

	public Date getCardPayDate() {
		return cardPayDate;
	}

	public void setCardPayDate(Date cardPayDate) {
		this.cardPayDate = cardPayDate;
	}
}
