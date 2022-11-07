package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.PlaceDao;
import com.my.date.domain.Place;

@Service("PlaceService")
public class PlaceServiceImpl implements PlaceService {
	@Autowired private PlaceDao placeDao;

	@Override
	public List<Place> getPlaces() {
		return placeDao.selectPlaces();
	}

	@Override
	public void addPlace(Place place) {
		placeDao.insertPlace(place);
	}

	@Override
	public void fixPlace(Place place) {
		placeDao.updatePlace(place);
	}

	@Override
	public void delPlace(int placeId) {
		placeDao.deletePlace(placeId);
	}
}
