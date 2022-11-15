package com.my.date.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Declaration;
import com.my.date.domain.Detail;
import com.my.date.domain.Menu;
import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.ReviewDto;
import com.my.date.domain.User;
import com.my.date.service.DeclarationService;
import com.my.date.service.DetailService;
import com.my.date.service.MenuService;
import com.my.date.service.PlaceService;
import com.my.date.service.RegionService;
import com.my.date.service.ReviewService;
import com.my.date.service.UserService;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Value("${attachPath}") private String attachPath;
    @Autowired private DeclarationService declarationService;
    @Autowired private RegionService regionService;
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

    @GetMapping("list")
    public List<User> getUserList() {
		return userService.getAdminUserList();
	}
    
    @GetMapping("get/{userName}")
    public User getUser(@PathVariable String userName) {    
    	return userService.getUserByUserName(userName);
    }
     
    @PutMapping("fix")
	public void fixUser(@RequestBody User user) {
    	userService.fixAdminUser(user);
	}
    
	@PutMapping("del/{userId}")
	public void delUser(@PathVariable int userId) {
		userService.delUser(userId);
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

    @GetMapping("place/add")
    public ModelAndView placeAdd(ModelAndView mv) {
        mv.setViewName("admin/place/add");
        return mv;
    }

    @GetMapping("place/patch/{placeId}")
    public ModelAndView placeFix(ModelAndView mv, @PathVariable int placeId) {
        mv.addObject("placeId", placeId);
        mv.setViewName("admin/place/fix");
        return mv;
    }

    @GetMapping("place/fix/{placeId}")
    public PlaceAdminDto getPlace(@PathVariable int placeId) {
        return placeService.getAdminPlace(placeId);
    }
    
    @DeleteMapping("place/del/{placeId}")
	public void delPlace(@PathVariable int placeId) {
		placeService.delPlace(placeId);
	}

    private List<String> multiFileUpload(List<MultipartFile> files) {
        List<String> fileNameList = new ArrayList<String>();

        try {
            for(MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                String savedFileName = "";
                String uploadPath = attachPath + "/placeImage/";

                if(!originalFileName.equals("")) {
                    UUID uuid = UUID.randomUUID();
                    savedFileName = uuid.toString() + "_" + originalFileName;

                    File file1 = new File(uploadPath + savedFileName);
                    file.transferTo(file1);

                    fileNameList.add(savedFileName);
                }
            }
        } catch(Exception e) {
            return null;
        }
        return fileNameList;
    }

    @PostMapping("place/add/{si}/{gu}")
    public int addPlace(@RequestPart(value = "files") List<MultipartFile> files, @RequestPart(value = "key") Place place, @PathVariable("si") String si, @PathVariable("gu") String gu) {
        List<String> fileNameList = multiFileUpload(files);

        if(si.equals("경기")) {
            place.setSiId(regionService.getSiId(gu));
            place.setGuId(regionService.getGuId("없음"));
        } else {
            place.setSiId(regionService.getSiId(si));
            place.setGuId(regionService.getGuId(gu));
        }
        int isPlaceSuccess = placeService.addPlace(place);

        if(place.getPlaceId() != 0 && isPlaceSuccess == 1 && fileNameList.size() > 0) {
            return placeService.addPlaceImages(place.getPlaceId(), fileNameList);
        }
        return isPlaceSuccess;
    }

    @PostMapping("place/fix/{si}/{gu}")
    public int fixPlace(@RequestPart(value = "files") List<MultipartFile> files, @RequestPart(value = "key") Place place, @PathVariable("si") String si, @PathVariable("gu") String gu) {
        List<String> fileNameList = multiFileUpload(files);

        if(si.equals("경기")) {
            place.setSiId(regionService.getSiId(gu));
            place.setGuId(regionService.getGuId("없음"));
        } else {
            place.setSiId(regionService.getSiId(si));
            place.setGuId(regionService.getGuId(gu));
        }
        int isPlaceSuccess = placeService.fixPlace(place);

        if(place.getPlaceId() != 0 && isPlaceSuccess == 1 && fileNameList.size() > 0) {
            placeService.delPlaceImage(place.getPlaceId());
            return placeService.addPlaceImages(place.getPlaceId(), fileNameList);
        }
        return isPlaceSuccess;
    }

    @GetMapping("place/getPlaceList")
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
    public ModelAndView declare(ModelAndView mv) {
        mv.setViewName("admin/declaration/declareList");

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

    @GetMapping("menu/{placeId}")
    public ModelAndView menu(ModelAndView mv, @PathVariable int placeId) {
        mv.addObject("placeId", placeId);
        mv.setViewName("admin/menu/patchMenu");
        return mv;
    }

    @GetMapping("getMenus/{placeId}")
    public List<Menu> getMenus(@PathVariable int placeId) {
        return menuService.getMenus(placeId);
    }
    
    @PostMapping("addMenu")
    public int addMenu(@RequestBody List<Menu> menu) {
        return menuService.addMenu(menu);
    }
    
    @PatchMapping("fixMenu")
    public int fixMenu(@RequestBody List<Menu> menu) {
    	return menuService.fixMenu(menu);
    }
    
    @DeleteMapping("delMenu/{menuId}")
    public void delMenu(@PathVariable int menuId) {
    	menuService.delMenu(menuId);
    }

    @GetMapping("detail")
    public ModelAndView detail(ModelAndView mv) {
        mv.setViewName("admin/detail/patchDetail");
        return mv;
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

    @GetMapping("detail/patch/{placeId}")
    public ModelAndView detail(ModelAndView mv, @PathVariable int placeId) {
        mv.addObject("placeId", placeId);
        mv.setViewName("admin/detail/patchDetail");
        return mv;
    }

    @GetMapping("detail/getDetail/{placeId}")
    public Detail getDetail(@PathVariable int placeId) {
        return detailService.getDetail(placeId);
    }

    @PatchMapping("detail/patch/{placeId}")
    public int updateDetail(@PathVariable int placeId, @RequestBody Detail detail) {
        System.out.println(detail);
        detail.setPlaceId(placeId);
        return detailService.fixDetail(detail);
    }
    
    @GetMapping("detail/add/{placeId}")
    public ModelAndView detailAdd(ModelAndView mv, @PathVariable int placeId) {
    	mv.addObject("placeId", placeId);
        mv.setViewName("admin/detail/addDetail");
        return mv;
    }
    
    @PostMapping("detail/add/{placeId}")//add
    public int addDetail(@PathVariable int placeId, @RequestBody Detail detail) {
    	detail.setPlaceId(placeId);
    	System.out.println(detail);
        return detailService.addDetail(detail);
    }

    @DeleteMapping("detail/del/{placeId}")
    public void delDetail(@PathVariable int placeId, @RequestBody int detailId) {
        detailService.delDetail(detailId);
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
    
    @GetMapping("search/{keyword}")
    public List<ReviewDto> search(@PathVariable String keyword) {
        return reviewService.getSearchReviewByPlaceName(keyword);
    }
}
