package com.my.date.dao.map;

import com.my.date.domain.Place;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PlaceMap {
	List<Place> selectPlaces();
	List<PlaceDto> selectPlacesBySiNameAndGuName(@Param("siName") String siName, @Param("guName") String guName, @Param("userId") int userId);
	List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(@Param("siName") String siName, @Param("guName") String guName, @Param("userId") int userId, @Param("orderBy") int orderBy);
	PlaceDetailDto selectPlaceByPlaceId(@Param("placeId") int placeId, @Param("userId") int userId);
	PlaceDetailDto selectAdminPlaceByPlaceId(int placeId);
	int insertPlace(Place place);
	int insertPlaceImages(@Param("placeId") int placeId, @Param("fileNames") List<String> fileNames);
	int updatePlace(Place place);
	int deletePlace(int place);
}
