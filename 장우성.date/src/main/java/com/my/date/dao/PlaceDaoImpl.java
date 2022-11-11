package com.my.date.dao;

import java.util.List;

import com.my.date.domain.PlaceDetailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.PlaceMap;
import com.my.date.domain.Place;

@Repository("PlaceDao")
public class PlaceDaoImpl implements PlaceDao {
	@Autowired private PlaceMap placeMap;

	@Override
	public List<Place> selectPlaces() {
		return placeMap.selectPlaces();
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
	public int insertPlace(Place place) {
		return placeMap.insertPlace(place);
	}

	@Override
	public int updatePlace(Place place) {
		return placeMap.updatePlace(place);
	}

	@Override
	public int deletePlace(int placeId) {
		return placeMap.deletePlace(placeId);
	}
}
