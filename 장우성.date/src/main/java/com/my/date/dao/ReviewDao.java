package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Review;

public interface ReviewDao {
	List<Review> selectReviewsByPlaceId(int placeId);
	String selectReviewAvg(int placeId);
}
