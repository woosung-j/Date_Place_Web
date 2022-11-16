package com.my.date.dao;

import com.my.date.domain.*;

import java.util.List;

public interface PlaceDao {
	List<Place> selectPlaces();
	List<PlaceDto> selectPlacesBySiNameAndGuName(String siName, String guName, int userId);
	List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	PlaceAdminDto selectAdminPlace(int placeId);
	int insertPlace(Place place);
	int insertPlaceImages(int placeId, List<String> fileNames);
	int updatePlace(Place place);
	int deletePlace(int place);
	int deletePlaceImage(int placeId);
	MyPlace selectMyPlace(MyPlace myPlace);
	int insertMyPlace(MyPlace myPlace);
	int deleteMyPlace(MyPlace myPlace);
	RecommendPlaceDto selectRecommendPlace();
}
