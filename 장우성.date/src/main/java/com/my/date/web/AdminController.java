package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Declaration;
import com.my.date.domain.Detail;
import com.my.date.domain.Menu;
import com.my.date.domain.Place;
import com.my.date.domain.Review;
import com.my.date.service.DeclarationService;
import com.my.date.service.DetailService;
import com.my.date.service.MenuService;
import com.my.date.service.PlaceService;
import com.my.date.service.ReviewService;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired private DeclarationService declarationService;
    @Autowired private MenuService menuService;
    @Autowired private PlaceService placeService;
    @Autowired private DetailService detailService;
    @Autowired private ReviewService reviewService;
    
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession sessionCheck = request.getSession(false);
        if(sessionCheck == null || sessionCheck.getAttribute("isAdmin") == null) {
            return false;
        }

        return (boolean) sessionCheck.getAttribute("isAdmin");
    }
    
    @GetMapping("place")
    public ModelAndView main(ModelAndView mv) {
        mv.setViewName("place/placelist");
        return mv;
    }

    @GetMapping("/placelist")
    public List<Place> getPlaces() {
        return placeService.getPlaces();
    }
    
    @GetMapping("declare")
    public ModelAndView declare(ModelAndView mv) {
        mv.setViewName("admin/declaration/declareList");
        return mv;
    }

    @GetMapping("declare/list")
    public List<Declaration> declareList() {
        return declarationService.getDeclareList();
    }

    @PatchMapping("declare/toggleconfirm/{declareId}/{confirm}")
    public int toggleConfirm(@PathVariable int declareId, @PathVariable int confirm) {
        return declarationService.fixConfirm(declareId, confirm);
    }

    @GetMapping("menu")
    public ModelAndView menu(ModelAndView mv) {
        mv.setViewName("admin/menu/patchmenu");
        return mv;
    }

    @GetMapping("menu/getMenus")
    public List<Menu> getMenus() {
        return menuService.getMenus();
    }

    @GetMapping("detail")
    public ModelAndView detail(ModelAndView mv) {
        mv.setViewName("admin/detail/patchdetail");
        return mv;
    }

    @GetMapping("detail/getDetails")
    public List<Detail> getDetails() {
        return detailService.getDetails();
    }
    
    @GetMapping("review")
    public ModelAndView review(HttpServletRequest request, ModelAndView mv) {
        if(isAdmin(request) == true) {
            mv.setViewName("admin/review/reviewList");
        } else {
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }
    
    @GetMapping("review/list")
    public List<Review> getReviews(HttpServletRequest request) {
        if(isAdmin(request) == true) {
            return reviewService.getReviews();
        } else {
            return null;
        }
    }
    
    @DeleteMapping("del/{reviewId}")
    public int delAdminReview(HttpServletRequest request, @PathVariable int reviewId) {
        if(isAdmin(request) == true) {
            return reviewService.delAdminReview(reviewId);
        } else {
            return 0;
        }
    }
}