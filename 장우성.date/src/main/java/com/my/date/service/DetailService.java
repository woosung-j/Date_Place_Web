package com.my.date.service;



import com.my.date.domain.Detail;

public interface DetailService {
	Detail getDetail(int placeId);
	int insertDetail(Detail detail);
	int updateDetail(Detail detail);
}