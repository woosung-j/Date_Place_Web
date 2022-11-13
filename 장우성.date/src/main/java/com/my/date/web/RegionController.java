package com.my.date.web;

import com.my.date.domain.RegionDto;
import com.my.date.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@RestController
@RequestMapping("region")
public class RegionController {
    @Autowired RegionService regionService;

    @GetMapping("myregion")
    public ModelAndView myRegion(ModelAndView mv) {
        mv.setViewName("region/myRegion");
        return mv;
    }

    @GetMapping("myRegionList")
    public List<RegionDto> getMyRegions(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return null;
        }
        int userId = (int) session.getAttribute("userId");

        return regionService.getMyRegions(userId);
    }
}
