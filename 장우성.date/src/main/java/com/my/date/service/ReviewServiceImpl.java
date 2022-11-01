package com.my.date.service;

import java.util.List;

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
	public List<Review> getDetailReviews(int reviewId) {
		return reviewDao.detailReviews(reviewId);
	};
	
	@Override
	public List<Review> getAdminReviews() {
		return reviewDao.selectAdminReviews();
	};
	
	@Override
	public List<Review> getDetailAdminReviews(int reviewId) {
		return reviewDao.detailAdminReviews(reviewId);
	};
	
	@Override
	public void addReview(Review review) {
		reviewDao.insertReview(review);
	};
	
	@Override
	public void delReview(int reviewId) {
		reviewDao.deleteReview(reviewId);
	};
	
	@Override
	public void delAdminReview(int reviewId) {
		reviewDao.deleteAdminReview(reviewId);
	};
}
