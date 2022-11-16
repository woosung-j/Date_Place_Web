package com.my.date.web;

import com.my.date.domain.MyPlace;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;
import com.my.date.domain.RecommendPlaceDto;
import com.my.date.service.PlaceService;
import com.my.date.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("place")
public class PlaceController {
    @Autowired PlaceService placeService;
    @Autowired ReviewService reviewService;

    @GetMapping("list")
    public ModelAndView main(@RequestParam("si") String si, @RequestParam("gu") String gu , ModelAndView mv) {
        mv.addObject("si", si);
        mv.addObject("gu", gu);
        mv.setViewName("place/list");
        return mv;
    }

    @GetMapping("around")
    public ModelAndView getMap(ModelAndView mv) {
        mv.setViewName("place/around");
        return mv;
    }

    @GetMapping("list/{si}/{gu}/{orderBy}")
    public List<PlaceDto> getPlaces(HttpServletRequest request, @PathVariable String si, @PathVariable String gu, @PathVariable int orderBy) {
        if(si == null || gu == null) {
            return null;
        }

        int userId = 0;
        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("userId") != null) {
            userId = (int) session.getAttribute("userId");
        }

        return placeService.getPlacesBySiNameAndGuName(si, gu, userId, orderBy);
    }

    @GetMapping("place/{placeId}")
    public ModelAndView place(@PathVariable int placeId, ModelAndView mv) {
        mv.addObject("placeId", placeId);
        mv.setViewName("place/place");
        return mv;
    }

    @GetMapping("get/{placeId}")
    public PlaceDetailDto getPlace(HttpServletRequest request, @PathVariable int placeId) {
        int userId = 0;
        HttpSession session = request.getSession(false);
        if(session != null && session.getAttribute("userId") != null) {
            userId = (int) session.getAttribute("userId");
        }

        PlaceDetailDto place = placeService.getPlaceByPlaceId(placeId, userId);
        place.setReview(reviewService.getLatestReviewByPlaceId(placeId));

        return place;
    }

    @GetMapping("myplace")
    public ModelAndView myPlace(ModelAndView mv) {
        mv.setViewName("place/myPlace");
        return mv;
    }

    @GetMapping("place/my")
    public List<PlaceDto> getMyPlaces(HttpServletRequest request) {
        int userId = 0;
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
        userId = (int) session.getAttribute("userId");

        return placeService.getPlacesByUserId(userId);
    }

    @PostMapping("place/my/like")
    public int toggleMyPlace(HttpServletRequest request, @RequestBody MyPlace myPlace) {
        int userId = 0;
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return -1;
        }
        userId = (int) session.getAttribute("userId");

        myPlace.setUserId(userId);
        if(placeService.getMyPlace(myPlace) == null)
            return placeService.addMyPlace(myPlace);
        else{
            return placeService.delMyPlace(myPlace);
        }
    }

    @GetMapping("recommand")
    public RecommendPlaceDto getRecommendPlace() {
        return placeService.getRecommendPlace();
    }
}
