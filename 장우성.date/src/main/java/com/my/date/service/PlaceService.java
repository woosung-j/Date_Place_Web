package com.my.date.service;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;

public interface PlaceService {
	List<Place> getPlaces();
	List<PlaceDto> getPlacesBySiNameAndGuName(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto getPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto getAdminPlaceByPlaceId(int placeId);
	void addPlace(Place place);
	void fixPlace(Place place);
	void delPlace(int placeId);
}
