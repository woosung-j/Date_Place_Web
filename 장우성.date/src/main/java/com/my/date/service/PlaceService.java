package com.my.date.service;

import com.my.date.domain.*;

import java.util.List;

public interface PlaceService {
	List<Place> getPlaces();
	List<PlaceDto> getPlacesBySiNameAndGuName(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto getPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto getAdminPlaceByPlaceId(int placeId);
	PlaceAdminDto getAdminPlace(int placeId);
	int addPlace(Place place);
	int addPlaceImages(int placeId, List<String> fileNames);
	int fixPlace(Place place);
	void delPlace(int placeId);
	int delPlaceImage(int placeId);
	MyPlace getMyPlace(MyPlace myPlace);
	int addMyPlace(MyPlace myPlace);
	int delMyPlace(MyPlace myPlace);
}
