package com.my.date.dao;

import com.my.date.dao.map.PlaceMap;
import com.my.date.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("PlaceDao")
public class PlaceDaoImpl implements PlaceDao {
	@Autowired private PlaceMap placeMap;

	@Override
	public List<Place> selectPlaces() {
		return placeMap.selectPlaces();
	}

	@Override
	public List<PlaceDto> selectPlacesBySiNameAndGuName(String siName, String guName, int userId) {
		return placeMap.selectPlacesBySiNameAndGuName(siName, guName, userId);
	}

	@Override
	public List<PlaceDto> selectPlacesBySiNameAndGuNameAndOrderBy(String siName, String guName, int userId, int orderBy) {
		return placeMap.selectPlacesBySiNameAndGuNameAndOrderBy(siName, guName, userId, orderBy);
	}

	@Override
	public PlaceDetailDto selectPlaceByPlaceId(int placeId, int userId) {
		return placeMap.selectPlaceByPlaceId(placeId, userId);
	}

	@Override
	public PlaceDetailDto selectAdminPlaceByPlaceId(int placeId) {
		return placeMap.selectAdminPlaceByPlaceId(placeId);
	}

	@Override
	public PlaceAdminDto selectAdminPlace(int placeId) {
		return placeMap.selectAdminPlace(placeId);
	}

	@Override
	public int insertPlace(Place place) {
		return placeMap.insertPlace(place);
	}

	@Override
	public int insertPlaceImages(int placeId, List<String> fileNames) {
		return placeMap.insertPlaceImages(placeId, fileNames);
	}

	@Override
	public int updatePlace(Place place) {
		return placeMap.updatePlace(place);
	}

	@Override
	public int deletePlace(int placeId) {
		return placeMap.deletePlace(placeId);
	}

	@Override
	public int deletePlaceImage(int placeId) {
		return placeMap.deletePlaceImage(placeId);
	}

	@Override
	public MyPlace selectMyPlace(MyPlace myPlace) {
		return placeMap.selectMyPlace(myPlace);
	}

	@Override
	public int insertMyPlace(MyPlace myPlace) {
		return placeMap.insertMyPlace(myPlace);
	}

	@Override
	public int deleteMyPlace(MyPlace myPlace) {
		return placeMap.deleteMyPlace(myPlace);
	}

	@Override
	public RecommendPlaceDto selectRecommendPlace() {
		return placeMap.selectRecommendPlace();
	}
}
