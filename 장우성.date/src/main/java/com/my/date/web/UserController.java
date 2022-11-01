package com.my.date.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.User;
import com.my.date.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	
	@GetMapping("login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		
		if(session.getAttribute("userId") != null)
			mv.setViewName("redirect:mypage");
		else
			mv.setViewName("user/login");
		
		return mv;
	}

	@PostMapping("login")
	public ModelAndView login(User loginUser, HttpServletRequest request, ModelAndView mv) {
		User user = userService.loginValidate(loginUser);

		if(user != null) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			
			session = request.getSession();
			if(user != null) {
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("id", user.getId());
				session.setAttribute("nickname", user.getNickname());
				session.setMaxInactiveInterval(86400);
			}
			mv.setViewName("redirect:/");
		} else {
			mv.addObject("errMsg", "아이디 또는 비밀번호가 틀렸습니다.");
			mv.setViewName("user/login");
		}
		
		return mv;
	}
	
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView mv) {
		session.invalidate();
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	@GetMapping("mypage")
	public ModelAndView mypage(HttpSession session, ModelAndView mv) {
		mv.setViewName("user/mypage");
		
		return mv;
	}

	@GetMapping("signup")
	public ModelAndView signup(ModelAndView mv) {
		mv.setViewName("user/signUp");

		return mv;
	}

}