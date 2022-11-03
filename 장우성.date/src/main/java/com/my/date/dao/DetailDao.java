package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailDao {
	List<Detail> selectDetails(int detailId);
	Detail selectDetail(int placeId);//시터 장소id연결
	void insertDetail(Detail detail);//이하 꽃
	void updateDetail(Detail detail);
	void deleteDetail(int detailId);
}