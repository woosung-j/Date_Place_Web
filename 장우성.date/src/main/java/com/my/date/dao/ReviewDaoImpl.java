package com.my.date.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.ReviewMap;
import com.my.date.domain.Review;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMap reviewMap;
	
	@Override
	public List<Review> selectReviewsByPlaceId(int placeId) {
		return reviewMap.selectReviewsByPlaceId(placeId);
	};
	
	@Override
	public String selectReviewAvg(@Param("placeId") int placeId) {
		return reviewMap.selectReviewAvg(placeId);
	};
}
