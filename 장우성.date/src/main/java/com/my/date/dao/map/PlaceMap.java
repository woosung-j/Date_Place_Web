package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;
import com.my.date.domain.ReviewDto;
import org.apache.ibatis.annotations.Param;

public interface PlaceMap {
	List<Place> selectPlaces();
	List<PlaceDto> selectPlacesBySiNameAndGuName(@Param("siName") String siName, @Param("guName") String guName, @Param("userId") int userId);
	List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(@Param("siName") String siName, @Param("guName") String guName, @Param("userId") int userId, @Param("orderBy") int orderBy);
	PlaceDetailDto selectPlaceByPlaceId(@Param("placeId") int placeId, @Param("userId") int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
