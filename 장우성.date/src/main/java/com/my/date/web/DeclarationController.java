package com.my.date.web;

import com.my.date.domain.MyDeclarationDto;
import com.my.date.service.DeclarationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("declaration")
public class DeclarationController {
    @Autowired
    DeclarationService declarationService;

    @GetMapping("")
    public ModelAndView myDeclare(ModelAndView mv) {
        mv.setViewName("declaration/myDeclare");

        return mv;
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
