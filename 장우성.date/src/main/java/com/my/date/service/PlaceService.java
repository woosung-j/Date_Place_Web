package com.my.date.service;

import java.util.List;

import com.my.date.domain.Place;

public interface PlaceService {
	List<Place> getPlaces();
	void addPlace(Place place);
	void fixPlace(Place place);
	void delPlace(int placeId);
}
