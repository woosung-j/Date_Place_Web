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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;
import com.my.date.service.ReviewService;

@RestController
@RequestMapping("review")
public class ReviewController {
	@Value("${attachPath}") private String attachPath;
	@Autowired
	private ReviewService reviewService;

	@GetMapping("list/{placeId}")
	public ModelAndView list(@PathVariable int placeId, HttpSession session, ModelAndView mv) {
	  mv.addObject("placeId", placeId);
	  mv.setViewName("review/list");

	  return mv;
	}
   
	@GetMapping("getReviewList/{placeId}")
	public List<ReviewDto> getReviewsByPlaceId(@PathVariable int placeId) {
		return reviewService.getReviewsByPlaceId(placeId);
	}

	@GetMapping("avg/{placeId}")
	public double getReviewAvg(@PathVariable int placeId) {
		return reviewService.getReviewAvg(placeId);
	}	
	
	@GetMapping("add/{placeId}")
	public ModelAndView add(@PathVariable int placeId, HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			mv.setViewName("redirect:/user/login");
		} else {
			mv.addObject("placeId", placeId);
			mv.setViewName("review/add");
		}
		return mv;
	}
	
	@PostMapping("add/{placeId}")
	public int addReview(HttpServletRequest request, @RequestPart(value = "files") List<MultipartFile> files, @RequestPart(value = "key") Review review) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return -1;
		}
		int userId = (int) session.getAttribute("userId");
		review.setUserId(userId);
		
		List<String> fileNameList = new ArrayList<String>();

		try {
			for(MultipartFile file : files) {
				String savedFileName = "";
				String uploadPath = attachPath + "/reviewImages/";
				String originalFileName = file.getOriginalFilename();

				if(!originalFileName.equals("")) {
					UUID uuid = UUID.randomUUID();
					savedFileName = uuid.toString() + "_" + originalFileName;
					
					File file1 = new File(uploadPath + savedFileName);
					file.transferTo(file1);
					
					fileNameList.add(savedFileName);
				}
			}
		} catch(Exception e) {
		    return -1;
		}
		
		int isReviewSuccess = reviewService.addReview(review);
		
		if(review.getReviewId() != 0 && isReviewSuccess == 1 && fileNameList.size() > 0) {
		    return reviewService.addReviewImages(review.getReviewId(), fileNameList);
		}
		
		return isReviewSuccess;
	}
    
	@GetMapping("myreview")
	public ModelAndView myReview(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			mv.setViewName("redirect:/user/login");
		} else {
			mv.setViewName("review/myReview");
		}
		return mv;
	}

	@GetMapping("review/myReview")
	public List<ReviewDto> getReviewsUserId(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return null;
		}
		int userId = (int) session.getAttribute("userId");

		List<ReviewDto> dto = reviewService.getReviewsByUserId(userId);

		return dto;
	}

	@GetMapping("detailview/{reviewId}")
	public ModelAndView detailView(ModelAndView mv, @PathVariable int reviewId) {
		mv.setViewName("review/detailView");

		return mv;
	}

	@GetMapping("detailView/{reviewId}")
	public List<ReviewDto> getDetailReviewByReviewId(@PathVariable int reviewId) {
		return reviewService.getDetailReviewByReviewId(reviewId);
	}

	@DeleteMapping("del/{reviewId}")
	public int delDetailReview(@PathVariable int reviewId, HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			return 0;
		}
		int userId = (int) session.getAttribute("userId");
		return reviewService.delDetailReview(reviewId, userId);
	}
}
