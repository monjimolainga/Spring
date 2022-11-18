package com.wannaattention.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("board") /**  "/board" 경로로 갔을때 조회 */
public class BoardController {

	@RequestMapping("animalList") /** "/board/animalList" 경로로 갔을 때 조회 */
	public ModelAndView animalList() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
}
