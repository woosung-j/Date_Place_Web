package com.my.date.service;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;

public interface PlaceService {
	List<Place> getPlaces();
	PlaceDetailDto getPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto getAdminPlaceByPlaceId(int placeId);
	void addPlace(Place place);
	void fixPlace(Place place);
	void delPlace(int placeId);
}
