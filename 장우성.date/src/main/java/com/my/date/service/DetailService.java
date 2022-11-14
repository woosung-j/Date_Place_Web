package com.my.date.service;



import com.my.date.domain.Detail;

public interface DetailService {
	Detail getDetail(int placeId);
	int addDetail(Detail detail);
	int fixDetail(Detail detail);
}