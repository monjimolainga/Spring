package com.wannaattention.www.donation.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wannaattention.www.donation.service.DonationService;
import com.wannaattention.www.donation.vo.DonationVO;
import com.wannaattention.www.service.UserService;
import com.wannaattention.www.vo.User;
/**
 * @ClassName : DonationController.java
 * @Description : 후원하기 URL 호출 컨트롤러
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
@Controller
@RequestMapping("donation/donate") 
public class DonationController {
	
	/** 콘솔 오류로그 등을 보기 위한 로거 생성 */
	private static final Logger LOGGER = LoggerFactory.getLogger(DonationController.class);
	private static final String JSP_DIR = "donation/";
	
	/** DonationService (후원하기) */
	@Autowired
	private DonationService donationService;
	
	/** UserService (회원정보) */
	@Autowired
	private UserService userService;
	
	/** 후원하기 페이지로 이동한다 */
	@GetMapping(value="/registDonate")
	public String registDonate(
			@ModelAttribute("donationVO") DonationVO donationVO) throws Exception {
	
		return JSP_DIR + "donateMain";
	}
	
	/** 후원을 신청한다 */
	@ResponseBody
	@PostMapping(value="/registDonate")
	public ModelAndView join(@ModelAttribute("donationVO") DonationVO donationVO) throws Exception { 
		ModelAndView mav = new ModelAndView();
		
		try {
			donationService.insertDonate(donationVO);
			mav.addObject("donationVO", donationVO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:donateConfirm");
		return mav;
	}
	
	@GetMapping(value="/donateConfirm")
	public String donateConfirm(
			@ModelAttribute("donationVO") DonationVO donationVO) throws Exception {
	
		return JSP_DIR + "donateConfirm";
	}
}
