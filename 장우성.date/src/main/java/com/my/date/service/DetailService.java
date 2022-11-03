package com.my.date.service;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailService {
	List<Detail> selectDetails(int detailId);
	Detail getDetail(int placeId);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(int detailId);
}