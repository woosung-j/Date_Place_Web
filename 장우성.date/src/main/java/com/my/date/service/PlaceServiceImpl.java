package com.my.date.service;

import com.my.date.dao.PlaceDao;
import com.my.date.domain.Place;
import com.my.date.domain.PlaceAdminDto;
import com.my.date.domain.PlaceDetailDto;
import com.my.date.domain.PlaceDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PlaceService")
public class PlaceServiceImpl implements PlaceService {
	@Autowired private PlaceDao placeDao;

	@Override
	public List<Place> getPlaces() {
		return placeDao.selectPlaces();
	}

	@Override
	public List<PlaceDto> getPlacesBySiNameAndGuName(String siName, String guName, int userId, int orderBy) {
		if(orderBy > 0) {
			return placeDao.selectPlacesBySiNameAndGuNameAndOrderBy(siName, guName, userId, orderBy);
		}
		return placeDao.selectPlacesBySiNameAndGuName(siName, guName, userId);
	}

	@Override
	public PlaceDetailDto getPlaceByPlaceId(int placeId, int userId) {
		return placeDao.selectPlaceByPlaceId(placeId, userId);
	}

	@Override
	public PlaceDetailDto getAdminPlaceByPlaceId(int placeId) {
		return placeDao.selectAdminPlaceByPlaceId(placeId);
	}

	@Override
	public PlaceAdminDto getAdminPlace(int placeId) {
		return placeDao.selectAdminPlace(placeId);
	}

	@Override
	public int addPlace(Place place) {
		return placeDao.insertPlace(place);
	}

	@Override
	public int addPlaceImages(int placeId, List<String> fileNames) {
		return placeDao.insertPlaceImages(placeId, fileNames);
	}

	@Override
	public int fixPlace(Place place) {
		return placeDao.updatePlace(place);
	}

	@Override
	public void delPlace(int placeId) {
		placeDao.deletePlace(placeId);
	}

	@Override
	public int delPlaceImage(int placeId) {
		return placeDao.deletePlaceImage(placeId);
	}
}
