package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;

public interface PlaceDao {
	List<Place> selectPlaces();
	PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
