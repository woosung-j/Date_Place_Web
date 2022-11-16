package com.my.date.web;

import com.my.date.domain.*;
import com.my.date.service.*;
import com.my.date.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

    private void setView(HttpSession session, ModelAndView mv, String viewName) {
        if(!SessionUtil.getIsAdmin(session)) {
            mv.setViewName("redirect:/admin/login");
        } else {
            mv.setViewName(viewName);
        }
    }

    @GetMapping("")
    public ModelAndView main(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/main");
        return mv;
    }

    @GetMapping("login")
    public ModelAndView login(ModelAndView mv) {
        mv.setViewName("admin/user/login");
        return mv;
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpSession session, ModelAndView mv) {
        session.invalidate();
        mv.setViewName("redirect:/admin/login");
        return mv;
    }

    @GetMapping("place")
    public ModelAndView placeList(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/place/placeList");
        return mv;
    }

    @GetMapping("place/add")
    public ModelAndView placeAdd(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/place/add");
        return mv;
    }

    @GetMapping("place/patch/{placeId}")
    public ModelAndView placeFix(HttpSession session, ModelAndView mv, @PathVariable int placeId) {
        setView(session, mv, "admin/place/fix");
        mv.addObject("placeId", placeId);
        return mv;
    }

    @GetMapping("detail/add/{placeId}")
    public ModelAndView detailAdd(HttpSession session, ModelAndView mv, @PathVariable int placeId) {
        setView(session, mv, "admin/detail/addDetail");
        mv.addObject("placeId", placeId);
        return mv;
    }
    @GetMapping("/place/detail/{placeId}")
    public ModelAndView place(HttpSession session, ModelAndView mv, @PathVariable int placeId) {
        setView(session, mv, "admin/place/place");
        mv.addObject("placeId", placeId);
        return mv;
    }
    @GetMapping("declare")
    public ModelAndView declare(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/declaration/declareList");
        return mv;
    }
    @GetMapping("menu/{placeId}")
    public ModelAndView menu(HttpSession session, ModelAndView mv, @PathVariable int placeId) {
        setView(session, mv, "admin/menu/patchMenu");
        mv.addObject("placeId", placeId);
        return mv;
    }
    @GetMapping("detail")
    public ModelAndView detail(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/detail/patchDetail");
        return mv;
    }

    @GetMapping("review")
    public ModelAndView review(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/review/reviewList");
        return mv;
    }

    @GetMapping("detail/patch/{placeId}")
    public ModelAndView detail(HttpSession session, ModelAndView mv, @PathVariable int placeId) {
        setView(session, mv, "admin/detail/patchDetail");
        mv.addObject("placeId", placeId);
        return mv;
    }

    @GetMapping("/logo")
    public ModelAndView logo(HttpSession session, ModelAndView mv) {
        setView(session, mv, "admin/logo/logo");
        return mv;
    }

    @GetMapping("list")
    public List<User> getUserList(HttpSession session) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return userService.getAdminUserList();
    }

    @GetMapping("get/{userName}")
    public User getUser(HttpSession session, @PathVariable String userName) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return userService.getUserByUserName(userName);
    }

    @PutMapping("fix")
    public void fixUser(HttpSession session, @RequestBody User user) {
        if(!SessionUtil.getIsAdmin(session)) return ;
        userService.fixAdminUser(user);
    }

    @PutMapping("del/{userId}")
    public void delUser(HttpSession session, @PathVariable int userId) {
        if(!SessionUtil.getIsAdmin(session)) return ;
        userService.delUser(userId);
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

    @GetMapping("place/fix/{placeId}")
    public PlaceAdminDto getPlace(HttpSession session, @PathVariable int placeId) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return placeService.getAdminPlace(placeId);
    }

    @DeleteMapping("place/del/{placeId}")
    public void delPlace(HttpSession session, @PathVariable int placeId) {
        if(!SessionUtil.getIsAdmin(session)) return ;
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
    public int addPlace(HttpSession session, @RequestPart(value = "files") List<MultipartFile> files, @RequestPart(value = "key") Place place, @PathVariable("si") String si, @PathVariable("gu") String gu) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        List<String> fileNameList = multiFileUpload(files);

        if(si.equals("경기")) {
            place.setSiId(regionService.getSiId(gu));
            place.setGuId(regionService.getGuId("없음"));
        } else {
            place.setSiId(regionService.getSiId(si));
            place.setGuId(regionService.getGuId(gu));
        }
        int isPlaceSuccess = placeService.addPlace(place);

        if(place.getPlaceId() != 0 && isPlaceSuccess == 1 && fileNameList != null && fileNameList.size() > 0) {
            return placeService.addPlaceImages(place.getPlaceId(), fileNameList);
        }
        return isPlaceSuccess;
    }

    @PostMapping("place/fix/{si}/{gu}")
    public int fixPlace(HttpSession session, @RequestPart(value = "files") List<MultipartFile> files, @RequestPart(value = "key") Place place, @PathVariable("si") String si, @PathVariable("gu") String gu) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        List<String> fileNameList = multiFileUpload(files);

        if(si.equals("경기")) {
            place.setSiId(regionService.getSiId(gu));
            place.setGuId(regionService.getGuId("없음"));
        } else {
            place.setSiId(regionService.getSiId(si));
            place.setGuId(regionService.getGuId(gu));
        }
        int isPlaceSuccess = placeService.fixPlace(place);

        if(place.getPlaceId() != 0 && isPlaceSuccess == 1 && fileNameList != null && fileNameList.size() > 0) {
            placeService.delPlaceImage(place.getPlaceId());
            return placeService.addPlaceImages(place.getPlaceId(), fileNameList);
        }
        return isPlaceSuccess;
    }

    @GetMapping("place/getPlaceList")
    public List<Place> getPlaces(HttpSession session) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return placeService.getPlaces();
    }


    @GetMapping("/place/getDetail/{placeId}")
    public PlaceDetailDto getPlaceDetail(HttpSession session, @PathVariable int placeId) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return placeService.getAdminPlaceByPlaceId(placeId);
    }

    @GetMapping("declare/list")
    public List<Declaration> declareList(HttpSession session) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return declarationService.getDeclareList();
    }

    @PatchMapping("declare/toggleconfirm/{declareId}/{confirm}")
    public int toggleConfirm(HttpSession session, @PathVariable int declareId, @PathVariable int confirm) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        return declarationService.fixConfirm(declareId, confirm);
    }


    @GetMapping("getMenus/{placeId}")
    public List<Menu> getMenus(HttpSession session, @PathVariable int placeId) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return menuService.getMenus(placeId);
    }

    @PostMapping("addMenu")
    public int addMenu(HttpSession session, @RequestBody List<Menu> menu) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        return menuService.addMenu(menu);
    }

    @PatchMapping("fixMenu")
    public int fixMenu(HttpSession session, @RequestBody List<Menu> menu) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        return menuService.fixMenu(menu);
    }

    @DeleteMapping("delMenu/{menuId}")
    public void delMenu(HttpSession session, @PathVariable int menuId) {
        if(!SessionUtil.getIsAdmin(session)) return ;
        menuService.delMenu(menuId);
    }

    @GetMapping("detail/getDetail/{placeId}")
    public Detail getDetail(HttpSession session, @PathVariable int placeId) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return detailService.getDetail(placeId);
    }

    @PatchMapping("detail/patch/{placeId}")
    public int updateDetail(HttpSession session, @PathVariable int placeId, @RequestBody Detail detail) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        detail.setPlaceId(placeId);
        return detailService.fixDetail(detail);
    }

    @PostMapping("detail/add/{placeId}")//add
    public int addDetail(HttpSession session, @PathVariable int placeId, @RequestBody Detail detail) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        detail.setPlaceId(placeId);
        return detailService.addDetail(detail);
    }

    @DeleteMapping("detail/del/{detailId}")
    public void delDetail(HttpSession session, @PathVariable int detailId) {
    	if(!SessionUtil.getIsAdmin(session)) {
    		return ;
    		}
    		detailService.delDetail(detailId);
    }

    @GetMapping("review/list")
    public List<ReviewDto> getReviews(HttpSession session) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return reviewService.getReviews();
    }

    @DeleteMapping("review/del/{reviewId}")
    public int delAdminReview(HttpSession session, @PathVariable int reviewId) {
        if(!SessionUtil.getIsAdmin(session)) return -1;
        return reviewService.delAdminReview(reviewId);
    }

    @GetMapping("search/{keyword}")
    public List<ReviewDto> search(HttpSession session, @PathVariable String keyword) {
        if(!SessionUtil.getIsAdmin(session)) return null;
        return reviewService.getSearchReviewByPlaceName(keyword);
    }

    @PostMapping("/logo/upload")
    public int logoUpload(HttpSession session, @RequestPart(value = "files") List<MultipartFile> files) {
        if(!SessionUtil.getIsAdmin(session)) return -1;

        try {
            for(MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                String savedFileName = "logo.jpg";
                String uploadPath = attachPath + "/";

                if(!originalFileName.equals("")) {
                    File file1 = new File(uploadPath + savedFileName);
                    file.transferTo(file1);
                } else {
                    return 0;
                }
            }
        } catch(Exception e) {
            return 0;
        }
        return 1;
    }

    @PostMapping("/logo/admin/upload")
    public int logoAdminUpload(HttpSession session, @RequestPart(value = "files2") List<MultipartFile> files) {
        if(!SessionUtil.getIsAdmin(session)) return -1;

        try {
            for(MultipartFile file : files) {
                String originalFileName = file.getOriginalFilename();
                String savedFileName = "logo_admin.jpg";
                String uploadPath = attachPath + "/";

                if(!originalFileName.equals("")) {
                    File file1 = new File(uploadPath + savedFileName);
                    file.transferTo(file1);
                } else {
                    return 0;
                }
            }
        } catch(Exception e) {
            return 0;
        }
        return 1;
    }
}
