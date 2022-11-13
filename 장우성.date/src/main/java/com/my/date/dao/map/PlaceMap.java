package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Place;

public interface PlaceMap {
	List<Place> selectPlaces();
	int insertPlace(Place place);
	int updatePlace(Place place);
	int deletePlace(int place);
}
