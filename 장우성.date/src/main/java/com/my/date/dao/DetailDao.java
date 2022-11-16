package com.my.date.dao;

import com.my.date.domain.Detail;

public interface DetailDao {
	Detail selectDetail(int placeId);
	int insertDetail(Detail detail);
	int updateDetail(Detail detail);
	int deleteDetail(int detailId);
}