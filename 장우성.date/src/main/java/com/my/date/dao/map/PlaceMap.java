package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.ReviewDto;

public interface PlaceMap {
	List<Place> selectPlaces();
	PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId);
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
