package com.my.date.service;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailService {
	List<Detail> getDetails();
	Detail getDetail(int placeId);
	void addDetail(Detail detail);
	void fixDetail(Detail detail);
	void delDetail(int detailId);
}