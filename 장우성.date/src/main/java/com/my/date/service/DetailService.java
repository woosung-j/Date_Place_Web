package com.my.date.service;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailService {
	List<Detail> selectDetails();
	Detail getDetail(int placeId);
	int insertAddress(int detailId, String postcode, String address, String detailAddress);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(int detailId);
}