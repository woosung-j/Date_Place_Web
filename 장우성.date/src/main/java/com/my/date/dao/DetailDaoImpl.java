package com.my.date.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.my.date.dao.map.DetailMap;
import com.my.date.domain.Detail;

@Repository
public class DetailDaoImpl implements DetailDao {
	@Autowired
	DetailMap detailMap;

	@Override
	public Detail selectDetail(int placeId) {
		return detailMap.selectDetail(placeId);
	}
	
	@Override
	public int insertDetail(Detail detail) {
		return 0; //detailMap.insertDetail(detail);
	}
	
	@Override
	public int updateDetail(Detail detail) {
		return detailMap.updateDetail(detail);
	}
	
	@Override
	public int deleteDetail(int detailId) {
		return detailMap.deleteDetail(detailId);
	}
}