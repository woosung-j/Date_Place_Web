package com.my.date.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.my.date.domain.Declaration;
import com.my.date.domain.Detail;
import com.my.date.domain.Menu;
import com.my.date.domain.Place;
import com.my.date.service.DeclarationService;
import com.my.date.service.DetailService;
import com.my.date.service.MenuService;
import com.my.date.service.PlaceService;

@RestController
@RequestMapping("admin")
public class AdminController {
    @Autowired private DeclarationService declarationService;
    @Autowired private MenuService menuService;
    @Autowired private PlaceService placeService;
	@Autowired private DetailService detailService;
	
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
		mv.addObject("placeId", 3);
		mv.setViewName("admin/detail/patchDetail");
		return mv;
	}

	@GetMapping("detail/getDetail/{placeId}")
	public Detail getDetail(@PathVariable int placeId) {
		return detailService.getDetail(placeId);
	}
	
	 @PatchMapping("detail/patch/{placeId}")
	    public int updateDetail(@PathVariable int placeId, @RequestBody Detail detail) {
	        return detailService.updateDetail(detail);
	    }
}