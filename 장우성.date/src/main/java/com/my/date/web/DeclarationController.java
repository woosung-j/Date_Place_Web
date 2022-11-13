package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Declaration;
import com.my.date.domain.MyDeclarationDto;
import com.my.date.service.DeclarationService;

@RestController
@RequestMapping("declaration")
public class DeclarationController {
    @Autowired
    DeclarationService declarationService;

    @GetMapping("")
    public ModelAndView myDeclare(HttpServletRequest request, ModelAndView mv) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            mv.setViewName("redirect:/user/login");
        } else {
            mv.setViewName("declaration/myDeclare");
        }

        return mv;
    }

	@GetMapping("/add/{placeId}")
	public ModelAndView add(@PathVariable int placeId, HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			mv.setViewName("redirect:/user/login");
		} else {
			mv.addObject("placeId", placeId);
			mv.setViewName("declaration/add");
		}
		return mv;
	}
	
	@GetMapping("/add/getPlaceName/{placeId}")
	public String getPlaceName(@PathVariable int placeId) {
		return declarationService.getPlaceName(placeId);
	}
	
	@PostMapping("/add/{placeId}")
	public int addDeclaration(HttpServletRequest request, @RequestBody Declaration declaration) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return -1;
		}
		int userId = (int) session.getAttribute("userId");
		declaration.setUserId(userId);

		return declarationService.addDeclaration(declaration);
	}
	
    @GetMapping("/list")
    public List<MyDeclarationDto> getDeclareList(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
        int userId = (int) session.getAttribute("userId");

        List<MyDeclarationDto> dto = declarationService.getDeclareListByUserId(userId);

        return dto;
    }

    @DeleteMapping("/del/{declareId}")
    public int delDeclare(@PathVariable int declareId, HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return 0;
        }

        int userId = (int) session.getAttribute("userId");

        return declarationService.delDeclare(declareId, userId);
    }
}
