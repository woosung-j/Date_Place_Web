package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Place;

public interface PlaceDao {
	List<Place> selectPlaces();
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
