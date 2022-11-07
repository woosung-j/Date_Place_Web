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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Detail;
import com.my.date.service.DetailService;

@RestController
@RequestMapping("admin")
public class AdminController {
	@Autowired private DetailService detailService;

	@GetMapping("detail")
	public ModelAndView detail(ModelAndView mv) {
		mv.setViewName("admin/detail/patchdetail");
		return mv;
	}

	@GetMapping("detail/getDatails")
	public List<Detail> getDetails() {
		return detailService.getDetails();
	}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
//	@GetMapping("/detail")
//	public ModelAndView selectDetail(ModelAndView mv, @RequestParam("detailId") int detailId, HttpSession session) {
//		List<Detail> detailList = detailService.selectDetails();
//		mv.addObject("detailList", detailList);
//		mv.setViewName("");
//		return mv;
//	}
//	
	@PostMapping("/add")
	public void addDetail(@RequestBody Detail detail) {
		detailService.addDetail(detail);
	}
	
	@PutMapping("/fix")
	public void fixDetail(@RequestBody Detail detail) {
		detailService.addDetail(detail);
	}
	
	@DeleteMapping("del/{detailId}")
	public void delDetail(@PathVariable int detailId) {
		detailService.delDetail(detailId);
	}
}