package com.my.date.web;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.my.date.domain.*;
import com.my.date.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired private DeclarationService declarationService;
    @Autowired private MenuService menuService;
    @Autowired private PlaceService placeService;
    @Autowired private DetailService detailService;
    @Autowired private ReviewService reviewService;
    @Autowired private UserService userService;
    
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession sessionCheck = request.getSession(false);
        if(sessionCheck == null || sessionCheck.getAttribute("isAdmin") == null) {
            return false;
        }

        return (boolean) sessionCheck.getAttribute("isAdmin");
    }
    
    @GetMapping("")
    public ModelAndView main(HttpServletRequest request, ModelAndView mv) {
        if(isAdmin(request) == true) {
            mv.setViewName("admin/main");
        } else {
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }

    @GetMapping("login")
    public ModelAndView login(ModelAndView mv) {
        mv.setViewName("admin/user/login");
        return mv;
    }

    @PostMapping("login")
    public ModelAndView login(User loginUser, HttpServletRequest request, ModelAndView mv) {
        User user = userService.adminLoginValidate(loginUser);

        if(user != null) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            session = request.getSession();
            if (user != null) {
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("id", user.getId());
                session.setAttribute("nickname", user.getNickname());
                session.setAttribute("email", user.getEmail());
                session.setAttribute("isAdmin", true);
                session.setMaxInactiveInterval(86400);
            }
            mv.setViewName("redirect:/admin");
        } else {
            mv.addObject("errMsg", "아이디 또는 비밀번호가 틀렸습니다.");
            mv.setViewName("admin/user/login");
        }

        return mv;
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpSession session, ModelAndView mv) {
        session.invalidate();
        mv.setViewName("redirect:/admin/login");
        return mv;
    }

    @GetMapping("place")
    public ModelAndView placeList(HttpServletRequest request, ModelAndView mv) {
        if(isAdmin(request) == true) {
            mv.setViewName("admin/place/placeList");
        } else {
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }

    @GetMapping("/place/getPlaceList")
    public List<Place> getPlaces(HttpServletRequest request) {
        if(isAdmin(request) == true) {
            return placeService.getPlaces();
        } else {
            return null;
        }
    }

    @GetMapping("/place/detail/{placeId}")
    public ModelAndView place(HttpServletRequest request, ModelAndView mv, @PathVariable int placeId) {
        if(isAdmin(request) == true) {
            mv.addObject("placeId", placeId);
            mv.setViewName("admin/place/place");
        } else {
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }

    @GetMapping("/place/getDetail/{placeId}")
    public PlaceDetailDto getPlaceDetail(HttpServletRequest request, @PathVariable int placeId) {
        if(isAdmin(request) == true) {
            return placeService.getAdminPlaceByPlaceId(placeId);
        } else {
            return null;
        }
    }

    @GetMapping("declare")
    public ModelAndView declare(HttpServletRequest request, ModelAndView mv) {
        if(isAdmin(request) == true) {
            mv.setViewName("admin/declaration/declareList");
        } else {
            mv.setViewName("redirect:/admin/login");
        }
        return mv;
    }

    @GetMapping("declare/list")
    public List<Declaration> declareList(HttpServletRequest request) {
        if(isAdmin(request) == true) {
            return declarationService.getDeclareList();
        } else {
            return null;
        }
    }

    @PatchMapping("declare/toggleconfirm/{declareId}/{confirm}")
    public int toggleConfirm(HttpServletRequest request, @PathVariable int declareId, @PathVariable int confirm) {
        if(isAdmin(request) == true) {
            return declarationService.fixConfirm(declareId, confirm);
        } else {
            return 0;
        }
    }

    @GetMapping("menu")
    public ModelAndView menu(ModelAndView mv) {
    	mv.addObject("placeId", 3);
        mv.setViewName("admin/menu/patchMenu");
        return mv;
    }

    @GetMapping("menu/getMenus")
    public List<Menu> getMenus() {
        return menuService.getMenus();
    }
    
    @PostMapping("addMenu")
    public int addMenu(@RequestBody List<Menu> menu) {
    	return menuService.addMenu(menu);
    }
    
    @PatchMapping("fixMenu")
    public int fixMenu(@RequestBody List<Menu> menu) {
    	return menuService.fixMenu(menu);
    }

    @GetMapping("detail")
    public ModelAndView detail(ModelAndView mv) {
        mv.setViewName("admin/detail/patchDetail");
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
    public List<ReviewDto> getReviews(HttpServletRequest request) {
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