package com.my.date.web;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.User;
import com.my.date.service.MailSendService;
import com.my.date.service.UserService;

@RestController
@RequestMapping("user")
public class UserController {
	@Value("${attachPath}") private String attachPath;
	@Autowired private UserService userService;
	@Autowired private MailSendService mailSendService;

	@GetMapping("login")
 	public ModelAndView login(HttpServletRequest request, ModelAndView mv,
 				@CookieValue(required=false) String userId, @ModelAttribute("user") User user) {
		HttpSession session = request.getSession(false);

		if(session.getAttribute("userId") != null) {
			mv.addObject("id");			
			mv.setViewName("redirect:mypage");
		} else {
			mv.setViewName("user/login");			
		}
		return mv;
	}	
 
	@PostMapping("login")
	public ModelAndView login(User loginUser, HttpServletRequest request, ModelAndView mv, 
								@ModelAttribute("user") User id, String rememberId, 
								HttpSession sessionCookie, HttpServletResponse response) {
		User user = userService.loginValidate(loginUser);

		if(user != null) {
			HttpSession session = request.getSession(false);
			if(session != null) {
				session.invalidate();
			}
			
			session = request.getSession();
			if(rememberId != null && rememberId.equals("on")) {
				Cookie cookie = new Cookie("id", user.getId());
				cookie.setMaxAge(60 * 60 * 24 * 10);
				response.addCookie(cookie);
			}						
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

	@GetMapping("emailCheck/{email}")
	public String emailCheck(@PathVariable String email) {
		return userService.checkEmail(email);
	}

	@GetMapping("emailAuthCheck/{email}")
	public String emailAuthCheck(@PathVariable String email) {
		return mailSendService.AuthEmailWrite(email);
	}

	@GetMapping("mypage")
	public ModelAndView myPage(ModelAndView mv) {
		mv.setViewName("user/mypage");
		
		return mv;
	}
	
//	@PostMapping("mypage")
//	public void myPage(String profileName) {
//		userService.fixProfileImg(profileName);
//	}
	
	@GetMapping("uploadProfile")
	public String getProfileImage(HttpServletRequest request) {
		HttpSession sessionCheck = request.getSession(false);
        
		if(sessionCheck == null || sessionCheck.getAttribute("userId") == null) {
            return null;            
        }
        
        int userId = (int) sessionCheck.getAttribute("userId");
        
        return userService.getUserProfileImage(userId);
	}
	
	@PostMapping("uploadProfile")
    public int myPage(@RequestPart(value = "files") MultipartFile file, HttpServletRequest request) {
    	HttpSession sessionCheck = request.getSession(false);
        
		if(sessionCheck == null || sessionCheck.getAttribute("userId") == null) {
            return 0;            
        }
        
        int userId = (int) sessionCheck.getAttribute("userId");

		String originalFileName = "";
		String savedFileName = "";
        try {
            String uploadPath = attachPath + "/profileImage/";
             originalFileName = file.getOriginalFilename();
            if(!originalFileName.equals("")) {
            	UUID uuid = UUID.randomUUID();
                savedFileName = uuid.toString() + "_" + originalFileName;
                File file1 = new File(uploadPath + savedFileName);
                file.transferTo(file1);
            }        } catch(Exception e) {
        	return -1;
        }
        
        return userService.fixProfileImage(savedFileName, userId);
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
	
	@GetMapping("findpassword")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("user/findPassword");
		
		return mv;
	}
	
	@PostMapping("findpasswordresult/{email}")
	public int getPasswordResult(@PathVariable String email) {
		String randomPassword = mailSendService.passwordEmailWrite(email);

		return userService.fixPassword(email, randomPassword);	
	}

	@GetMapping("findpasswordresult")
	public ModelAndView findPwResult(ModelAndView mv) {
		mv.setViewName("user/findPasswordResult");
		
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
	
	@GetMapping("removeuser")
	public ModelAndView removeUser(ModelAndView mv) {
		mv.setViewName("user/removeUser");
		
		return mv;
	}
	
	@PostMapping("removeuser/{userId}")
	public ModelAndView removeUser(@PathVariable int userId, ModelAndView mv, HttpSession session) {
		if(userId > 0) {
        	userService.delUser(userId);
        	session.invalidate();
		} 
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
}