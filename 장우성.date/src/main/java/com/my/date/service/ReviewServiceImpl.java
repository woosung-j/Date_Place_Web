package com.my.date.service;

import java.util.List;

import com.my.date.domain.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.ReviewDao;
import com.my.date.domain.Review;
import com.my.date.domain.ReviewDto;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired private ReviewDao reviewDao;
	
	@Override
	public List<ReviewDto> getReviews() {
		return reviewDao.selectReviews();
	};
	
	@Override
	public List<ReviewDto> getReviewsByPlaceId(int placeId) {
		return reviewDao.selectReviewsByPlaceId(placeId);
	}

	@Override
	public ReviewDto getLatestReviewByPlaceId(int placeId) {
		return reviewDao.selectLatestReviewByPlaceId(placeId);
	}

	@Override
	public List<ReviewDto> getReviewsByUserId(int userId) {
		return reviewDao.selectReviewsByUserId(userId);
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
