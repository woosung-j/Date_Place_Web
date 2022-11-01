package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.ReviewMap;
import com.my.date.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<Review> selectReviews(){
		return reviewMap.selectReviews();
	};
	
	@Override
	public List<Review> detailReviews(int reviewId){
		return reviewMap.detailReviews(reviewId);
	};
	
	@Override
	public List<Review> selectAdminReviews(){
		return reviewMap.selectAdminReviews();
	};
	
	@Override
	public List<Review> detailAdminReviews(int reviewId){
		return reviewMap.detailAdminReviews(reviewId);
	};
	
	@Override
	public void insertReview(Review review) {
		reviewMap.insertReview(review);
	};
	
	@Override
	public void deleteReview(int reviewId) {
		reviewMap.deleteReview(reviewId);
	};
	
	@Override
	public void deleteAdminReview(int reviewId) {
		reviewMap.deleteAdminReview(reviewId);
	};
}
