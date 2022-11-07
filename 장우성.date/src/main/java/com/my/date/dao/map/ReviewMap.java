package com.my.date.dao.map;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.my.date.domain.Review;

public interface ReviewMap {
	List<Review> selectReviewsByPlaceId(@Param("placeId") int placeId);
	String selectReviewAvg(@Param("placeId") int placeId);
}
