package com.my.date.service;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;

import java.util.List;

public interface PlaceService {
	List<Place> getPlaces();
	List<PlaceDto> getPlacesBySiNameAndGuName(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto getPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto getAdminPlaceByPlaceId(int placeId);
	int addPlace(Place place);
	int addPlaceImages(int placeId, List<String> fileNames);
	void fixPlace(Place place);
	void delPlace(int placeId);
}
