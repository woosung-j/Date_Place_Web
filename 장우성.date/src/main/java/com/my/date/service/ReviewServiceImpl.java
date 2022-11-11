package com.my.date.service;

import java.util.List;

import com.my.date.domain.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.ReviewDao;
import com.my.date.domain.Review;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired private ReviewDao reviewDao;
	
	@Override
	public List<Review> getReviews() {
		return reviewDao.selectReviews();
	};
	
	@Override
	public List<Review> getReviewsByPlaceId(int placeId) {
		return reviewDao.selectReviewsByPlaceId(placeId);
	}

	@Override
	public ReviewDto getLatestReviewByPlaceId(int placeId) {
		return reviewDao.selectLatestReviewByPlaceId(placeId);
	}

	@Override
	public double getReviewAvg(int placeId) {
		if(reviewDao.selectReviewAvg(placeId) == null)
			return 0;
		return Double.parseDouble(reviewDao.selectReviewAvg(placeId));
	}
	
	@Override
	public int addReview(Review review) {
		return reviewDao.insertReview(review);
	}
	
	@Override
	public int delAdminReview(int reviewId) {
		return reviewDao.deleteAdminReview(reviewId);
	}
}
