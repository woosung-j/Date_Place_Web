package com.my.date.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.DetailMap;
import com.my.date.domain.Detail;

@Repository
public class DetailDaoImpl implements DetailDao{
	@Autowired private DetailMap detailMap;
	
	@Override 
	public List<Detail> selectDetails() {
		return detailMap.selectDetails();
	}
	
	@Override
	public Detail selectDetail(int placeId) {
		return detailMap.selectDetail(placeId);
	}
	
	@Override
	public int insertAddress(int detailId, String postcode, String address, String detailAddress) {
		return detailMap.insertAddress(detailId, postcode, address, detailAddress);
	}
	
	@Override
	public void insertDetail(Detail detail) {
		detailMap.insertDetail(detail);
	}
	
	@Override
	public void updateDetail(Detail detail) {
		detailMap.updateDetail(detail);
	}
	
	@Override
	public void deleteDetail(int detailId) {
		detailMap.deleteDetail(detailId);
	}
	
}