package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.ReviewDto;
import org.apache.ibatis.annotations.Param;

public interface PlaceMap {
	List<Place> selectPlaces();
	PlaceDetailDto selectPlaceByPlaceId(@Param("placeId") int placeId, @Param("userId") int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
