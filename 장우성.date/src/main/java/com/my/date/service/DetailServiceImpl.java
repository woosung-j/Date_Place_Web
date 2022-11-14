package com.my.date.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.date.dao.DetailDao;
import com.my.date.domain.Detail;

@Service
public class DetailServiceImpl implements DetailService{
	@Autowired private DetailDao detailDao;
	
	@Override
	public Detail getDetail(int placeId) {
		return detailDao.selectDetail(placeId);
	}
	@Override
	public int addDetail(Detail detail) {
		return detailDao.insertDetail(detail);
	}
	@Override
	public int fixDetail(Detail detail) {
		return detailDao.updateDetail(detail);
	}
}