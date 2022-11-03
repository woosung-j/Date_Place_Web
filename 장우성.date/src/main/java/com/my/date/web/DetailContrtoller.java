package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.my.date.domain.Detail;
import com.my.date.service.DetailService;

@Controller
@RequestMapping("/detail")
public class DetailContrtoller {
	@Autowired private DetailService detailService;
	
	@Value("${attachPath}") private String attachPath;
	
	@RequestMapping("/listDetail")
	public String listDetail() {
		return "detail/listdetail";
	}
	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
	@RequestMapping(value= "/detail", method=RequestMethod.GET)
	public String detailDetail(Model model, @RequestParam("detailId") int detailId, HttpSession session) {
		List<Detail> detailList = detailService.selectDetails(detailId);
		model.addAttribute("detailList", detailList);
		return "detail/detailDetail";
	}
}