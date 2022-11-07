package com.my.date.dao.map;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailMap {
	List<Detail> selectDetails();
	Detail selectDetail(int placeId);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(int detailId);
}