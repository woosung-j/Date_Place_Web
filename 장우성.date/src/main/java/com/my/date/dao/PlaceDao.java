package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;
import org.apache.ibatis.annotations.Param;

public interface PlaceDao {
	List<Place> selectPlaces();
	List<PlaceDto> selectPlacesBySiNameAndGuName(String siName, String guName, int userId);
	List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(String siName, String guName, int userId, int orderBy);
	PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
