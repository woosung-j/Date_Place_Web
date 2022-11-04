package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Detail;
import com.my.date.service.DetailService;

@RestController
@RequestMapping("admin")
public class AdminContrtoller {
	@Autowired private DetailService detailService;
	
	@GetMapping("/detail")
	public ModelAndView listDetail(ModelAndView mv) {
		mv.setViewName("admin/detail/detail");
		return mv;
	}
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
//	@GetMapping("/detail")
//	public ModelAndView selectDetail(ModelAndView mv, @RequestParam("detailId") int detailId, HttpSession session) {
//		List<Detail> detailList = detailService.selectDetails();
//		mv.addObject("detailList", detailList);
//		mv.setViewName("");
//		return mv;
//	}
	
	@PostMapping("/insertDetail")
	public String insertDetail() {
		return "detail/insertDetail";
	}
	
	@PutMapping("/updateDetail")
	public String updateDetail() {
		return "detail/updateDetail";
	}
	
	@DeleteMapping("del/{detailId}")
	public void delDetail(@PathVariable int detailId) {
		detailService.deleteDetail(detailId);
	}
}