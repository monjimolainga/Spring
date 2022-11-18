package com.wannaattention.www.donation.dao;

import org.apache.ibatis.annotations.Insert;

import com.wannaattention.www.donation.vo.DonationVO;
/**
 * @ClassName : DonationMapper.java
 * @Description : 후원하기 쿼리실행
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
public interface DonationMapper {

	/** 후원을 신청한다 */
	@Insert("INSERT INTO DONATION_TB (DONA_NUM, DONOR_TYPE, DONA_TYPE, DONA_AMOUNT) "
			+ "VALUES (DONA_SEQ.NEXTVAL, #{donorType}, #{donaType}, #{donaAmount})")
	public void insertDonate(DonationVO donationVO);
}
