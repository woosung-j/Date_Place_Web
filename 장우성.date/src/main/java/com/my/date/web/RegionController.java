package com.my.date.web;

import com.my.date.domain.Region;
import com.my.date.domain.RegionDto;
import com.my.date.service.RegionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
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

    @GetMapping("sigu/{siId}/{guId}")
    public RegionDto getSiNameAndGuName(@PathVariable("siId") int siId, @PathVariable("guId") int guId) {
        return regionService.getSiNameAndGuName(siId, guId);
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

    @GetMapping("isMyRegion/{siName}/{guName}")
    public int isMyRegion(HttpServletRequest request, @PathVariable String siName, @PathVariable String guName) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return -1;
        }
        int userId = (int) session.getAttribute("userId");

        Region region = regionService.getMyRegionByUserIdAndSiAndGu(userId, siName, guName);
        if(region == null) {
            return 0;
        } else {
            return region.getMyRegionId();
        }
    }

    @PostMapping("bookmark/add")
    public int addBookmark(HttpServletRequest request, @RequestBody RegionDto region) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return -1;
        }

        region.setSiId(regionService.getSiId(region.getSiName()));
        region.setGuId(regionService.getGuId(region.getGuName()));
        region.setUserId((int)session.getAttribute("userId"));
        regionService.addBookmark(region);

        return region.getMyRegionId();
    }

    @DeleteMapping("bookmark/del/{bookmarkId}")
    public int delBookmark(HttpServletRequest request, @PathVariable int bookmarkId) {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("userId") == null) {
            return -1;
        }

        return regionService.delBookmark(bookmarkId);
    }
}
