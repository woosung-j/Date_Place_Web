package com.my.date.dao;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;

import java.util.List;

public interface PlaceDao {
	List<Place> selectPlaces();
	List<PlaceDto> selectPlacesBySiNameAndGuName(String siName, String guName, int userId);
	List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int insertPlaceImages(int placeId, List<String> fileNames);
	int updatePlace(Place place);
	int deletePlace(int place);
}
