package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Place;
import com.my.date.domain.User;
import com.my.date.service.PlaceService;
import com.my.date.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Autowired private UserService userService;
	@Autowired private PlaceService placeService;
	
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
				session.setAttribute("email", user.getEmail());
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
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("user/mypage");
		
		return mv;
	}

	@GetMapping("signup")
	public ModelAndView signUp(ModelAndView mv) {
		mv.setViewName("user/signUp");

		return mv;
	}

	@GetMapping("idCheck/{id}")
	public int idCheck(@PathVariable String id) {
		if(userService.idCheck(id) != null) {
			return 0;
		}
		return 1;
	}
	
	@PostMapping("signup")
	public int signUp(@RequestBody User user) {
		return userService.signUp(user);
	}
	
	@GetMapping("findid")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("user/findId");
		
		return mv;
	}

	@GetMapping("findidresult")
	public ModelAndView findIdResult(ModelAndView mv) {
		mv.setViewName("user/findIdResult");
		
		return mv;
	}

	@PostMapping("findidresult")
	public ModelAndView findIdResult(User findId, ModelAndView mv) {
		User id = userService.findId(findId);
			
		if(id != null) {
			mv.addObject("id", id.getId());
			mv.addObject("infoMsg1", "찾으시는 아이디는");
			mv.addObject("infoMsg2", "입니다.");
			mv.setViewName("user/findIdResult");		
		} else					
			mv.addObject("errMsg1", "등록된 회원이 없습니다.");
			mv.setViewName("user/findIdResult");
			
		return mv;
	}

	@GetMapping("fixuser")
	public ModelAndView fixUser(ModelAndView mv) {
		mv.setViewName("user/fixUser");
	
		return mv; 
	}
	
	@PutMapping("fixuser")
	public String fixUser(HttpServletRequest request,@RequestBody User updateUser, HttpSession session) {
		HttpSession sessionCheck = request.getSession(false);
        
		if(sessionCheck == null || sessionCheck.getAttribute("userId") == null) {
            return null;            
        }
        
        int userId = (int) sessionCheck.getAttribute("userId");
        updateUser.setUserId(userId);
        
        if(userId > 0) {
        	userService.fixUser(updateUser);
        	session.invalidate();
		}
        
        return "/";
	}
}