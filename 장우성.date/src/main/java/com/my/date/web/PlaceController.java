package com.my.date.web;

import com.my.date.domain.PlaceDetailDto;
import com.my.date.service.PlaceService;
import com.my.date.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("place")
public class PlaceController {
    @Autowired PlaceService placeService;
    @Autowired ReviewService reviewService;

    @GetMapping("")
    public ModelAndView place(ModelAndView mv) {
        mv.addObject("placeId", 1);
        mv.setViewName("place/place");
        return mv;
    }

    @GetMapping("/{placeId}")
    public PlaceDetailDto getPlace(HttpServletRequest request, @PathVariable int placeId) {
        int userId = 0;
        HttpSession session = request.getSession(false);
        if(session != null || session.getAttribute("userId") != null) {
            userId = (int) session.getAttribute("userId");
        }

        PlaceDetailDto place = placeService.getPlaceByPlaceId(placeId, userId);
        place.setReview(reviewService.getLatestReviewByPlaceId(placeId));

        return place;
    }
}
