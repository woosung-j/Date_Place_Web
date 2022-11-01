package com.my.date.dao.map;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.my.date.domain.Review;

public interface ReviewMap {
	List<Review> selectReviews();
	List<Review> detailReviews(@Param("reviewId") int reviewId);
	List<Review> selectAdminReviews();
	List<Review> detailAdminReviews(@Param("reviewId") int reviewId);
	void insertReview(Review review);
	void deleteReview(int reviewNum);
	void deleteAdminReview(int reviewNum);
}
