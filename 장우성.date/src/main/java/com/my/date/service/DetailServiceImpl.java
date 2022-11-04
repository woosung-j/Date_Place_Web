package com.my.date.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.DetailDao;
import com.my.date.domain.Detail;

@Service
public class DetailServiceImpl implements DetailService{
	@Autowired private DetailDao detailDao;
	
	@Override
	public List<Detail> selectDetails() {
		return detailDao.selectDetails();
	}
	
	@Override
	public Detail getDetail(int placeId) {
		return detailDao.selectDetail(placeId);
	}
	
	@Override
	public void insertDetail(Detail detail) {
		detailDao.insertDetail(detail);
	}
	
	@Override
	public void updateDetail(Detail detail) {
		detailDao.updateDetail(detail);
	}
	
	@Override
	public void deleteDetail(int detailId) {
		detailDao.deleteDetail(detailId);
	}

	@Override
	public int insertAddress(int detailId, String postcode, String address, String detailAddress) {
		return detailDao.insertAddress(detailId, postcode, address, detailAddress);
	}
}