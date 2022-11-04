package com.my.date.dao;

import java.util.List;

import com.my.date.domain.Detail;

public interface DetailDao {
	List<Detail> selectDetails();
	Detail selectDetail(int placeId);
	int insertAddress(int detailId, String postcode, String address, String detailAddress);
	void insertDetail(Detail detail);
	void updateDetail(Detail detail);
	void deleteDetail(int detailId);
}